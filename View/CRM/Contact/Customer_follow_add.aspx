<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="ie=edge chrome=1" />
    <link href="../../CSS/input.css" rel="stylesheet" />
    <link href="../../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" />
    <link href="../../lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />

    <script src="../../lib/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>

    <script src="../../lib/jquery-validation/jquery.validate.js" type="text/javascript"></script>
    <script src="../../lib/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
    <script src="../../lib/jquery-validation/messages_cn.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/common.js" type="text/javascript"></script>
    <script src="../../lib/jquery.form.js" type="text/javascript"></script>
    <script src="../../JS/XHD.js" type="text/javascript"></script>
    <script type="text/javascript">
        var customer_id;
        $(function () {
            $.metadata.setType("attr", "validate");
            XHD.validate($(form1));

            loadForm(getparastr("id"));            
        })

        function f_save() {
            if ($(form1).valid()) {
                var sendtxt = "&customer_id=" + getparastr("customer_id") + "&id=" + getparastr("id");
                return $("form :input").fieldSerialize() + sendtxt;
            }
        }

        function loadForm(oaid) {
            $.ajax({
                type: "GET",
                url: "CRM_follow.form.xhd", /* ע���������ֶ�ӦCS�ķ������� */
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

                    customer_id = obj.customer_id || getparastr("customer_id");
                    if (!customer_id)
                        rows.push([{ display: "�ͻ�", name: "T_customer", validate: "{required:true}", width: 465 }])

                    rows.push(                        
                        [
                            { display: "����Ŀ��", name: "T_followaim", type: "select", options: "{width:180,url:'Sys_Param.combo.xhd?type=follow_aim',value:'" + obj.follow_aim_id + "'}", validate: "{required:true}" },
                            { display: "������ʽ", name: "T_followtype", type: "select", options: "{width:180,url:'Sys_Param.combo.xhd?type=follow_type',value:'" + obj.follow_type_id + "'}", validate: "{required:true}" }
                        ],
                        [
                            { display: "��ϵ��", name: "T_contact" }
                        ],
                        [
                            { display: "��������", name: "T_follow", type: "textarea", cols: 73, rows: 6, width: 465, cssClass: "l-textarea", validate: "{required:true}", initValue: obj.follow_content }
                        ]
                        );

                    $("#form1").ligerAutoForm({
                        labelWidth: 80, inputWidth: 180, space: 20,
                        fields: [
                            {
                                display: '����', type: 'group', icon: '',
                                rows: rows
                            }
                        ]
                    });

                    $('#T_customer').ligerComboBox({
                        width: 465,
                        onBeforeOpen: f_selectCustomer
                    });
                    $("#T_customer").val(obj.Customer_name);
                    $("#T_customer_val").val(obj.customer_id);

                    $('#T_contact').ligerComboBox({
                        width: 180,
                        onBeforeOpen: f_selectContact
                    });
                    $("#T_contact").val(obj.contact_name);
                    $("#T_contact_val").val(obj.contact_id);
                }
            });

        }
        
        function f_selectCustomer() {
            top.$.ligerDialog.open({
                zindex: 9005, title: 'ѡ��ͻ�', width: 650, height: 300, url: 'crm/customer/getCustomer.aspx', buttons: [
                    { text: 'ȷ��', onclick: f_selectCustomerOK },
                    { text: 'ȡ��', onclick: f_selectContactCancel }
                ]
            });
            return false;
        }

        function f_selectCustomerOK(item, dialog) {
            var data = dialog.frame.f_select();
            if (!data) {
                alert('��ѡ����!');
                return;
            }
            $("#T_customer").val(data.cus_name);
            $("#T_customer_val").val(data.id);
            customer_id = data.id;
            dialog.close();
        }

        function f_selectContact() {
            if (!customer_id)
            {
                $.ligerDialog.warn("����ѡ��ͻ�");
                return;
            }
            top.$.ligerDialog.open({
                zindex: 9005, title: 'ѡ����ϵ��', width: 650, height: 300, url: 'crm/customer/getContact.aspx?customerid=' + customer_id, buttons: [
                    { text: 'ȷ��', onclick: f_selectContactOK },
                    { text: 'ȡ��', onclick: f_selectContactCancel }
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
            $("#T_contact").val(data.C_name);
            $("#T_contact_val").val(data.id);
            dialog.close();
        }
        function f_selectContactCancel(item, dialog) {
            dialog.close();
        }
    </script>
</head>
<body>
    <div style="padding: 10px;">
        <form id="form1" onsubmit="return false">
            <%--<table class="bodytable0" style="width: 597px; margin: 2px;">
            <tr>
                <td class="table_title1" colspan="2">����</td>
            </tr>
            <tr>

                <td class="table_label">��ϵ�ˣ�</td>
                <td>                   
                    <input type="text" id="T_contact" name="T_contact"  />

                </td>
            </tr>
            <tr>

                <td class="table_label">����Ŀ�ģ�</td>
                <td>
                    <input type="text" id="T_followaim" name="T_followaim" validate="{required:true}" /></td>
            </tr>
            <tr>

                <td class="table_label"> ������ʽ��
                </td>
                <td>
                    <input type="text" id="T_followtype" name="T_followtype" validate="{required:true}" /></td>
            </tr>
            <tr>
                <td class="table_label"> �������ݣ�</td>
                <td>
                    <textarea id="T_follow" cols="6" name="T_follow" class="l-textarea" style="width: 440px;" rows="10" validate="{required:true}"></textarea></td>

            </tr>
            
        </table>--%>
        </form>
    </div>
</body>
</html>
