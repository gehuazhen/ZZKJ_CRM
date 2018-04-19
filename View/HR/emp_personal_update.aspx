<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
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
        var dialog = frameElement.dialog;
        $(function () {
           
            $.metadata.setType("attr", "validate");
            XHD.validate($(form1));

            //$("#T_Contract_name").focus();
            $("form").ligerForm();

            loadForm(getCookie());
            $("#uploadimg").ligerButton({ text: "�ϴ�ͷ��", width: 130, click: uploadimg });
        });

        function loadForm(oaid) {
            $.ajax({
                type: "GET",
                url: "hr_employee.form.xhd", /* ע���������ֶ�ӦCS�ķ������� */
                data: { id: "epu", rnd: Math.random() }, /* ע������ĸ�ʽ������ */
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    var obj = eval(result);
                    for (var n in obj) {
                        if (obj[n] == null)
                            obj[n] = "";
                    }
                    //alert(obj.constructor); //String ���캯��                  
                    $("#T_email").val(obj.email);
                    $("#T_name").val(obj.name);
                    $("#T_birthday").val(obj.birthday);
                    $("#T_idcard").val(obj.idcard);
                    $("#T_tel").val(obj.tel);
                    $("#T_Adress").val(obj.address);
                    $("#T_school").val(obj.schools);
                    $("#T_edu").val(obj.education);
                    $("#T_professional").val(obj.professional);

                    $("#T_sex").ligerGetComboBoxManager().selectValue(obj.sex);

                    if (!obj.title)
                        obj.title = "images/noheader.png";

                    $("#headurl").val(obj.title);
                    $("#userheadimg").attr("src", "../file/header/" + obj.title);

                }
            });
        }

       

        function uploadimg() {
            top.$.ligerDialog.open({
                zindex: 9004,
                width: 800, height: 500,
                title: '�ϴ�ͷ��',
                url: 'hr/headimage.aspx',
                buttons: [
                {
                    text: '����', onclick: function (item, dialog) {
                        saveheadimg(item, dialog);
                    }
                },
                {
                    text: '�ر�', onclick: function (item, dialog) {
                        dialog.close();
                    }
                }
                ],
                isResize: true
            });
        }

        function saveheadimg(item, dialog) {
            var upfile = dialog.frame.f_save();
            //alert(upfile);
            if (upfile) {
                dialog.close();
                $.ligerDialog.waitting('���ݱ�����,���Ժ�...');

                $.ajax({
                    url: "hr_employee.Base64Upload.xhd", type: "POST",
                    data: upfile,
                    dataType: "json",
                    success: function (result) {
                        $.ligerDialog.closeWaitting();

                        var obj = eval(result);
                        if (obj.isSuccess) {
                            $("#headurl").val(obj.Message);
                            $("#userheadimg").attr("src", "../file/header/" + obj.Message);
                        }
                        else {
                            $.ligerDialog.error(obj.Message);
                        }


                    },
                    error: function () {
                        $.ligerDialog.closeWaitting();
                        $.ligerDialog.error('����ʧ�ܣ�');
                    }
                });
            }
        }

        function f_save() {
            if ($(form1).valid()) {
                var sendtxt = "&id=epu";
                issave = $("form :input").fieldSerialize() + sendtxt;

                $.ajax({
                    url: "hr_employee.PersonalUpdate.xhd", type: "POST",
                    data: issave,
                    dataType: "json",
                    success: function (result) {
                        $.ligerDialog.closeWaitting();
                        var obj = eval(result);

                        if (obj.isSuccess) {
                            top.getuserinfo();
                            dialog.close();
                        }
                        else {
                            top.$.ligerDialog.error(obj.Message);
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
<body style="margin: 0; overflow: hidden">
    <form id="form1" onsubmit="return false">
        <div>
            <table class="aztable">
                <tr>
                    <td width="62px">
                        <div align="right" style="width: 62px">������</div>
                    </td>
                    <td width="182px">
                        <input type="text" id="T_name" name="T_name" ltype="text" ligerui="{width:180}" validate="{required:true,minlength:1,maxlength:10,messages:{required:'����������',maxlength:'�����������ô���'}}" /></td>
                    <td width="62px">
                        <div align="right" style="width: 61px">
                            Email��
                        </div>
                    </td>
                    <td width="182px">
                        <input type="text" id="T_email" name="T_email" ltype="text" ligerui="{width:180}" validate="{required:false,email:true}" /></td>
                    <td width="132px" rowspan="5">
                        <img id="userheadimg" src="a.gif" onerror="noheadimg()" style="border-radius: 4px; box-shadow: 1px 1px 3px #111; width: 120px; height: 120px; margin-left: 5px; background: #d2d2f2; border: 3px solid #fff; behavior: url(../css/pie.htc);" />

                    </td>
                </tr>
                <tr>
                    <td>
                        <div align="right" style="width: 62px">�Ա�</div>
                    </td>
                    <td>
                        <input type="text" id="T_sex" name="T_sex" style="width: 50px" ltype="select" ligerui="{width:50,data:[{id:'��',text:'��'},{id:'Ů',text:'Ů'}]}" validate="{required:true}" /></td>
                    <td>
                        <div align="right" style="width: 62px">���գ�</div>
                    </td>
                    <td>
                        <input type="text" id="T_birthday" name="T_birthday" ltype="date" ligerui="{width:180}" /></td>
                </tr>
                <tr>
                    <td>
                        <div align="right" style="width: 61px">
                            �ֻ���
                        </div>
                    </td>
                    <td style="width: 130px">
                        <input type="text" id="T_tel" name="T_tel" ltype="text" ligerui="{width:180}" validate="{required:false,cellphone:true,messages:{required:'�������ֻ���'}}" /></td>
                    <td>
                        <div align="right" style="width: 61px">
                            ���֤��
                        </div>
                    </td>
                    <td>
                        <input type="text" id="T_idcard" name="T_idcard" ltype="text" ligerui="{width:180}" validate="{required:false,IdNumber:true,messages:{required:'���������֤����'}}" /></td>
                </tr>
                <tr>
                    <td>
                        <div align="right" style="width: 61px">
                            ��ַ��
                        </div>
                    </td>
                    <td colspan="3">
                        <input type="text" id="T_Adress" name="T_Adress" ltype="text" ligerui="{width:433}" /></td>
                </tr>
                <tr>
                    <td>
                        <div align="right" style="width: 62px">��ҵԺУ��</div>
                    </td>
                    <td colspan="3">
                        <input type="text" id="T_school" name="T_school" ltype="text" ligerui="{width:433}" /></td>
                </tr>
                <tr>
                    <td>
                        <div align="right" style="width: 61px">
                            ѧ����
                        </div>
                    </td>
                    <td>
                        <input type="text" id="T_edu" name="T_edu" ltype="text" ligerui="{width:180}" /></td>
                    <td>
                        <div align="right" style="width: 62px">רҵ��</div>
                    </td>
                    <td>
                        <input type="text" id="T_professional" name="T_professional" ltype="text" ligerui="{width:180}" /></td>
                    <td>
                        <input type="hidden" id="headurl" name="headurl" />
                        <div style="text-align: center">
                            <div id="uploadimg"></div>
                        </div>

                    </td>
                </tr>

            </table>
        </div>
    </form>


</body>
</html>
