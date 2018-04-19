<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
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
            $("#maingrid4").ligerGrid({
                columns: [
                    //{ display: '���', name: 'n', width: 50 },
                    {
                        display: '��������', name: 'task_title', width: 200, render: function (item, i) {
                            var html = "<a href='javascript:void(0)' onclick=view('task','" + item.id + "')>";
                            if (item.task_title)
                                html += item.task_title;
                            html += "</a>";
                            return html;
                        }
                    },
                    { display: '�������', name: 'task_type', width: 80 },
                    { display: 'ִ����', name: 'executive', width: 80 },
                    { display: 'ָ����', name: 'assign', width: 80 },
                    {
                        display: 'ִ��ʱ��', name: 'executive_time', width: 90, render: function (item) {
                            var d = formatTimebytype(item.executive_time, 'yyyy-MM-dd');
                            var diff = DateDiff(d);
                            if (diff < 0)
                                return "<div style='background:#f00;color:#fff;'>" + d + "</div>";
                            else return d;
                        }
                    },
                    {
                        display: '����״̬', name: 'task_status_id', width: 80, render: function (item, i) {
                            if (item.task_status_id == 0)
                                return "<div style='background:#0f0;'>������</div>";
                            else if (item.task_status_id == 1)
                                return "<div style='background:#f00;color:#fff;'>�����</div>";
                            else if (item.task_status_id == 2)
                                return "<div style='background:#00f;color:#0ff;'>����ֹ</div>";
                            else
                                return "";

                        }
                    },
                    {
                        display: '���ȼ�', name: 'Priority_id', width: 60, render: function (item, i) {
                            if (item.Priority_id == 0)
                                return "��";
                            else if (item.Priority_id == 1)
                                return "��";
                            else
                                return "��";
                        }
                    },
                    {
                        display: '��ؿͻ�', name: 'customer', width: 200, render: function (item) {
                            var html = "<a href='javascript:void(0)' onclick=view('customer','" + item.customer_id + "')>";
                            if (item.customer)
                                html += item.customer;
                            html += "</a>";
                            return html;
                        }
                    },
                    {
                        display: '����ʱ��', name: 'create_time', width: 150, render: function (item) {
                            return formatTime(item.create_time);
                        }
                    }
                ],
                //fixedCellHeight:false,
                rownumbers:true,
                dataAction: 'server', pageSize: 30, pageSizeOptions: [20, 30, 50, 100],
                url: "Task.grid.xhd?type=assign&rnd=" + Math.random(),
                width: '100%', height: '100%',
                heightDiff: -10,
                onRClickToSelect: true,
                onContextmenu: function (parm, e) {
                    actionCustomerID = parm.data.id;
                    menu.show({ top: e.pageY, left: e.pageX });
                    return false;
                },
                detail: {
                    height: 'auto',
                    onShowDetail: function (r, p) {
                        for (var n in r) {
                            if (r[n] == null) r[n] = "";
                        }
                        var grid = document.createElement('div');
                        $(p).append(grid);
                        //$(p).css({ "overflow": "scroll" });
                        $(grid).css('margin', 3).ligerGrid({
                            columns: [
                                { display: '���', width: 40, render: function (item, i) { return i + 1; } },
                                {
                                    display: '��������', name: 'follow_content', align: 'left', width: 300,
                                    render: function (item) {
                                        var html = "<div class='abc'>";
                                        if (item.follow_content)
                                            html += item.follow_content;
                                        html += "</div>";
                                        return html;
                                    }
                                },
                                {
                                    display: '����ʱ��', name: 'follow_time', width: 140,
                                    render: function (item) {
                                        return formatTimebytype(item.follow_time, 'yyyy-MM-dd hh:mm');
                                    }
                                },
                                {
                                    display: '��������', name: 'follow_status', width: 80,
                                    render: function (item) {
                                        if (item.follow_status == "0")
                                            return "<div style='background:#0f0;'>����</div>";
                                        else
                                            return "<div style='background:#f00;color:#fff;'>���</div>";
                                    }
                                }
                            ],
                            allowHideColumn: false,
                            usePager: false,
                            url: "Task_follow.grid.xhd?taskid=" + r.id,
                            width: '99%',
                            height: '100px',
                            heightDiff: 0
                        });
                    }
                }
            });

            $("#grid").height(document.documentElement.clientHeight - $(".toolbar").height());

            $('#serchform').ligerForm();
            toolbar();

            $("#btn_serch").ligerButton({ text: "����", width: 60, click: doserch });
            $("#btn_reset").ligerButton({ text: "����", width: 60, click: doclear });
        });

        //������ʵ����
        function toolbar() {
            $.ajax({
                url: "toolbar.GetSys.xhd",
                type: "POST",
                data: { mid: 'task_ass', rnd: Math.random() },
                //dataType: "json",
                success: function (result) {

                    var data = eval('(' + result + ')');;

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
                    //items.push({ type: "filter", icon: '../../images/icon/51.png', title: "����", click: function () { help(); } })
                    $("#toolbar").ligerToolBar({
                        items: items
                    });
                    menu = $.ligerMenu({
                        width: 120,
                        items: getMenuItems(data)
                    });
                    //$(".az").appendTo($("#toolbar"));
                    $("#maingrid4").ligerGetGridManager()._onResize();
                },
                error: function () {
                    $.ligerDialog.error('��');
                }
            });

        }
        function initSerchForm() {
            $('#executive_employee').ligerComboBox({
                width: 120,
                onBeforeOpen: f_selectExecutive
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
        //��ѯ
        function doserch() {
            var sendtxt = "&type=assign&rnd=" + Math.random();
            var serchtxt = $("#serchform :input").fieldSerialize() + sendtxt;
            //alert(serchtxt);           
            var manager = $("#maingrid4").ligerGetGridManager();

            manager._setUrl("Task.grid.xhd?" + serchtxt);
        }

        //����
        function doclear() {
            $("input:hidden", "#serchform").val("");
            $("input:text", "#serchform").val("");
            $(".l-selected").removeClass("l-selected");
        }

        function f_selectExecutive() {
            $.ligerDialog.open({
                title: 'ѡ����ϵ��', width: 650, height: 300, url: '../../hr/getemp_auth.aspx?auth=0', buttons: [
                    { text: 'ȷ��', onclick: f_selectExecutiveOK },
                    { text: 'ȡ��', onclick: function (item, dialog) { dialog.close(); } }
                ]
            });
            return false;
        }
        function f_selectExecutiveOK(item, dialog) {
            var data = dialog.frame.f_select();
            if (!data) {
                alert('��ѡ����!');
                return;
            }
            $("#executive_employee").val(data.name);
            $("#executive_employee_val").val(data.ID);

            dialog.close();
        }

        //���
        function add() {
            f_openWindow("personal/task/Assignment_add.aspx", "��������", 770, 450, f_save);
        }

        //�޸�
        function edit() {
            var manager = $("#maingrid4").ligerGetGridManager();
            var row = manager.getSelectedRow();
            if (row) {
                f_openWindow('personal/task/Assignment_add.aspx?id=' + row.id, "�޸�����", 770, 450, f_save);
            }
            else {
                $.ligerDialog.warn('��ѡ���У�');
            }
        }


        //ɾ��
        function del() {
            var manager = $("#maingrid4").ligerGetGridManager();
            var row = manager.getSelectedRow();
            if (!row) {
                $.ligerDialog.warn("��ѡ������");
                return;
            }
            $.ligerDialog.confirm("ɾ�����ָܻ���\n��ȷ��Ҫɾ����", function (yes) {
                if (yes) {
                    $.ajax({
                        url: "Task.del.xhd", type: "POST",
                        data: { id: row.id, rnd: Math.random() },
                        dataType: 'json',
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
                            top.$.ligerDialog.error('ɾ��ʧ�ܣ�');
                        }
                    });
                }
            })

        }

        //���水ť
        function f_save(item, dialog) {
            var issave = dialog.frame.f_save();
            if (!issave) return;
            dialog.close();
            top.$.ligerDialog.waitting('���ݱ�����,���Ժ�...');
            $.ajax({
                url: "Task.save.xhd", type: "POST",
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
                    top.$.ligerDialog.error('����ʧ�ܣ�');
                }
            });

        }

        //ˢ��ҳ�棬���¼���Grid
        function f_reload() {
            $("#maingrid4").ligerGetGridManager().loadData(true);
        };

        function stop() {
            var manager = $("#maingrid4").ligerGetGridManager();
            var row = manager.getSelectedRow();
            if (!row) { $.ligerDialog.warn("��ѡ������"); return; }
            if (row.task_status_id == "1") { $.ligerDialog.warn("��������ɣ��޷���ֹ��"); return; }
            $.ligerDialog.confirm("��ȷ��Ҫ��ֹ������", function (yes) {
                if (yes) {
                    $.ajax({
                        url: "Task.stopTask.xhd", type: "POST",
                        data: { id: row.id, rnd: Math.random() },
                        success: function (responseText) {
                            f_reload();
                        },
                        error: function () {
                            top.$.ligerDialog.error('ϵͳ���󣬲���ʧ�ܣ�');
                        }
                    });
                }
            })

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
    <div class="az">
        <form id='serchform'>
            <table style='width: 800px' class="aztable">
                <tr>
                    <td>
                        <div style='float: right; text-align: right; width: 60px;'>�������ƣ�</div>
                    </td>
                    <td>
                        <input type='text' id='taskname' name='taskname' ltype='text' ligerui='{width:120}' /></td>


                    <td>
                        <div style='float: right; text-align: right; width: 60px;'>ִ��ʱ�䣺</div>
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
                        <div style='float: right; text-align: right; width: 60px;'>ִ���ˣ�</div>
                    </td>
                    <td>

                        <input type='text' id='executive_employee' name='executive_employee' />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <div style='float: right; text-align: right; width: 60px;'>�������</div>
                    </td>
                    <td>
                        <input id='task_status' name="task_status" type='text' ltype="select" ligerui="{width:120,data:[{id:0,text:'������'},{id:1,text:'�����'},{id:2,text:'����ֹ'}] }" /></td>


                    <td>
                        <div style='float: right; text-align: right; width: 60px;'>����ʱ�䣺</div>
                    </td>
                    <td>
                        <div style='float: left; width: 100px;'>
                            <input type='text' id='startcreate' name='startcreate' ltype='date' ligerui='{width:97}' />
                        </div>
                        <div style='float: left; width: 98px;'>
                            <input type='text' id='endcreate' name='endcreate' ltype='date' ligerui='{width:96}' />
                        </div>
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <div id="btn_serch"></div>
                        <div id="btn_reset"></div>

                    </td>
                    <td></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
