<%@ Page Language="C#" AutoEventWireup="true"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head  >
    <title></title>
    <link href="../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" />
    <link href="../lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />

    <script src="../lib/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
    
    <script src="../lib/jquery-validation/jquery.validate.js" type="text/javascript"></script>
    <script src="../lib/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
    <script src="../lib/jquery-validation/messages_cn.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/common.js" type="text/javascript"></script>
    <script src="../JS/XHD.js" type="text/javascript"></script>
    <script src="../lib/jquery.form.js" type="text/javascript"></script>
    <script type="text/javascript">
        var dialog = frameElement.dialog;
        $(function () {
            $.metadata.setType("attr", "validate");
            XHD.validate($(form1));

            //$("#T_Contract_name").focus();
            $("form").ligerForm();
        });

        function f_save() {
            if ($(form1).valid()) {
                var sendtxt = "";
                var issave = $("form :input").fieldSerialize() + sendtxt;
                $.ajax({
                    url: "hr_employee.changepwd.xhd", type: "POST",
                    data: issave,
                    dataType: "json",
                    success: function (result) {
                        $.ligerDialog.closeWaitting();
                        var obj = eval(result);

                        if (obj.isSuccess) {
                            dialog.close();
                        }
                        else {
                            $.ligerDialog.error(obj.Message);
                        }
                    },
                    error: function () {
                        $.ligerDialog.closeWaitting();
                        $.ligerDialog.error('����ʧ�ܣ�ϵͳ����');
                    }
                });
            }
        }
    </script>
</head>
<body style="margin:5px 5px 5px 5px">
    <form id="form1" onsubmit="return false">
                        
    <div>
        <table class="aztable" border="0" cellpadding="3" cellspacing="1" 
            style="background: #fff; width:280px;">
            
            <tr>
                <td height="23" width="70px" ><div align="right" style="width: 61px">
                    ԭ���룺</div></td>
                <td height="23" >
                        <input type="password" id="T_oldpwd" name="T_oldpwd"    ltype="password" ligerui="{width:180}" 
                            validate="{required:true,minlength:4,maxlength:25,messages:{required:'������ԭ����'}}"  />
                    
                </td>
            </tr>

            <tr>
                <td height="23" width="70px" ><div align="right" style="width: 61px">
                    �����룺</div></td>
                <td height="23" >
                  
                        <input type="password" id="T_newpwd"  name="T_newpwd"   ligerui="{width:180}" 
                             validate="{required:true,minlength:4,maxlength:25,messages:{required:'������������'}}" ltype="password"  />
                    
                </td>
            </tr>

             <tr>
                <td height="23" width="70px" >
                    <div align="right" style="width: 62px">ȷ�����룺</div>
                    
                 </td>
                <td height="23" >
                   
                        <input type="password" id="T_confime" name="T_confime"  ligerui="{width:180}" 
                             validate="{required:true,minlength:4,maxlength:25,equalTo:'#T_newpwd',equalTo:'#T_newpwd',messages:{required:'���ٴ�����������'}}" ltype="password" />
                  
                    
                </td>
            </tr>

             <tr>
                <td height="23" width="70px" >
                    </td>
                <td height="23" >
                    &nbsp;</td>
            </tr>

             </table>
    </div>
    </form>
</body>
</html>
