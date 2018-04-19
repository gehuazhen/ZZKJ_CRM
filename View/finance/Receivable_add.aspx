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

        var customer_id = null;

        function loadForm(oaid) {
            $.ajax({
                type: "GET",
                url: "Finance_Receivable.form.xhd", /* ע���������ֶ�ӦCS�ķ������� */
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

                    customer_id = obj.Cus_id || getparastr("customer_id");

                    $("#form1").ligerAutoForm({
                        labelWidth: 80, inputWidth: 180, space: 20,
                        fields: [
                            {
                                display: 'Ӧ�տ�', type: 'group', icon: '',
                                rows: [
                                    [
                                        { display: "�������", name: "T_order", validate: "{required:true}" },
                                        { display: "�����ͻ�", name: "T_customer", type: "text", options: "{width:180,disabled:true}", initValue: obj.cus_name }
                                    ],
                                    [
                                        { display: "�������", name: "T_order_amount", type: "text", options: "{width:180,disabled:true}", validate: "{required:true}", initValue: toMoney(obj.Order_amount) },
                                        { display: "Ӧ��ʱ��", name: "T_date", type: "date", options: "{width:180}", validate: "{required:true}", initValue: formatTimebytype(obj.receivable_time, "yyyy-MM-dd") }
                                    ],
                                    [
                                        { display: "Ӧ�ս��", name: "T_amount", type: "text", options: "{width:180,onChangeValue:function(){ getAmount(); }}", validate: "{required:true}", initValue: toMoney(obj.receivable_amount) }
                                    ],
                                    [
                                        { display: "��ע", name: "T_Remark", type: "textarea", cols: 73, rows: 4, width: 465, cssClass: "l-textarea", initValue: obj.Remark }
                                    ]
                                ]
                            }
                        ]
                    });

                    $('#T_order').ligerComboBox({ width: 180, onBeforeOpen: f_selectorder });

                    $("#T_order").val(obj.Order_no);
                    $("#T_order_val").val(obj.order_id);
                }
            });
        }



        function getAmount() {
            $("#T_amount").val(toMoney($("#T_amount").val()));
        }

        function f_save() {
            if ($(form1).valid()) {

                var sendtxt = "&id=" + getparastr("id") ;
                return $("form :input").fieldSerialize() + sendtxt;
            }
        }
        function f_selectorder() {
            top.$.ligerDialog.open({
                zindex: 9003,
                title: 'ѡ�񶩵�', width: 850, height: 400, url: "sale/getorder.aspx?customer_id=" + customer_id, buttons: [
                    { text: 'ȷ��', onclick: f_selectOrderOK },
                    { text: 'ȡ��', onclick: function (item, dialog) { dialog.close(); } }
                ]
            });
            return false;
        }
        function f_selectOrderOK(item, dialog) {
            var data = dialog.frame.f_select();
            if (!data) {
                alert('��ѡ�񶩵�!');
                return;
            }

            $("#T_order").val(data.Serialnumber);
            $("#T_order_val").val(data.id);
            $("#T_customer").val(data.cus_name);
            $("#T_order_amount").val(toMoney(data.Order_amount));
            dialog.close();
        }

        function f_selectContactCancel(item, dialog) {
            dialog.close();
        }


    </script>

</head>
<body style="">
    <div style="padding: 5px;">
        <form id="form1" onsubmit="return false">
        </form>
    </div>
</body>
</html>
