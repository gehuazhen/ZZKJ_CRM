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
        $(function () {

            initLayout();
            $(window).resize(function () {
                initLayout();
            });
            $("#toolbar").ligerToolBar({
                items: [
                    { type: 'serchbtn', text: '高级搜索', icon: '../../images/search.gif', disable: true, click: function () { serchpanel() } }
                ]
            });
            $("#maingrid4").ligerGrid({
                columns: [
                    //{ display: '序号', name: 'n', width: 50 },
                     {
                         display: '任务名称', name: 'task_title', width: 200, render: function (item, i) {
                             var html = "<a href='javascript:void(0)' onclick=view('task','" + item.id + "')>";
                             if (item.task_title)
                                 html += item.task_title;
                             html += "</a>";
                             return html;
                         }
                     },
                    { display: '任务类别', name: 'task_type', width: 80 },
                    { display: '执行人', name: 'executive', width: 80 },
                    { display: '指派人', name: 'assign', width: 80 },
                    {
                        display: '执行时间', name: 'executive_time', width: 90, render: function (item) {
                            var d = formatTimebytype(item.executive_time, 'yyyy-MM-dd');
                            var diff = DateDiff(d);
                            if (diff < 0)
                                return "<div style='background:#f00;color:#fff;'>" + d + "</div>";
                            else return d;
                        }
                    },
                    {
                        display: '任务状态', name: 'task_status_id', width: 80, render: function (item, i) {
                            if (item.task_status_id == 0)
                                return "<div style='background:#0f0;'>进行中</div>";
                            else if (item.task_status_id == 1)
                                return "<div style='background:#f00;color:#fff;'>已完成</div>";
                            else if (item.task_status_id == 2)
                                return "<div style='background:#00f;color:#0ff;'>已中止</div>";
                            else
                                return "";

                        }
                    },
                    {
                        display: '优先级', name: 'Priority_id', width: 60, render: function (item, i) {
                            if (item.Priority_id == 0)
                                return "高";
                            else if (item.Priority_id == 1)
                                return "中";
                            else
                                return "低";
                        }
                    },
                    {
                        display: '相关客户', name: 'customer', width: 200, render: function (item) {
                            var html = "<a href='javascript:void(0)' onclick=view('customer','" + item.customer_id + "')>";
                            if (item.customer)
                                html += item.customer;
                            html += "</a>";
                            return html;
                        }
                    },
                {
                    display: '创建时间', name: 'create_time', width: 150, render: function (item) {
                        return formatTime(item.create_time);
                    }
                }
                ],
                //fixedCellHeight:false,
                rownumbers:true,
                dataAction: 'server', pageSize: 30, pageSizeOptions: [20, 30, 50, 100],
                url: "Task.grid.xhd?type=executive&rnd=" + Math.random(),
                width: '100%', height: '60%',
                heightDiff: -10,
                onRClickToSelect: true,
                //title:'待办任务列表',
                onSelectRow: function (data, rowindex, rowobj) {
                    var manager = $("#maingrid5").ligerGetGridManager();
                    
                    var url = "Task_follow.grid.xhd?taskid=" + data.id;
                    manager._setUrl(url);
                }
            });
            $("#maingrid5").ligerGrid({
                columns: [
                    //{ display: '序号', width: 40, render: function (item, i) { return i + 1; } },
                    {
                        display: '跟进内容', name: 'follow_content', align: 'left', width: 500,
                        render: function (item) {
                            var html = "<div class='abc'>";
                            if (item.follow_content)
                                html += item.follow_content;
                            html += "</div>";
                            return html;
                        }
                    },
                    {
                        display: '跟进时间', name: 'follow_time', width: 140,
                        render: function (item) {
                            return formatTimebytype(item.follow_time, 'yyyy-MM-dd hh:mm');
                        }
                    },
                    {
                        display: '跟进类型', name: 'follow_status', width: 80,
                        render: function (item) {
                            if (item.follow_status == "0")
                                return "<div style='background:#0f0;'>跟进</div>";
                            else
                                return "<div style='background:#f00;color:#fff;'>完成</div>";
                        }
                    }
                ],
                rownumbers: true,
                onAfterShowData: function (grid) {
                    $(".abc").hover(function (e) {
                        $(this).ligerTip({ content: $(this).text(), width: 200, distanceX: event.clientX - $(this).offset().left - $(this).width() + 15 });
                    }, function (e) {
                        $(this).ligerHideTip(e);
                    });
                },
                dataAction: 'server',
                pageSize: 30,
                pageSizeOptions: [20, 30, 50, 100],
                //checkbox:true,
                url: "Task_follow.grid.xhd?taskid=0",
                width: '100%',
                height: '100%',
                //title: "任务动态",
                heightDiff: -10,
                onRClickToSelect: true,                
                onContextmenu: function (parm, e) {
                    actionCustomerID = parm.data.id;
                    menu.show({ top: e.pageY, left: e.pageX });
                    return false;
                }
            });
            $("#grid").height(document.documentElement.clientHeight - $(".toolbar").height());

            $('#serchform').ligerForm();
            toolbar();

            $("#btn_serch").ligerButton({ text: "搜索", width: 60, click: doserch });
            $("#btn_reset").ligerButton({ text: "重置", width: 60, click: doclear });
        });

        //工具条实例化
        function toolbar() {
            $.ajax({
                url: "toolbar.GetSys.xhd",
                type: "POST",
                data: { mid: 'task_todo', rnd: Math.random() },
                //dataType: "json",
                success: function (result) {

                    var data = eval('(' + result + ')');;

                    var items = [];
                    var arr = data.Items;
                    for (var i = 0; i < arr.length; i++) {
                        arr[i].icon = "../../" + arr[i].icon;
                        items.push(arr[i]);
                    }
                   
                    //items.push({ type: "filter", icon: '../../images/icon/51.png', title: "帮助", click: function () { help(); } })
                    $("#toolbar1").ligerToolBar({
                        items: items
                    });
                    menu = $.ligerMenu({
                        width: 120,
                        items: getMenuItems(data)
                    });
                    //$(".az").appendTo($("#toolbar"));
                    $("#maingrid4").ligerGetGridManager()._onResize();
                    $("#maingrid5").ligerGetGridManager()._onResize();
                },
                error: function () {
                    $.ligerDialog.error('！');
                }
            });
           
        }
        function initSerchForm() {
            $('#assign_employee').ligerComboBox({
                width: 120,
                onBeforeOpen: f_selectAssign
            });
        }
        function serchpanel() {
            initSerchForm();
            if ($(".az").css("display") == "none") {
                $("#grid").css("margin-top", $(".az").height() + "px");
                $("#maingrid4").ligerGetGridManager()._onResize();
            } else {
                $("#grid").css("margin-top", "0px");
                $("#maingrid4").ligerGetGridManager()._onResize();
            }
            $("#company").focus();
        }

        $(document).keydown(function (e) {
            if (e.keyCode == 13 && e.target.applyligerui) {
                doserch();
            }
        });
        //查询
        function doserch() {
            var sendtxt = "&type=executive&rnd=" + Math.random();
            var serchtxt = $("#serchform :input").fieldSerialize() + sendtxt;
            //alert(serchtxt);           
            var manager = $("#maingrid4").ligerGetGridManager();

            manager._setUrl("Task.grid.xhd?" + serchtxt);
        }

        //重置
        function doclear() {
            $("input:hidden", "#serchform").val("");
            $("input:text", "#serchform").val("");
            $(".l-selected").removeClass("l-selected");
        }

        function f_selectAssign() {
            $.ligerDialog.open({
                title: '选择联系人', width: 650, height: 300, url: '../../hr/getemp_auth.aspx?auth=0', buttons: [
                    { text: '确定', onclick: f_selectAssignOK },
                    { text: '取消', onclick: function (item, dialog) { dialog.close(); } }
                ]
            });
            return false;
        }
        function f_selectAssignOK(item, dialog) {
            var data = dialog.frame.f_select();
            if (!data) {
                alert('请选择行!');
                return;
            }
            $("#assign_employee").val(data.name);
            $("#assign_employee_val").val(data.ID);

            dialog.close();
        }


        //添加
        function add() {
            var manager = $("#maingrid4").ligerGetGridManager();
            var row = manager.getSelectedRow();
            if (row) {
                f_openWindow("personal/task/todo_add.aspx?statu=0&taskid=" + row.id, "新增任务跟进", 770, 450, f_save);
            }
            else {
                $.ligerDialog.warn("请选择任务", "提示");
            }
        }

        //修改
        function edit() {
            var manager = $("#maingrid5").ligerGetGridManager();
            var row = manager.getSelectedRow();
            if (row) {
                f_openWindow('personal/task/todo_add.aspx?statu=' + row.follow_status + '&followid=' + row.id + "&taskid=" + row.task_id, "修改任务跟进", 770, 450, f_save);
            }
            else {
                $.ligerDialog.warn('请选择行！');
            }
        }

        function done() {
            var manager = $("#maingrid4").ligerGetGridManager();
            var row = manager.getSelectedRow();

            if (!row) { $.ligerDialog.warn("请选择任务", "提示"); return; }
            if (row.task_status_id == "1") { $.ligerDialog.warn("任务已完成，无法操作！", "提示"); return; }
            if (row.task_status_id == "2") { $.ligerDialog.warn("任务已中止，无法操作！", "提示"); return; }

            f_openWindow("personal/task/todo_add.aspx?statu=1&taskid=" + row.id, "任务完成", 770, 450, f_save);

        }

        //删除
        function del() {
            var manager = $("#maingrid4").ligerGetGridManager();
            var row = manager.getSelectedRow();
            if (!row) { $.ligerDialog.warn("请选择跟进"); return; }

            $.ligerDialog.confirm("删除后不能恢复，\n您确定要删除？", function (yes) {
                if (yes) {
                    $.ajax({
                        url: "Task_follow.del.xhd", type: "POST",
                        data: { id: row.id, rnd: Math.random() },
                        dataType: 'json',
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
                            top.$.ligerDialog.error('删除失败！');
                        }
                    });
                }
            })
        }
    
        //保存按钮
        function f_save(item, dialog) {
            var issave = dialog.frame.f_save();
            if (issave) {
                dialog.close();
                top.$.ligerDialog.waitting('数据保存中,请稍候...');
                $.ajax({
                    url: "Task_follow.save.xhd", type: "POST",
                    data: issave,
                    dataType: 'json',
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
                        top.$.ligerDialog.error('操作失败！');
                    }
                });

            }
        }

        //刷新页面，重新加载Grid
        function f_reload() {
            $("#maingrid5").ligerGetGridManager().loadData(true);
        };


    </script>
</head>
<body>
    <form id="form1" onsubmit="return false">
        <div style="padding:10px;">
        <div id="toolbar"></div>

        <div id="grid">
            <div id="maingrid4" style="margin: -1px; min-width: 800px;"></div>
            <div id="toolbar1" style="margin-top:10px;"></div>
            <div id="maingrid5" style="margin: -1px -1px;"></div>
        </div>

        </div>
    </form>
    <div class="az">
        <form id='serchform'>
            <table style='width: 800px'  class="aztable" >
                <tr>
                    <td>
                        <div style='float: right; text-align: right; width: 60px;'>任务名称：</div>
                    </td>
                    <td>
                        <input type='text' id='taskname' name='taskname' ltype='text' ligerui='{width:120}' /></td>


                    <td>
                        <div style='float: right; text-align: right; width: 60px;'>执行时间：</div>
                    </td>
                    <td>
                        <div style='float: left; width: 100px;'>
                            <input type='text' id='startdate' name='startdate' ltype='date' ligerui='{width:97}' />
                        </div>
                        <div style='float: left; width: 98px;'>
                            <input type='text' id='enddate' name='enddate' ltype='date' ligerui='{width:96}' />
                        </div>
                    </td>
                    <td>
                        <div style='float: right; text-align: right; width: 60px;'>指派人：</div>
                    </td>
                    <td>

                        <input type='text' id='assign_employee' name='assign_employee' /></td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <div style='float: right; text-align: right; width: 60px;'>任务类别：</div>
                    </td>
                    <td>
                        <input id='task_status' name="task_status" type='text' ltype="select" ligerui="{width:120,data:[{id:0,text:'进行中'},{id:1,text:'已完成'},{id:2,text:'已终止'}] }" /></td>


                    <td>
                        <div style='float: right; text-align: right; width: 60px;'>创建时间：</div>
                    </td>
                    <td>
                        <div style='float: left; width: 100px;'>
                            <input type='text' id='startcreate' name='startcreate' ltype='date' ligerui='{width:97}' />
                        </div>
                        <div style='float: left; width: 98px;'>
                            <input type='text' id='endcreate' name='endcreate' ltype='date' ligerui='{width:96}' />
                        </div>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>

                        <div id="btn_serch"></div>
                        <div id="btn_reset"></div></td>
                    <td>

                         </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
