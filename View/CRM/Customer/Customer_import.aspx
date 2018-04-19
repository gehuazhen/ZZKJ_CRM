<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" />
    <link href="../../lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />
    <link href="../../CSS/input.css" rel="stylesheet" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge chrome=1" />
    <script src="../../lib/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
    <script src="../../JS/XHD.js" type="text/javascript"></script>
    <script src="../../lib/jquery.form.js" type="text/javascript"></script>
    <script src="../../JS/ajaxUpload.js" type="text/javascript"></script>


    <script type="text/javascript">
        var dialog = frameElement.dialog;
        $(function () {
            //var jsontext = '{"success":1,"error":0,"message":""}';
            //var contact = JSON.parse(jsontext);
            //alert(contact);
        });


        function checkpath() {
            var path = $("#upload").val();
            $.ligerDialog.confirm("�ļ���ѡ���Ƿ�ʼ���룿", function (yes) {
                if (yes) {
                    $.ligerDialog.waitting('���ݵ�����,���Ժ�...');
                    ajaxUpload({
                        id: 'upload',
                        frameName: 'a',
                        url: 'CRM_Customer.import.xhd',
                        format: ['xls'],
                        onsuccess: success,
                        onerror: onerror
                    });
                }
            });
        }
        function success(data) {
            $.ligerDialog.closeWaitting();
            //$.ligerDialog.error(data);

            //alert(&quot;&gt;&quot;)
            var start = data.indexOf(">");
            if (start != -1) {
                var end = data.indexOf("<", start + 1);
                if (end != -1) {
                    data = data.substring(start + 1, end);
                }
            }
            //alert(data);

            var obj = "";
            try {
                obj = JSON.parse(data);
            }
            catch (e) {
                top.$.ligerDialog.error("����ʧ��!", "��ϵ�˵���", "", 9003);
                dialog.close();
            }

            top.frames["crm_customer"].f_reload();
            var turntxt = obj.success + "�����ݵ���ɹ���";
            if (obj.error > 0)
                turntxt = obj.success + "�����ݵ���ɹ�," + obj.error + "�����ݵ���ʧ�ܡ�ʧ��ԭ��Ϊ��" + obj.message

            top.$.ligerDialog.success(turntxt, "�ͻ�����", "", 9003);
            dialog.close();
        }

        function onerror(txt) {
            $.ligerDialog.closeWaitting();
            $.ligerDialog.error(txt);
        }
    </script>

    <style type="text/css">
        input { position: absolute; right: 0; top: 0; font-size: 100px; opacity: 0; filter: alpha(opacity=0); }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table style="width: 502px; margin: 5px;" class='bodytable1'>
            <tr>
                <td class="table_title1">����������</td>
            </tr>
            <tr>
                <td>1������ģ�壺<a href="../../file/template/�ͻ�����ģ��.xls">�ͻ�����ģ��</a><br />
                    2������ģ�����ע������������д��Ȼ�󱣴��ļ���<br />
                    3��������������ѡ����д�õ�ģ�塣<br />
                    4����������ݲ���һ������ȫ�ɹ��������������ϵС�ƶ�CRM�ٷ�������Ա��<br />
                </td>
            </tr>
            <tr>
                <td class="table_title1">������</td>
            </tr>
            <tr>
                <td>

                    <%-- <input name="upload" type="file" id="upload" onchange="checkpath()" style="width: 250px; height: 21px;" runat="server" />
                    <input type="button" id="btn_up" value="�ϴ�������" style="width: 80px; height: 21px;" disabled="disabled" onclick="update()" />--%>
                </td>
            </tr>
        </table>
        <a href="#" class ="uploada">
            <input type="file" class="fileInput" id="upload" name="fileInput" onchange="checkpath()" accept=".xls" value="���" />�  ��
        </a>

    </form>
</body>
</html>
