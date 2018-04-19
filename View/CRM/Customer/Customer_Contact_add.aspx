<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="ie=edge chrome=1" />
    <link href="../../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" />
    <link href="../../lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />
    <link href="../../CSS/input.css" rel="stylesheet" />

    <script src="../../lib/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>

    <script src="../../lib/jquery-validation/jquery.validate.js" type="text/javascript"></script>
    <script src="../../lib/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
    <script src="../../lib/jquery-validation/messages_cn.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/common.js" type="text/javascript"></script>
    <script src="../../lib/jquery.form.js" type="text/javascript"></script>
    <script src="../../JS/XHD.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $.metadata.setType("attr", "validate");
            XHD.validate($(form1));


            loadForm(getparastr("id"));            
        })
        function f_save() {
            if ($(form1).valid()) {
                var sendtxt = "&contact_id=" + getparastr("id");
                sendtxt += "&customer_id=" + getparastr("customer_id");
                return $("form :input").fieldSerialize() + sendtxt;
            }
        }
        
        function loadForm(oaid) {
            $.ajax({
                type: "GET",
                url: "CRM_Contact.form.xhd", /* ע���������ֶ�ӦCS�ķ������� */
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

                    var rows = [];

                    var customer_id = obj.customer_id || getparastr("customer_id");

                    if (!customer_id)
                        rows.push([{ display: "�ͻ�", name: "T_company", width: 465 }])

                    rows.push(
                        [
                            { display: "����", name: "T_contact", type: "text", options: "{width:180}", validate: "{required:true}", initValue: obj.C_name },
                            { display: "�Ա�", name: "T_sex", type: "select", options: "{width:180,data:[{id:'0',text:'��'},{id:'1',text:'Ů'}], emptyText: '���գ�',value:'" + obj.C_sex + "'}" }
                        ],
                        [
                            { display: "����", name: "T_dep", type: "text", options: "{width:180}", initValue: obj.C_department },
                            { display: "ְ��", name: "T_position", type: "text", options: "{width:180}", initValue: obj.C_position }
                        ],
                        [
                            { display: "�绰", name: "T_tel", type: "text", options: "{width:180}", initValue: obj.C_tel },
                            { display: "�ֻ�", name: "T_mobil", type: "text", options: "{width:180}", initValue: obj.C_mob }
                        ],
                        [
                            { display: "����", name: "T_fax", type: "text", options: "{width:180}", initValue: obj.C_fax },
                            { display: "�ʼ�", name: "T_email", type: "text", options: "{width:180}", initValue: obj.C_email }
                        ],
                        [
                            { display: "QQ", name: "T_qq", type: "text", options: "{width:180}", initValue: obj.C_QQ },
                            { display: "����", name: "T_birthday", type: "date", options: "{width:180}", initValue: formatTimebytype(obj.C_birthday, "yyyy-MM-dd") }
                        ],
                        [
                            { display: "��ַ", name: "T_add", type: "text", options: "{width:465}", initValue: obj.C_add, width: 465 }
                        ],
                        [
                            { display: "����", name: "T_hobby", type: "text", options: "{width:465}", initValue: obj.C_hobby, width: 465 }
                        ],
                        [
                            { display: "��ע", name: "T_remarks", type: "text", options: "{width:465}", initValue: obj.C_remarks, width: 465 }
                        ]
                        );

                    $("#form1").ligerAutoForm({
                        labelWidth: 80, inputWidth: 180, labelWidth: 80, space: 20,
                        fields: [
                            {
                                display: '��ϵ��', type: 'group', icon: '',
                                rows: rows
                            }
                        ]
                    });


                    $('#T_company').ligerComboBox({
                        width: 465,
                        onBeforeOpen: f_selectContact
                    });

                }
            });


        }
        function f_selectContact() {
            $.ligerDialog.open({
                title: 'ѡ����ϵ��', width: 650, height: 300, url: 'getcustomer.aspx', buttons: [
                    { text: 'ȷ��', onclick: f_selectContactOK },
                    {
                        text: 'ȡ��', onclick: function (item, dialog) {
                            dialog.close();
                        }
                    }
                ]
            });
            return false;
        }
        function f_selectContactOK(item, dialog) {
            var data = dialog.frame.f_select();
            if (!data) {
                alert('��ѡ����!');
                return;
            }
            $("#T_company").val(data.cus_name);
            $("#T_company_val").val(data.id);
            dialog.close();
        }
        
        function remotesite() {
            var url = "CRM_Customer.validate.xhd?T_cid=" + getparastr("cid") + "&rnd=" + Math.random();
            return url;
        }

    </script>
</head>
<body>
    <div style="padding: 10px;">
        <form id="form1" onsubmit="return false">
        </form>

    </div>
</body>
</html>
