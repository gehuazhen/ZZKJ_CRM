<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="ie=edge chrome=1" />
    <link href="../CSS/input.css" rel="stylesheet" />
    <link href="../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" />
    <link href="../lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />

    <script src="../lib/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>

    <script src="../lib/jquery-validation/jquery.validate.js" type="text/javascript"></script>
    <script src="../lib/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
    <script src="../lib/jquery-validation/messages_cn.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/common.js" type="text/javascript"></script>
    <script src="../lib/jquery.form.js" type="text/javascript"></script>

    <script src="../lib/json2.js" type="text/javascript"></script>

    <script src="../JS/XHD.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {

            $.metadata.setType("attr", "validate");
            XHD.validate($(form1));

            //$("#T_Contract_name").focus();

            loadForm(getparastr("id"));
        });

        function loadForm(oaid) {
            $.ajax({
                type: "GET",
                url: "Finance_Receive.form.xhd", /* ע���������ֶ�ӦCS�ķ������� */
                data: { id: oaid, rnd: Math.random() }, /* ע������ĸ�ʽ������ */
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    var obj = eval(result);
                    for (var n in obj) {
                        if (obj[n] == "null" || obj[n] == null)
                            obj[n] = "";
                    }
                    //alert(obj.constructor); //String ���캯��                    
                    $("#form1").ligerAutoForm({
                        labelWidth: 80, inputWidth: 180, space: 20,
                        fields: [
                            {
                                display: '�տ�', type: 'group', icon: '',
                                rows: [
                                    [        
                                        { display: "Ӧ�ձ��", name: "T_receivable", validate: "{required:true}" },
                                        { display: "���ʽ", name: "T_pay_type", type: "select", validate: "{required:true}", options: "{width:180,url:'Sys_Param.combo.xhd?type=pay_type',value:'" + obj.Pay_type_id + "'}" }
                                    ],
                                    [
                                        { display: "Ӧ�ս��", name: "T_receivable_amount", type: "text", options: "{width:180,disabled:true}", validate: "{required:true}", initValue: toMoney(obj.Receive_amount) },
                                        { display: "�տ�ʱ��", name: "T_date", type: "date", options: "{width:180}", validate: "{required:true}", initValue: formatTimebytype(obj.Receive_date, "yyyy-MM-dd") }
                                    ],
                                    [
                                        { display: "�տ���", name: "T_amount", type: "text", options: "{width:180,onChangeValue:function(){ getAmount(); }}", validate: "{required:true}", initValue: toMoney(obj.receivable_amount) },
                                        { display: "�տ���", name: "T_Payee", validate: "{required:true}" }
                                    ],
                                    
                                    [
                                        { display: "��ע", name: "T_Remark", type: "textarea", cols: 73, rows: 4, width: 465, cssClass: "l-textarea", initValue: obj.Remark }
                                    ]
                                ]
                            }
                        ]
                    });

                    $('#T_receivable').ligerComboBox({ width: 180, onBeforeOpen: f_selectReceivable });
                    $('#T_Payee').ligerComboBox({ width: 180, onBeforeOpen: f_selectEmp });

                    $("#T_receivable").val(obj.receivable_no);
                    $("#T_receivable_val").val(obj.Receivable_id);
                    
                    $("#T_Payee").val(obj.payee);
                    $("#T_Payee_val").val(obj.Payee_id);

                    $("#T_order_id").val(obj.order_id);
                }
            });
        }



        function getAmount() {
            $("#T_amount").val(toMoney($("#T_amount").val()));
        }

        function f_save() {
            if ($(form1).valid()) {

                var sendtxt = "&id=" + getparastr("id");
                return $("form :input").fieldSerialize() + sendtxt;
            }
        }
        function f_selectReceivable() {
            top.$.ligerDialog.open({
                zindex: 9003,
                title: 'ѡ���տ', width: 850, height: 400, url: "finance/getReceivable.aspx", buttons: [
                    { text: 'ȷ��', onclick: f_selectReceivableOK },
                    { text: 'ȡ��', onclick: function (item, dialog) { dialog.close(); } }
                ]
            });
            return false;
        }
        function f_selectReceivableOK(item, dialog) {
            var data = dialog.frame.f_select();
            if (!data) {
                alert('��ѡ��Ӧ�տ�!');
                return;
            }

            $("#T_receivable").val(data.receivable_no);
            $("#T_receivable_val").val(data.id);
            $("#T_customer").val(data.cus_name);
            $("#T_receivable_amount").val(toMoney(data.receivable_amount));
            $("#T_order_id").val(data.order_id);
            dialog.close();
        }

        function f_selectEmp()
        {
            top.$.ligerDialog.open({
                zindex: 9003,
                title: 'ѡ��Ա��', width: 850, height: 400, url: "hr/Getemp_Auth.aspx?auth=999", buttons: [
                    { text: 'ȷ��', onclick: f_selectEmpOK },
                    { text: 'ȡ��', onclick: function (item, dialog) { dialog.close(); } }
                ]
            });
            return false;
        }

        function f_selectEmpOK(item, dialog) {
            var data = dialog.frame.f_select();
            if (!data) {
                alert('��ѡ���տ���!');
                return;
            }

            $("#T_Payee").val(data.name);
            $("#T_Payee_val").val(data.id);
            dialog.close();
        }
    </script>

</head>
<body style="">
    <div style="padding: 5px;">
        <form id="form1" onsubmit="return false">
            <input type="hidden" id="T_order_id" name="T_order_id"/>
        </form>
    </div>
</body>
</html>
