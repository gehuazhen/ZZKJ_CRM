<%@ Page Language="C#" AutoEventWireup="true" %>

<%
    //ˢ�¾�̬��������  
    XHD.Server.install inss = new XHD.Server.install();
    string filename = Server.MapPath("/conn.config");
    inss.CheckConfig(filename);
    string filename1 = Server.MapPath("/Web.config");
    inss.CheckConfig(filename1);

    //�ж��Ƿ�������
    XHD.Server.install ins = new XHD.Server.install();
    int configed = ins.configed();

    if (configed == 1)
    {
        Response.Redirect("remind.aspx");
    }

%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta content="ie=8 chrome=1" http-equiv="X-UA-Compatible">
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>С�ƶ�CRM-��װ</title>

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
        var btn_next;
        $(function () {
            $.metadata.setType("attr", "validate");
            XHD.validate($(form1));

            $("form").ligerForm();

            $("#btn_test").ligerButton({ text: "��������", width: 60, click: check });
            btn_next = $("#btn_next").ligerButton({ text: "��ʼ��װ", width: 60, click: runconfig });
            btn_next.setDisabled();
        });
        function check() {
            if ($(form1).valid()) {
                var sendtxt = $("form :input").fieldSerialize() + "&rnd=" + Math.random();
                $.ajax({
                    type: 'post',
                    url: 'install.checkconnect.xhd',
                    data: sendtxt,
                    beforeSend: function () {
                        $.ligerDialog.waitting("�����...");                       
                    },
                    success: function (result) {
                        $.ligerDialog.closeWaitting();

                        if (result == "false:connect") {
                            $.ligerDialog.error("���Ӵ�����������������û��������룡");
                            btn_next.setDisabled();
                        }
                        else if (result == "false:configed") {
                            $.ligerDialog.error('���ʧ�ܣ�ϵͳ�Ѿ����ù��������������ã�����conn.config�ļ����CompleteConfig������Ϊfalse��');
                            btn_next.setDisabled();
                        }
                        else if (result == "warn:dbname") {
                            $.ligerDialog.warn('�Ѵ�����Ϊ"' + $("#t_db_name").val() + '"�����ݿ�,�뱣֤�����ݿ�����С�ƶ�CRM����ر�<br/>�����ӳɹ������Կ�ʼ���á�');
                            btn_next.setEnabled();
                        }
                        else if (result == "false:dbfile") {
                            $.ligerDialog.error('App_Data�ļ������Ѵ�����Ϊ"' + $("#t_db_name").val() + '.mdf"���ļ�');
                            btn_next.setDisabled();
                        }
                        else if (result == "success") {
                            $.ligerDialog.success("���ӳɹ������Կ�ʼ���á�");
                            btn_next.setEnabled();
                        }
                        else {
                            $.ligerDialog.error("ϵͳ����");
                            btn_next.setDisabled();
                        }
                     

                    },
                    error: function () {
                        $.ligerDialog.closeWaitting();
                        $.ligerDialog.error("���ʧ��!");
                    }

                });

            }
            else {
                btn_next.setDisabled();
            }
        }
        function runconfig() {
            if ($(form1).valid()) {
                var sendtxt = $("form :input").fieldSerialize() + "&rnd=" + Math.random();
                $.ajax({
                    type: 'post',
                    url: 'install.startconfig.xhd',
                    data: sendtxt,
                    beforeSend: function () {
                        $.ligerDialog.waitting("ϵͳ������,���Ժ�...");
                        $("#btn_next").attr("disabled", "disabled");
                    },
                    success: function (result) {
                        window.location.href = "success.aspx";
                    },
                    error: function () {
                        $.ligerDialog.closeWaitting();
                        $.ligerDialog.error("����ʧ�ܣ�ϵͳ����<br/>1��������˺��Ƿ��д������ݿ��Ȩ�ޡ�<br/>2�����Ѵ������ݿ⣬�뱣֤�����ݿ�����С�ƶ�CRM����ر�<br/>3����ϵС�ƶ�CRM�ٷ�������Ա�����");
                    }
                });
            }
            else {
                $("#btn_next").attr("disabled", "disabled");
            }
        }
        function btn_reset() {
            $("#btn_next").attr("disabled", "disabled");
        }
    </script>
    <style type="text/css">
        span { font-weight: bolder; }
        img { border: none; }
        .text { border: #d2e2f2 1px solid; height: 19px; }
        body { BACKGROUND: url(../images/login/login_bg.png) repeat-x; font-size: 12px; }
        .bodytable0 td { height: 30px; }
    </style>
    <script type="text/javascript">
        if (top.location != self.location) top.location = self.location;
    </script>
</head>
<body>
    <form id="form1" name="form1">

        <div style="width: 731px; margin-left: 50px; margin-top: 100px;">
            <table class="bodytable3" id="Table1" width="732" height="358" border="0" cellpadding="0" cellspacing="0">
                 <tr>
                    <td style="height:40px;">
                        <span style="font-size: 28px; font-weight: bolder;">��ӭʹ��С�ƶ�CRM</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td style="width: 400px;">
                                    <p>
                                        <span style="color:#ff0;font-weight:bolder;">Step3:</span>���ڶ��������л����������á�
                                   
                                    </p>
                                </td>
                                <td style="width: 300px; text-align: center;">
                                    <img src="../images/logo/logo.png" width="234" alt="XHD crm" /></td>
                            </tr>
                        </table>
                        <div style="box-shadow: 5px 20px 20px rgba(0,0,0,0.3); background: #fff;">
                            <table class="bodytable0" style="width: 100%; margin: -1px; line-height: 25px;">

                                <tr>
                                    <td colspan="3" height="25">���ݿ����ã�</td>
                                </tr>

                                <tr>
                                    <td width="150px">����������</td>
                                    <td height="25">
                                        <input type="text" id="t_name" name="t_name" ltype="text" ligerui="{width:200}" validate="{required:true}" onchange="btn_reset()" />
                                    </td>
                                    <td height="25">�磺.\sqlexpress������SQL��������</td>
                                </tr>
                                <tr>
                                    <td>��¼����</td>
                                    <td height="25">
                                        <input type="text" id="t_uid" name="t_uid" ltype="text" ligerui="{width:200}" validate="{required:true}" onchange="btn_reset()" />
                                    </td>
                                    <td height="25">�磺sa������SQL��½�˺ţ��벻Ҫ��windows��½��֤</td>
                                </tr>
                                <tr>
                                    <td>���룺</td>
                                    <td height="25">
                                        <input type="text" id="t_pwd" name="t_pwd" ltype="text" ligerui="{width:200}" validate="{required:true}" onchange="btn_reset()" />
                                    </td>
                                    <td height="25">���ݿ��˺ŵ�����</td>
                                </tr>
                                <tr>
                                    <td>�Ƿ���ܣ�</td>
                                    <td height="25">
                                        <input type="text" id="t_Encrypt" name="t_Encrypt" ltype="select" ligerui="{width:200,data:[{'text':'����',id:0},{'text':'������',id:1}],initValue:0}" validate="{required:true}" /></td>
                                    <td height="25">�����ַ����Ƿ����</td>
                                </tr>
                                <tr>
                                    <td>���ݿ�����</td>
                                    <td height="25">
                                        <input type="text" id="t_db_name" name="t_db_name" ltype="text" ligerui="{width:200}" validate="{required:true}" onchange="btn_reset()" /></td>
                                    <td height="25">���ݿ����ƣ����Ѵ��������ݿ⣬����д�ѽ��õ����ݿ�����</td>
                                </tr>
                                <tr>
                                    <td colspan="3">1���粻֪��д������ʹٷ���̳Ѱ�������<a href="http://bbs.xhdcrm.com" target="_blank">http://bbs.xhdcrm.com</a><br />
                                        2��������������ã�������������Է����ݶ�ʧ��</td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td height="145" style="text-align: center;">&nbsp;
                        <div id="btn_next"  style="margin-right:5px;float:right;"></div>
                        <div id="btn_test"  style="margin-right:5px;float:right;"></div>                       
                        
                </tr>
            </table>
        </div>
    </form>

</body>

</html>
