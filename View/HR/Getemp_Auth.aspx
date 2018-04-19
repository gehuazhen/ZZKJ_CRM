<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" />
    <link href="../lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />
    <link href="../CSS/input.css" rel="stylesheet" type="text/css" />

    <script src="../lib/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
    <script src="../lib/jquery.form.js" type="text/javascript"></script>
    <script src="../JS/XHD.js" type="text/javascript"></script>

    <script type="text/javascript">

        var manager = "";
        var treemanager;
        $(function () {
            $("#layout1").ligerLayout({ leftWidth: 160, height: '100%', allowLeftResize: false, allowLeftCollapse: true, space: 2 ,heightDiff:1});
            $("#tree1").ligerTree({
                url: "hr_department.tree.xhd?auth=" + getparastr("auth") + "&rnd=" + Math.random(),
                onSelect: onSelect,
                idFieldName: 'id',
                usericon: 'd_icon',
                iconpath:'../images/icon/',
                checkbox: false,
                itemopen: false
            });

            treemanager = $("#tree1").ligerGetTreeManager();

            initLayout();
            $(window).resize(function () {
                initLayout();
            });

            $("#maingrid4").ligerGrid({
                columns: [
                    //{ display: 'ID', name: 'ID', type: 'int', width: 50 },
                    //{ display: '���', width: 50, render: function (item,i) { return item.n; } },
                    { display: '����', name: 'name', width: 120 },
                    { display: '�Ա�', name: 'sex', width: 50 },
                    { display: '����', name: 'dep_name' },
                    { display: 'Ĭ�ϸ�λ', name: 'post_name' },
                    { display: 'Ĭ��ְ��', name: 'position_name', width: 80 },
                    { display: '״̬', name: 'status' }
                ],
                dataAction: 'server',
                pageSize: 30,
                pageSizeOptions: [20, 30, 50, 100],
                onSelectRow: function (row, index, data) {
                    //alert('onSelectRow:' + index + " | " + data.ProductName); 
                },
                url: "hr_employee.grid.xhd?auth=" + getparastr("auth"),
                width: '100%',
                height: '100%',
                heightDiff: -1
            });
            toolbar();
        });
        function toolbar() {
            var items = [];
            items.push({ type: 'textbox', id: 'stext', text: 'Ա��������' });
            items.push({ type: 'button', text: '����', icon: '../images/search.gif', disable: true, click: function () { f_search() } });

            $("#toolbar").ligerToolBar({
                items: items
            });

            $("#stext").ligerTextBox({ width: 120 });
            $("#maingrid4").ligerGetGridManager()._onResize();
        }


        function onSelect(node) {
            if (node.data.d_icon == "../images/icon/50.png")
            {
                $.ligerDialog.error("Ȩ�޲�����");
                return;
            }
            var manager = $("#maingrid4").ligerGetGridManager();
            var url = "hr_employee.grid.xhd?auth=" + getparastr("auth") + "&did=" + node.data.id + "&rnd=" + Math.random();
            //manager._setUrl(url);
            manager._setUrl(url);
        }

        function f_select() {
            var manager = $("#maingrid4").ligerGetGridManager();
            var rows = manager.getSelectedRow();
            return rows;
        }
        function f_search() {
            var sendtxt = "&rnd=" + Math.random();
            var serchtxt = $("#form1 :input").fieldSerialize() + sendtxt;
            //alert(serchtxt);
            $.ligerDialog.waitting('���ݲ�ѯ��,���Ժ�...', 9003);
            var manager = $("#maingrid4").ligerGetGridManager();
            $.ajax({
                url: "hr_employee.grid.xhd", type: "POST",
                data: serchtxt,
                dataType: 'json',
                beforeSend: function () {
                    
                },
                success: function (responseText) {
                    //alert("../data/crm_customer.ashx" + serchtxt);
                    manager._setUrl("hr_employee.grid.xhd?" + serchtxt);
                    
                    $.ligerDialog.closeWaitting();
                },
                error: function () {
                    $.ligerDialog.closeWaitting();
                    $.ligerDialog.error('��ѯʧ�ܣ������ѯ�', 9003);
                }
            });
        }


        function f_load() {
            var manager = $("#maingrid4").ligerGetGridManager();
            manager.loadData(true);
        }
    </script>
</head>
<body style="padding: 0px">
    <form id="form1" onsubmit="return false">
        <div id="layout1" style="margin: -1px">
            <div position="left" title="��֯�ܹ�">
                <div id="treediv" style="width: 160px; height: 100%; margin: -1px; float: left; border: 1px solid #ccc; overflow: auto;padding-top:2px;">
                    <ul id="tree1"></ul>
                </div>
            </div>
            <div position="center">
                <%--<div style="position: absolute; z-index: 1000; width: 100%">--%>
                    <div id="toolbar" style="margin-top:10px;"></div>
                <%--</div>--%>
               <%-- <div style="position: fixed; width: 100%; margin-top: 30px">--%>
                    <div id="maingrid4" style="margin: -1px;"></div>
                <%--</div>--%>
            </div>
        </div>
    </form>
</body>
</html>
