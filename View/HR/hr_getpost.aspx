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
            $("#layout1").ligerLayout({ leftWidth: 160, allowLeftResize: false, allowLeftCollapse: true, space: 2, heightDiff: 2 });
            $("#tree1").ligerTree({
                url: 'hr_department.tree.xhd?rnd=' + Math.random(),
                onSelect: onSelect,
                idFieldName: 'id',
                usericon: 'd_icon',
                iconpath: "../images/icon/",
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
                    { display: '岗位名称', name: 'post_name', width: 90 },
                    { display: '部门名称', name: 'dep_name', width: 90 },
                    { display: '职务名称', name: 'position_name', width: 90 },
                    { display: '姓名', name: 'emp_name', width: 90 }

                ],
                dataAction: 'server',
                pageSize: 30,
                pageSizeOptions: [20, 30, 50, 100],
                onSelectRow: function (row, index, data) {
                    //alert('onSelectRow:' + index + " | " + data.ProductName); 
                },
                url: "hr_post.grid.xhd?depid=0",
                width: '100%',
                height: '100%',
                heightDiff: -2
            });
            toolbar();
        });
        function toolbar() { 
            var items = [];
            items.push({ type: 'button', text: '新增岗位', icon: '../images/icon/11.png', disable: true, click: function () { f_addpost() } });
            items.push({ type: 'textbox', id: 'empstatus' });
            items.push({ type: 'textbox', id: 'Serchtext', text: '岗位名：' });
            items.push({ type: 'button', text: '搜索', icon: '../images/search.gif', disable: true, click: function () { f_search() } });

            $("#toolbar").ligerToolBar({
                items: items

            });

            $("#empstatus").ligerComboBox({
                width: 80,
                selectBoxHeight: 90,
                data: [{ id: '0', text: '全部' }, { id: '1', text: '未使用' }, { id: '2', text: '已使用' }],
                initValue: 1,
                onSelected: function (value, text) {
                    var treemanager = $("#tree1").ligerGetTreeManager();
                    var note = treemanager.getSelected();
                    if (note) {
                        var manager = $("#maingrid4").ligerGetGridManager();
                        
                        var url = "hr_post.grid.xhd?depid=" + note.data.id + "&empstatus=" + value + "&rnd=" + Math.random();
                        manager._setUrl(url);
                    }
                }
            });
            $("#Serchtext").ligerTextBox({ width: 120 }); 
            $("#maingrid4").ligerGetGridManager()._onResize();
        }


        function onSelect(note) {
            var manager = $("#maingrid4").ligerGetGridManager();
            var url = "hr_post.grid.xhd?depid=" + note.data.id + "&empstatus=" + $("#empstatus_val").val() + "&rnd=" + Math.random();
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
            $.ligerDialog.waitting('数据查询中,请稍候...', 9003);
            var manager = $("#maingrid4").ligerGetGridManager();
            $.ajax({
                url: "hr_post.serch.xhd", type: "POST",
                data: serchtxt,
                dataType: 'json',
                beforeSend: function () {
                    
                },
                success: function (responseText) {
                    manager._setUrl("S_hr_post.serch.xhd?" + serchtxt);
                    
                    $.ligerDialog.closeWaitting();
                },
                error: function () {
                    $.ligerDialog.closeWaitting();
                    $.ligerDialog.error('查询失败！请检查查询项。', 9003);
                }
            });
        }
        function f_addpost() {
            top.$.ligerDialog.open({
                title: '快速新增岗位', width: 500, height: 350, url: 'hr/QuickAddPost.aspx', buttons: [
                    { text: '确定', onclick: f_selectContactOK },
                    { text: '取消', onclick: function (item, dialog) { dialog.close(); } }
                ], zindex: 9007
            });
            return false;
        }
        function f_selectContactOK(item, dialog) {
            var data = dialog.frame.f_save();
            
            var issave = dialog.frame.f_save();
            if (issave) {
                dialog.close();
                $.ligerDialog.waitting('数据保存中,请稍候...');
                $.ajax({
                    url: "hr_post.save.xhd", type: "POST",
                    data: issave,
                    success: function (responseText) {
                        $.ligerDialog.closeWaitting();
                        f_load();

                    },
                    error: function () {
                        $.ligerDialog.closeWaitting();
                        $.ligerDialog.error('操作失败！');
                    }
                });
            }
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
            <div position="left" title="组织架构">
                <div id="treediv" style="width: 160px; height: 100%; margin: -1px; float: left;  overflow: auto;margin-top:2px;">
                    <ul id="tree1"></ul>
                </div>
            </div>
            <div position="center">
                
                    <div id="toolbar" style="margin-top:10px;"></div>
             
         
                    <div id="maingrid4" style="margin: -1px;"></div>
                
            </div>
        </div>


        <!--<a class="l-button" onclick="getChecked()" style="float:left;margin-right:10px;">获取选择(复选框)</a> -->
        <div style="display: none">
            <!--  数据统计代码 -->
        </div>
    </form>
</body>
</html>
