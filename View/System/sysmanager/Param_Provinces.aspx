<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="ie=edge chrome=1" />
    <link href="../../CSS/input.css" rel="stylesheet" type="text/css" />
    <link href="../../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" />
    <link href="../../lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />

    <script src="../../lib/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
    <script src="../../JS/XHD.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {

            initLayout();
            $(window).resize(function () {
                initLayout();
            });

            $("#maingrid4").ligerGrid({
                columns: [
                    //{ display: '���', name: 'id', width: 30, render: function (item, i) { return item.n; } },
                    { display: 'ʡ��', name: 'Provinces', width: 200 },                   
                    { display: '����', name: 'Provinces_order', width: 50 }
                ],
                rownumbers:true,
                checkBox: true,
                dataAction: 'server', pageSize: 30, pageSizeOptions: [20, 30, 50],
                url: "Sys_Provinces.grid.xhd",
                width: '100%', height: '100%',
                onRClickToSelect: true,


                onContextmenu: function (parm, e) {
                    actionCustomerID = parm.data.id;
                    menu.show({ top: e.pageY, left: e.pageX });
                    return false;
                },
                heightDiff: -10
            });

            var manager = $("#maingrid4").ligerGetGridManager();
            //manager.onResize();
            toolbar();


        });
        function toolbar() {
            $.get("toolbar.GetSys.xhd?mid=sys_provinces&rnd=" + Math.random(), function (data, textStatus) {
                var data = eval('(' + data + ')');
                //alert(data);
                var items = [];
                var arr = data.Items;
                for (var i = 0; i < arr.length; i++) {
                    arr[i].icon = "../../" + arr[i].icon;
                    items.push(arr[i]);
                }

                $("#toolbar").ligerToolBar({
                    items: items

                });
                menu = $.ligerMenu({
                    width: 120, items: getMenuItems(data)
                });

                $("#maingrid4").ligerGetGridManager()._onResize();
            });
        }


        function add() {
            f_openWindow("System/sysmanager/Param_Provinces_add.aspx", "����", 390, 200, f_save);
        }

        function edit() {
            var manager = $("#maingrid4").ligerGetGridManager();
            var row = manager.getSelectedRow();
            if (!row) { top.$.ligerDialog.error('��ѡ���У�'); return; }
            f_openWindow('System/sysmanager/Param_Provinces_add.aspx?id=' + row.id, "�޸�", 390, 200, f_save);
        }

        function del() {
            var manager = $("#maingrid4").ligerGetGridManager();
            var row = manager.getSelectedRow();
            if (!row) { top.$.ligerDialog.error('��ѡ���У�'); return; }
            if (row.Provinces_type == "sys") { $.ligerDialog.warn("ϵͳ����������ɾ����"); return; }

            $.ligerDialog.confirm("ȷ��ɾ����", function (yes) {
                if (yes) {
                    top.$.ligerDialog.waitting('����ɾ����,���Ժ�...');
                    $.ajax({
                        type: "POST",
                        url: "Sys_Provinces.del.xhd",
                        data: { id: row.id },
                        dataType:'json',
                        success: function (result) {
                            top.$.ligerDialog.closeWaitting();

                            var obj = eval(result);

                            if (obj.isSuccess) {
                                f_reload();
                            }
                            else {
                                top.$.ligerDialog.error(obj.Message);
                            }
                        },
                        error: function () {
                            top.$.ligerDialog.closeWaitting();
                            top.$.ligerDialog.error('����ʧ�ܣ�');
                        }
                    });
                }
            })

        }
        function f_save(item, dialog) {
            var issave = dialog.frame.f_save();
            if (issave) {
                dialog.close();
                top.$.ligerDialog.waitting('���ݱ�����,���Ժ�...');
                $.ajax({
                    url: "Sys_Provinces.save.xhd", type: "POST",
                    data: issave,
                    dataType:'json',
                    success: function (result) {
                        top.$.ligerDialog.closeWaitting();

                        var obj = eval(result);

                        if (obj.isSuccess) {
                            f_reload();
                        }
                        else {
                            top.$.ligerDialog.error(obj.Message);
                        }
                    },
                    error: function () {
                        top.$.ligerDialog.closeWaitting();
                        top.$.ligerDialog.error('����ʧ�ܣ�');
                    }
                });
            }
        }
        function f_reload() {
            var manager = $("#maingrid4").ligerGetGridManager();
            manager.loadData(true);
        };
    </script>
</head>
<body>
    <form id="mainform" onsubmit="return false">
        <div style="padding: 10px;">
            <div id="toolbar"></div>

            <div id="maingrid4" style="margin: -1px;"></div>
        </div>
    </form>
</body>
</html>
