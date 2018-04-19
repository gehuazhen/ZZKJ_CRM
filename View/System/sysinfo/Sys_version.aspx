<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache,must-revalidate" />
    
   <link href="../../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" />
    <link href="../../lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />
    <link href="../../CSS/input.css" rel="stylesheet" type="text/css" />

    <script src="../../lib/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
    <script src="../../JS/XHD.js" type="text/javascript"></script>
    <script src="../../lib/jquery.form.js" type="text/javascript"></script>
    <script type="text/javascript">
        var sys_id = "", sys_name = "", sys_version = "";
        $(function () {
            $.ajax({
                type: "GET",
                url: "S_Sys_info.grid.xhd", /* ע���������ֶ�ӦCS�ķ������� */
                data: { rnd: Math.random() }, /* ע������ĸ�ʽ������ */
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    var obj = eval(result);
                    var rows = obj.Rows;
                    var sysinfo = {};
                    for (var i = 0; i < rows.length; i++) {
                        if (rows[i].sys_value == "null" || rows[i].sys_value == null) {
                            rows[i].sys_value = " ";
                        }
                        sysinfo[rows[i].sys_key] = rows[i].sys_value;
                    }
                    sys_id = sysinfo["sys_guid"];
                    sys_name = sysinfo["sys_name"];
                    sys_version = sysinfo["sys_version"];
                    //alert(obj.constructor); //String ���캯��
                    $("#Label1").text(sys_version);
                    $("#Label2").attr(sysinfo["sys_vinfo"]);
                }
            });
        });
        function checkup() {
            var T_name = "";
            if ($("#T_send").attr("checked")) {
                T_name = sys_name;
            }
            $.ligerDialog.waitting('���ڻ�ȡ�������汾,���Ժ�...');
            $.ajax({
                type: "GET",
                url: "xhd_Service.getVersion.xhd", /* ע���������ֶ�ӦCS�ķ������� */
                data: { Action: 'getversion', T_guid: sys_id, T_name: T_name, rnd: Math.random() }, /* ע������ĸ�ʽ������ */
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    var server_version = result.version_name;

                    server_version = server_version.toLowerCase().replace('v', '');
                    sys_version = sys_version.toLowerCase().replace('v', '');

                    var a, b = new Array();
                    a = server_version.split('.');
                    b = sys_version.split('.');

                    if (a[3] * 1 < 10000) a[3] = a[3] * 10;
                    if (b[3] * 1 < 10000) b[3] = b[3] * 10;

                    var va = a[3] * 1 + a[2] * 100000 + a[1] * 10000000 + a[0] * 1000000000;
                    var vb = b[3] * 1 + b[2] * 100000 + b[1] * 10000000 + b[0] * 1000000000;

                    //alert(va + ":" + vb)
                    $.ligerDialog.closeWaitting();
                    if (vb < va) {
                        $.ligerDialog.question("�� " + result.version_name + " �汾���Ը��£���ǰ��<br/>    <a href='http://www.xhdcrm.com/down' target='_blank'>С�ƶ�CRM����</a>   ���ظ��¡�", "��ʾ");
                    }
                    else {
                        $.ligerDialog.success("�Ѿ������°汾������������");
                    }
                }
                ,error: function ()
                {
                    $.ligerDialog.closeWaitting();
                }
            })
        }

    </script>
    </head>
<body style="padding: 0px;overflow-y:scroll;">
    <form id="form1">
        <table class="bodytable0" style="width: 100%; margin: -1px">

            <tr>
                <td height="23" width="150" class="title" colspan="2" style="border-top: none;">ϵͳ��Ϣ</td>
            </tr>

            <tr>
                <td height="23" width="150" class="table_label">��ǰ�汾�ţ�</td>
                <td height="23">
                    <span id="Label1">1</span>
                </td>
            </tr>
             <tr>
                <td height="23" class="table_label">�û�����ƻ���</td>
                <td height="23">
                    <input id="T_send" type="checkbox" checked="checked" />������ҵ��</td>
            </tr>
            <tr>
                <td height="23" class="table_label">&nbsp;</td>
                <td height="23">
                    <span id="Label4">
                        <input type="button" value="������" style="width: 80px; height: 22px;" onclick="checkup()"></span>
                </td>
            </tr>
            <tr>
                <td height="23" class="table_label">��ǰ�汾��Ϣ��</td>
                <td height="23">
                    <span id="Label2">1�����Ż���ȫ�µ�ϵͳ�ܹ��� 
                    <br />
                    2�����������������ϵͳ�� 
                    <br />
                    3�������������Ź��ܡ� 
                    <br />
                    4�����������ͻ���ͼ����ǹ��ܡ� 
                    <br />
                    5�������������ð���ϵͳ�� 
                    <br />
                    6������������ϵ�˵��롣 
                    <br />
                    7�����������ͻ����ع��ܡ� 
                    <br />
                    </span>8�����Ż����������������� 
                    <br />
                    9�����Ż����ͻ��б����ϵ����ʾ�绰�Ͳ����С� 
                    <br />
                    10�����Ż��������н�������ͳ�ƹ��ܡ� 
                    <br />
                    11�����Ż��������������Ŀ����������� 
                    <br />
                    12�����Ż�����ǿ��֤����ʾ��֤����ڡ� 
                    <br />
                    13�����Ż����Ż��ϴ���������ٴ��� 
                    <br />
                    14�����Ż����Ż����룬���ٴ��� 
                    <br />
                    15�����Ż����Ż�����������EXCLE�� 
                    <br />
                    16�����Ż������ز�����Ҫ����ҳ��򿪡� 
                    <br />
                    17�����Ż����ͻ�����ҳ��Ҫ���Ȩ�ޡ� 
                    <br />
                    18�����Ż�����������֮����ȡ���ͻ���ѡ�� 
                    <br />
                    19�����Ż�����ǩ��ɾ����ť��ʾ����ͼ�ꡣ 
                    <br />
                    20�����Ż������ִ��ڼ�����󻯹��ܡ� 
                    <br />
                    21�����Ż�����ͬ���뵽�ڲ�ѯ�� 
                    <br />
                    22�����Ż�����־������ϸ�޸ļ�¼�� 
                    <br />
                    23�����Ż����ֶμ�ǿ��֤�� 
                    <br />
                    24�����޸������༭���⡣ 
                    <br />
                    25�����޸��������������Ϊ0ʱ��ʾundefined���⡣ 
                    <br />
                    26�����޸������ֻ��һ�����ݲ�ˢ�����⡣ 
                    <br />
                    27�����޸�����������ʾ�� 
                    <br />
                    28�����޸��������б��Ҽ��������⡣ 
                    <br />
                    29�����޸����Ҽ��˵�ͼ�����⡣ <br />
                    30�����޸�����ϵ�˶�μ������⡣</td>
            </tr>
           
        </table>
    </form>
</body>
</html>
