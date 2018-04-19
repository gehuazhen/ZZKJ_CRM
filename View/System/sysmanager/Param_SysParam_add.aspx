<%@ Page Language="C#" AutoEventWireup="true"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head  >
    <title></title>
    <link href="../../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" />
    <link href="../../lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />
    <link href="../../CSS/input.css" rel="stylesheet" type="text/css" />

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
            $("form").ligerForm();


            if (getparastr("paramid")) {
                loadForm(getparastr("paramid"));
            }

            $("#T_param_name").attr("validate", "{ required: true, remote: remote, messages: { required: '���������', remote: '�˲����Ѵ���!' } }");
        });
        function remote() {
            var url = "Sys_Param.validate.xhd?T_cid=" + getparastr("paramid") + "&parentid=" + getparastr("parentid") + "&rnd=" + Math.random();
            return url;
        }
        function f_save() {
            if ($(form1).valid()) {
                var sendtxt = "&paramid=" + getparastr("paramid") + "&parentid=" + getparastr("parentid");
                return $("form :input").fieldSerialize() + sendtxt;
            }
        }

        function loadForm(oaid) {
            $.ajax({
                type: "GET",
                url: "Sys_Param.form.xhd", /* ע���������ֶ�ӦCS�ķ������� */
                data: { paramid: oaid, rnd: Math.random() }, /* ע������ĸ�ʽ������ */
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    var obj = eval(result);
                    for (var n in obj) {
                        
                    }
                    //alert(obj.constructor); //String ���캯��
                    $("#T_param_name").val(obj.params_name);
                    $("#T_param_order").val(obj.params_order);                   
                }
            });
        }
        
    </script>
</head>
<body style="margin:5px 5px 5px 5px">
    <form id="form1" onsubmit="return false">
    <div>
        <table  align="left" border="0" cellpadding="3" cellspacing="1" 
            style="background: #fff; width:320px;" class="aztable">
            
            <tr>
                <td  width="65px"  ><div align="left" style="width: 61px">�������ƣ�</div></td>
                <td   >
                    <div style="float:left; height: 20px;">
                        <input type="text" id="T_param_name" name="T_param_name" ltype="text"   ligerui="{width:180}" validate="{required:true}" />
                    </div>                    
                </td>
            </tr>
            
            <tr>
                <td  width="65px"  ><div align="left" style="width: 61px">��������</div></td>
                <td   >
                    <input type="text" id="T_param_order" name="T_param_order" value="20"  ltype='spinner' ligerui="{type:'int',width:180}"/>
                </td>
            </tr>
            </table>
    </div>
    </form>
</body>
</html>
