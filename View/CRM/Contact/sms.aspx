<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
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
            $("#maingrid4").ligerGrid({
                columns: [
                    { display: '���', width: 50, name: 'n' },
                    {
                        display: '��������', name: 'sms_title', width: 200, render: function (item) {
                            var html = "<a href='javascript:void(0)' onclick=view('sms','" + item.id + "')>";
                            if (item.sms_title)
                                html += item.sms_title;
                            html += "</a>";
                            return html;
                        }
                    },
                    {
                        display: '������', name: 'create_id', width: 80, render: function (item) {
                            var html = "<a href='javascript:void(0)' onclick=view('emp','" + item.create_id + "')>";
                            if (item.create_name)
                                html += item.create_name;
                            html += "</a>";
                            return html;
                        }
                    },
                    {
                        display: '����ʱ��', name: 'create_time', width: 140, render: function (item) {
                            return formatTimebytype(item.create_time, 'yyyy-MM-dd hh:mm');
                        }
                    },
                    {
                        display: '���', width: 50, render: function (item) {
                            var html = "<div style='margin-top:5px;'><input type='checkbox'";
                            if (item.isSend == 1) html += "checked='checked'  ";
                            html += " disabled='disabled' /></div>";
                            return html;
                        }
                    },

                    {
                        display: '�����', name: 'check_id', width: 80, render: function (item) {
                            var html = "<a href='javascript:void(0)' onclick=view(8," + item.check_id + ")>";
                            if (item.check_name)
                                html += item.check_name;
                            html += "</a>";
                            return html;
                        }
                    },
                    {
                        display: '���ʱ��', name: 'sendtime', width: 140, render: function (item) {
                            return formatTimebytype(item.sendtime, 'yyyy-MM-dd hh:mm');
                        }
                    }
                ],
                dataAction: 'server',
                pageSize: 30,
                pageSizeOptions: [20, 30, 50, 100],
                url: "SMS.grid.xhd",
                width: '100%',
                height: '100%',
                //title: "Ա���б�",
                heightDiff: -10,
                onRClickToSelect: true,

                onContextmenu: function (parm, e) {
                    actionCustomerID = parm.data.id;
                    menu.show({ top: e.pageY, left: e.pageX });
                    return false;
                }
            });

            $("#grid").height(document.documentElement.clientHeight - $(".toolbar").height());
          
            toolbar();
        });

        function toolbar() {
            $.get("toolbar.GetSys.xhd?mid=sms&rnd=" + Math.random(), function (data, textStatus) {
                var data = eval('(' + data + ')');
                //alert(data);
                var items = [];
                var arr = data.Items;
                for (var i = 0; i < arr.length; i++) {
                    arr[i].icon = "../../" + arr[i].icon;
                    items.push(arr[i]);
                }
                items.push({
                    type: 'serchbtn',
                    text: '�߼�����',
                    icon: '../../images/search.gif',
                    disable: true,
                    click: function () {
                        serchpanel();
                    }
                });
                $("#toolbar").ligerToolBar({
                    items: items

                });
                menu = $.ligerMenu({
                    width: 120, items: getMenuItems(data)
                });


                manager = $("#maingrid4").ligerGetGridManager();
                manager._onResize();
            });
        }
       

        function add() {
            f_openWindow("CRM/contact/sms_add.aspx", "��������", 730, 450, f_save);
        }

        function del() {
            var manager = $("#maingrid4").ligerGetGridManager();
            var row = manager.getSelectedRow();
            if (!row) {
                $.ligerDialog.warn('��ѡ����ţ�');
                return;
            }

            if (row.isSend == 1) {
                $.ligerDialog.warn('�˶����ѷ��ͣ�����ɾ����');
                return;
            }

            $.ligerDialog.confirm("����ɾ���޷��ָ���ȷ��ɾ����", function (yes) {
                if (yes) {
                    $.ligerDialog.waitting('����ɾ����,���Ժ�...');
                    $.ajax({
                        url: "SMS.del.xhd",
                        type: "POST",
                        data: { id: row.id, rnd: Math.random() },
                        dataType: "json",
                        success: function (result) {
                            $.ligerDialog.closeWaitting();

                            var obj = eval(result);

                            if (obj.isSuccess) {
                                f_reload();
                            }
                            else {
                                $.ligerDialog.error(obj.Message);
                            }

                        },
                        error: function () {
                            $.ligerDialog.closeWaitting();
                            $.ligerDialog.error('ɾ��ʧ�ܣ�');
                        }
                    });
                }
            });
        }

        function f_save(item, dialog) {
            var issave = dialog.frame.f_save();
            var num = dialog.frame.f_num();

            if (num < 1) return;

            if (issave) {
                dialog.close();
                $.ligerDialog.waitting('���ݱ�����,���Ժ�...');
                $.ajax({
                    url: "SMS.save.xhd", type: "POST",
                    data: issave,
                    dataType: "json",
                    success: function (result) {
                        $.ligerDialog.closeWaitting();

                        var obj = eval(result);

                        if (obj.isSuccess) {
                            f_reload();
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
        function f_reload() {
            var manager = $("#maingrid4").ligerGetGridManager();
            manager.loadData(true);
        };

        function check() {
            var manager = $("#maingrid4").ligerGetGridManager();
            var row = manager.getSelectedRow();
            if (!row) { $.ligerDialog.warn('��ѡ���У�'); return; }
            if (row.isSend == 1) { $.ligerDialog.warn('����Ϣ�Ѿ���˲����ͣ�'); return; }

            $.ligerDialog.confirm("���֮�󣬶��Ž����Ͳ���Ӧ�۷ѣ��Ƿ������", function (yes) {
                if (yes) {
                    $.ajax({
                        url: "SMS.send.xhd",
                        type: "get",
                        data: { id: row.id, rnd: Math.random() },
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (result) {
                            $.ligerDialog.closeWaitting();

                            var obj = eval(result);

                            if (obj.isSuccess) {
                                f_reload();
                            }
                            else {
                                $.ligerDialog.error(obj.Message);
                            }
                        },
                        error: function () {
                            $.ligerDialog.closeWaitting();
                            $.ligerDialog.error('ϵͳ���󣬷���ʧ�ܣ�');
                        }
                    });
                }
            });

        }
        function status() {
            var manager = $("#maingrid4").ligerGetGridManager();
            var row = manager.getSelectedRow();
            if (!row) { $.ligerDialog.warn('��ѡ���У�'); return; }

            f_openWindow("crm/contact/sms_report.aspx?id=" + row.id, '����״̬', 500, 300)
        }

    </script>
</head>
<body>
    <form id="form1" onsubmit="return false">
        <div style="padding: 10px;">
            <div id="toolbar"></div>

            <div id="grid">
                <div id="maingrid4" style="margin: -1px; min-width: 800px;"></div>
            </div>
        </div>

    </form>
  
</body>
</html>
