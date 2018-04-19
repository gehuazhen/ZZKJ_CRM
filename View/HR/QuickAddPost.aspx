<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title></title>
    <link href="../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" />
    <link href="../lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />

    <link href="../CSS/input.css" rel="stylesheet" type="text/css" />

    <script src="../lib/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>

    <script src="../lib/jquery-validation/jquery.validate.js" type="text/javascript"></script>
    <script src="../lib/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
    <script src="../lib/jquery-validation/messages_cn.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/common.js" type="text/javascript"></script>
    <script src="../JS/XHD.js" type="text/javascript"></script>
    <script src="../lib/jquery.form.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            $.metadata.setType("attr", "validate");
            XHD.validate($(form1));

            //$("#T_Contract_name").focus();
            $("form").ligerForm();

            $("#T_depname").ligerComboBox({
                width: 150,
                selectBoxWidth: 150,
                selectBoxHeight: 150,
                valueField: 'id',
                textField: 'text',
                treeLeafOnly: false,
                initValue: getparastr("depid"),
                readonly: false,
                tree: {
                    url: 'hr_department.tree.xhd?rnd=' + Math.random(),
                    idFieldName: 'id',                    
                    checkbox: false
                }
            })


            $("#T_position").ligerComboBox({
                width: 150,
                selectBoxWidth: 150,
                selectBoxHeight: 150,
                valueField: 'id',
                textField: 'text',
                url: "hr_position.combo.xhd",
                onSelected: positionselected
            });
        });

        function positionselected(newval) {
            //alert(newval);
            //$("#T_position_leavel").val(newval);
            $.ajax({
                type: "GET",
                url: "hr_position.getlevel.xhd", /* ע���������ֶ�ӦCS�ķ������� */
                data: { id: newval, rnd: Math.random() }, /* ע������ĸ�ʽ������ */
                contentType: "application/json; charset=utf-8",
                success: function (result) {
                    $("#T_position_leavel").val(result);
                }
            });
        }

        function f_save() {
            if ($(form1).valid()) {
                var sendtxt = "&T_emp=&T_emp_val=&postid=" + getparastr("postid");
                return $("form :input").fieldSerialize() + sendtxt;
            }
        }


    </script>
</head>
<body>
    <form id="form1" onsubmit="return false">

        <table border="0" cellpadding="3" cellspacing="1" style="width: 462px;" class="aztable">

            <tr>
                <td>
                    <div align="left" style="width: 60px">��λ���ƣ�</div>
                </td>
                <td>
                    <input type='text' id="T_postname" name="T_postname" ltype="text" ligerui="{width:150}" validate="{required:true}" /></td>
                <td>
                    <div align="left" style="width: 60px">�������ƣ�</div>
                </td>
                <td>
                    <input type="text" id="T_depname" name="T_depname" validate="{required:true}" />
                </td>
            </tr>
            <tr>
                <td>
                    <div align="left" style="width: 60px">��λ����</div>
                </td>
                <td>
                    <input type="text" id="T_position" name="T_position" validate="{required:true}" /></td>
                <td>
                    <div align="left" style="width: 60px">��������</div>
                </td>
                <td>
                    <input type='text' id="T_position_leavel" name="T_position_leavel" ltype='text' ligerui="{width:150,disabled:true}" value="20" validate="{required:true}" /></td>
            </tr>
            
            <tr>
                <td style="vertical-align: top">
                    <div align="left" style="width: 54px">������</div>
                </td>
                <td colspan="3">
                    <input type="text" id="T_descript" name="T_descript" ltype="text" ligerui="{width:390}" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
