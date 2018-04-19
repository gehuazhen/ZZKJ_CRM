<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>С�ƶ�CRMϵͳ��־</title>
    <meta http-equiv="X-UA-Compatible" content="ie=edge chrome=1" />
    <link href="../../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" />
    <link href="../../lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />
    <link href="../../CSS/input.css" rel="stylesheet" />

    <script src="../../lib/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
    <script src="../../lib/jquery.form.js" type="text/javascript"></script>
    <script src="../../JS/XHD.js" type="text/javascript"></script>
    <script type="text/javascript">
        var manager;
        var manager1;
        $(function () {

            initLayout();
            $(window).resize(function () {
                initLayout();
            });


            $("#maingrid5").ligerGrid({
                columns: [
                        { display: '���', width: 50, render: function (item,i) { return item.n; } },
                        { display: '�汾��', name: 'Err_type', width: 90 },
                        { display: 'ҳ���ַ', name: 'Err_url', width: 350, align: 'left' },
                        { display: '������Դ', name: 'Err_source', width: 100 },
                        { display: '������', name: 'Err_emp_name', width: 80 },
                        {
                            display: 'ʱ��', name: 'Err_time', width: 150, render: function (item) {
                                return formatTime(item.Err_time);
                            }
                        },
                        { display: 'IP', name: 'Err_ip', width: 160 }

                ],
                dataAction: 'server', pageSize: 30, pageSizeOptions: [20, 30, 50, 100],
                //checkbox:true,
                url: "Sys_log_Err.grid.xhd",
                width: '100%', height: '100%',
                //title: "������Ϣ",
                heightDiff: -1,
                onRClickToSelect: true,               
                detail: {
                    onShowDetail: function (r, p) {
                        for (var n in r) {
                            if (r[n] == null) r[n] = "";
                        }
                        $(p).append(
                            "<table class='bodytable0'  style='width:99%;margin:5px'>" +
                                "<tr>" +
                                    "<td height='23' class='table_label' style='width:80px;'>������Ϣ��</td><td height='23'>" + r.Err_message + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                   "<td height='23' class='table_label' style='width:80px;'>��ջ��Ϣ��</td><td height='23'>" + r.Err_trace + "</td>" +
                                "</tr>" +
                            "</table>");
                    }
                }
            });

            $("#toolbar").ligerToolBar({
                items: [
                    { type: 'textbox', id: 'stype', text: '���ͣ�' },
                    { type: 'textbox', id: 'sstart', text: 'ʱ�䣺' },
                    { type: 'textbox', id: 'sdend', text: "" },
                    { type: 'textbox', id: 'stext', text: '�ؼ��֣�' },
                    { type: 'button', text: '��������', icon: '../../images/search.gif', disable: true, click: function () { doserch() } },
                    { type: 'button', text: '����', icon: '../../images/edit.gif', disable: true, click: function () { $("#serchform").each(function () { this.reset(); }); } }
                ]
            });

            $("#stype").ligerComboBox({ width: 100, url: "Sys_log_Err.logtype.xhd" })
            $("#sstart").ligerDateEditor({ width: 100 })
            $("#sdend").ligerDateEditor({ width: 100 })
            $("#stext").ligerTextBox({ width: 200 })

            $("#grid").height(document.documentElement.clientHeight - $(".toolbar").height());


            manager = $("#maingrid5").ligerGetGridManager();
            manager.onResize();
        });
        function doserch() {
            var sendtxt = "&rnd=" + Math.random();
            var serchtxt = $("#serchform :input").fieldSerialize() + sendtxt;
            //alert(serchtxt);
            top.$.ligerDialog.waitting('���ݲ�ѯ��,���Ժ�...');
            var manager = $("#maingrid5").ligerGetGridManager();
            $.ajax({
                url: "Sys_log_Err.grid.xhd", type: "POST",
                data: serchtxt,
                dataType: 'json',
                beforeSend: function () {
                    
                },
                success: function (responseText) {
                    
                    top.$.ligerDialog.closeWaitting();
                },
                error: function () {
                    top.$.ligerDialog.closeWaitting();
                    top.$.ligerDialog.error('��ѯʧ�ܣ������ѯ�');
                }
            });
        }
        function f_reload() {
            var manager = $("#maingrid5").ligerGetGridManager();
            manager.loadData(true);
        };


    </script>
</head>
<body>
    <div style="position: relative; z-index: 9999">
        <form id="serchform">
            <div id="toolbar"></div>
        </form>
    </div>

    <form id="form1" onsubmit="return false">
        <div id="griddiv">


            <div id="maingrid5" style="margin: -1px -1px;"></div>
        </div>
    </form>


</body>
</html>
