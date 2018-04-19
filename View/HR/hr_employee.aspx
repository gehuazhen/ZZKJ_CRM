<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="ie=edge chrome=1" />
    <link href="../CSS/input.css" rel="stylesheet" />
    <link href="../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" />
    <link href="../lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />

    <script src="../lib/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
    <script src="../lib/jquery.form.js" type="text/javascript"></script>
    <script src="../JS/XHD.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#maingrid4").ligerGrid({
                columns: [
                    //{ display: 'ID', name: 'ID', type: 'int', width: 50 },
                    //{ display: '���', width: 50, render: function (item, i) { return item.n; } },
                    {
                        display: '����', name: 'name', width: 120, render: function (item) {
                            var html = "<a href='javascript:void(0)' onclick=view('emp','" + item.id + "')>";
                            if (item.name)
                                html += item.name;
                            html += "</a>";
                            return html;
                        }
                    },
                    { display: '��ְ����', name: 'EntryDate' },
                    { display: '����', name: 'birthday' },
                    { display: '�Ա�', name: 'sex', width: 50 },
                    { display: '����', name: 'dep_name' },
                    { display: 'Ĭ�ϸ�λ', name: 'post_name' },
                    { display: 'Ĭ��ְ��', name: 'position_name' },
                    {
                        display: '�ɵ�½', width: 50, render: function (item) {
                            var html = "<div style='margin-top:5px;'><input type='checkbox'";
                            if (item.canlogin == 1) html += "checked='checked'  ";
                            html += " disabled='disabled' /></div>";
                            return html;
                        }
                    },
                    { display: '״̬', name: 'status' }
                ],
                rownumbers:true,
                dataAction: 'server',
                pageSize: 30,
                pageSizeOptions: [20, 30, 50, 100],
                url: "hr_employee.grid.xhd",
                width: '100%',
                height: '100%',
                //title: "Ա���б�",
                heightDiff: -11,
                onRClickToSelect: true,
                onContextmenu: function (parm, e) {
                    actionCustomerID = parm.data.id;
                    menu.show({ top: e.pageY, left: e.pageX });
                    return false;
                },
                //onDblClickRow: function (data, rowindex, rowobj) {
                //    edit();
                //},
                rowtype: "status",
                onAfterShowData: function (grid) {
                    $("tr[rowtype='��ְ']").addClass("l-leaving").removeClass("l-grid-row-alt");
                }
            });



            initLayout();
            $(window).resize(function () {
                initLayout();
            });
            toolbar();
        });

        function toolbar() {
            $.get("toolbar.GetSys.xhd?mid=hr_employee&rnd=" + Math.random(), function (data, textStatus) {
                var data = eval('(' + data + ')');
                //alert(data);
                var items = [];
                var arr = data.Items;
                for (var i = 0; i < arr.length; i++) {
                    arr[i].icon = "../" + arr[i].icon;
                    items.push(arr[i]);
                }
                items.push({ type: 'textbox', id: 'stext', text: '������' });
                items.push({ type: 'button', text: '����', icon: '../images/search.gif', disable: true, click: function () { doserch() } });

                $("#toolbar").ligerToolBar({
                    items: items

                });
                menu = $.ligerMenu({
                    width: 120, items: getMenuItems(data)
                });

                $("#stext").ligerTextBox({ width: 200, nullText: "������������" })
                $("#maingrid4").ligerGetGridManager()._onResize();
            });
        }
        //��ѯ
        function doserch() {
            var sendtxt = "&rnd=" + Math.random();
            var serchtxt = $("#form1 :input").fieldSerialize() + sendtxt;
            //alert(serchtxt);           
            var manager = $("#maingrid4").ligerGetGridManager();

            manager._setUrl("hr_employee.grid.xhd?" + serchtxt);
        }

        function add() {
            f_openWindow("hr/hr_employee_add.aspx", "�����˺�", 730, 490, f_save);
        }

        function edit() {
            var manager = $("#maingrid4").ligerGetGridManager();
            var row = manager.getSelectedRow();
            if (row) {
                f_openWindow('hr/hr_employee_add.aspx?empid=' + row.id, "�޸��˺�", 730, 490, f_save);
            } else {
                $.ligerDialog.warn('��ѡ���У�');
            }
        }

        function changepwd() {
            var manager = $("#maingrid4").ligerGetGridManager();
            var row = manager.getSelectedRow();
            //alert(row.uid);
            if (row) {
                f_openWindow('hr/hr_employee_changpwd.aspx?empid=' + row.id, "�޸�����", 400, 200, function (item, dialog) { dialog.frame.f_save(); })
            }
            else {
                top.$.ligerDialog.error('��ѡ����!');
            }
        }

        function del() {
            var manager = $("#maingrid4").ligerGetGridManager();
            var row = manager.getSelectedRow();
            if (row) {
                $.ligerDialog.confirm("Ա��ɾ�����ָܻ�����Ա�����ڸ�λ���������\n��ȷ��Ҫ�Ƴ���", function (yes) {
                    if (yes) {
                        $.ajax({
                            url: "hr_employee.del.xhd", type: "POST",
                            data: { id: row.id, rnd: Math.random() },
                            dataType: "json",
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
                                top.$.ligerDialog.error('ɾ��ʧ�ܣ�', "", null, 9003);
                            }
                        });
                    }
                })
            } else {
                $.ligerDialog.warn("��ѡ��Ա��");
            }
        }
        function f_save(item, dialog) {
            var issave = dialog.frame.f_save();

            //alert(postnum + " @ " + postdata);
            if (issave) {
                dialog.close();
                $.ligerDialog.waitting('���ݱ�����,���Ժ�...');
                $.ajax({
                    url: "hr_employee.save.xhd", type: "POST",
                    data: issave,
                    dataType: "json",
                    success: function (result) {
                        $.ligerDialog.closeWaitting();
                        var obj = eval(result);

                        if (obj.isSuccess) {
                            f_reload();
                        }
                        else {
                            top.$.ligerDialog.error(obj.Message);
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
    </script>
    <style type="text/css">
        .l-leaving { background: #eee; color: #999; }
    </style>

</head>
<body>

    <form id="form1" onsubmit="return false">
        <div style="padding: 10px;">
            <div id="toolbar"></div>

            <div id="maingrid4" style="background: #fff;"></div>


        </div>
    </form>


</body>
</html>
