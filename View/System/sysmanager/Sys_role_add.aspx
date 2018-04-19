<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" />
    <link href="../../lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />

    <script src="../../lib/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>

    <script src="../../lib/jquery-validation/jquery.validate.js" type="text/javascript"></script>
    <script src="../../lib/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
    <script src="../../lib/jquery-validation/messages_cn.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/common.js" type="text/javascript"></script>
    <script src="../../JS/XHD.js" type="text/javascript"></script>
    <script src="../../lib/jquery.form.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $.metadata.setType("attr", "validate");
            XHD.validate($(form1));

            //$("#T_Contract_name").focus();
            //$("form").ligerForm();

            loadForm(getparastr("id"));
            $("#T_role").attr("validate", "{ required: true, remote: remote, messages: { required: '�������ɫ��', remote: '��ɫ���Ѿ�����!' } }");
        });

        function f_save() {
            if ($(form1).valid()) {
                var sendtxt = "&id=" + getparastr("id");
                return $("form :input").fieldSerialize() + sendtxt;
            }
        }
        var data1 = [{ id: 1, text: '����' }, { id: 2, text: '����' }, { id: 3, text: '�������¼�' }, { id: 4, text: 'ָ������' }, { id: 5, text: 'ȫ��' }];
        function loadForm(oaid) {
            $.ajax({
                type: "GET",
                url: "Sys_role.form.xhd", /* ע���������ֶ�ӦCS�ķ������� */
                data: { id: oaid, rnd: Math.random() }, /* ע������ĸ�ʽ������ */
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    var obj = eval(result);
                    for (var n in obj) {

                    }
                    if (!obj.RoleSort)
                        obj.RoleSort = 10;

                    if (!obj.PublicAuth)
                        obj.PublicAuth = 0;

                    //alert(obj.constructor); //String ���캯��
                    //$("#T_role").val(obj.RoleName);
                    //$("#T_RoleOrder").val(obj.RoleSort);
                    //$("#T_Descript").val(obj.T_Descript);
                    $("#form1").ligerAutoForm({
                        labelWidth: 80, inputWidth: 180, space: 20,
                        fields: [
                            {
                                display: '��ɫ', type: 'group', icon: '',
                                rows: [
                                    [
                                        { display: "��ɫ��", name: "T_role", type: "text", options: "{width:180}", validate: "{required:true}", initValue: obj.RoleName },
                                        { display: "����", name: "T_RoleOrder", type: "spinner", options: "{width:180,type:'int',value:'" + obj.RoleSort + "'}", validate: "{required:true}" }

                                    ],
                                  
                                     [
                                        { display: "����Ȩ��", name: "T_auth", type: "select", options: "{width:180,data:data1, value: " + obj.DataAuth + "}", validate: "{required:true}" },
                                        { display: "�����޸�", name: "T_public", type: "select", options: "{width:180,data:[{id:0,text:'��'},{id:1,text:'��'}],selectBoxHeight:50, value: " + obj.PublicAuth + "}", validate: "{required:true}" }
                                     ],
                                    [
                                        { display: "��ע", name: "T_Descript", type: "textarea", cols: 74, rows: 4, width: 465, cssClass: "l-textarea", initValue: obj.RoleDscript }
                                    ]
                                ]
                            }
                        ]
                    });

                }
            });
        }
        function remote() {
            var url = "Sys_role.Exist.xhd?T_cid=" + getparastr("id") + "&rnd=" + Math.random();
            return url;
        }
    </script>
    <style type="text/css">
        .style1 { text-align: left; }
    </style>
    <script type="text/javascript">
        
    </script>
</head>
<body>
    <form id="form1" onsubmit="return false">
    </form>
</body>
</html>
