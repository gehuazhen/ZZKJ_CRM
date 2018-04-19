<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="ie=edge chrome=1" />
    <link href="../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" />
    <link href="../lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />
    <link href="../CSS/input.css" rel="stylesheet" />

    <script src="../lib/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
    <script src="../lib/jquery.form.js" type="text/javascript"></script>
    <script src="../JS/XHD.js" type="text/javascript"></script>
    <script type="text/javascript">
        var manager;
        var manager1;
        $(function () {

            initLayout();
            $(window).resize(function () {
                initLayout();
            });

            $("#maingrid4").ligerGrid({
                columns: [
                    {
                        display: '��ͬ���', name: 'Serialnumber', width: 80, render: function (item) {
                            var html = "<a href='javascript:void(0)' onclick=view('contract','" + item.id + "')>";
                            if (item.Serialnumber)
                                html += item.Serialnumber;
                            html += "</a>";
                            return html;
                        }
                    },
                    {
                        display: '��ͬ����', name: 'Contract_name', width: 200, align: 'left', render: function (item) {
                            var html = "<a href='javascript:void(0)' onclick=view('contract','" + item.id + "')>";
                            if (item.Contract_name)
                                html += item.Contract_name;
                            html += "</a>";
                            return html;
                        }
                    },
                    {
                        display: '�ͻ�����', name: 'cus_name', width: 200, render: function (item) {
                            var html = "<a href='javascript:void(0)' onclick=view('customer','" + item.Customer_id + "')>";
                            if (item.cus_name)
                                html += item.cus_name;
                            html += "</a>";
                            return html;
                        }
                    },
                    {
                        display: '��ͬ���(��)', name: 'Contract_amount', width: 120, align: 'right', render: function (item) {
                            return toMoney(item.Contract_amount);
                        }, totalSummary: { type: 'sum_money' }
                    },
                    { display: 'ǩ������', name: 'department', width: 120 },
                    { display: 'ǩ����', name: 'Our_Contractor', width: 80 },
                    {
                        display: '��ͬ����', name: 'End_date', width: 110, render: function (item) {
                            var formattime = formatTimebytype(item.End_date, "yyyy-MM-dd");
                            var diff = DateDiff(formattime);
                            if (diff < 0)
                                return "<div style='color:#0030ff'>�ѵ���</div>";
                            else if (diff <= 30)
                                return "<div style='color:#f00;font-weight:bold;'>����" + diff + "�쵽��</div>";
                            else if (diff <= 60)
                                return "<div style='color:#ffa800'>����" + diff + "�쵽��</div>";
                            else return formattime;

                        }
                    },
                    {
                        display: 'ǩ������', name: 'Sign_date', width: 90, render: function (item, i) {
                            return formatTimebytype(item.Sign_date, "yyyy-MM-dd");
                        }
                    }

                ],
                
                defaultCloseGroup: true,
                dataAction: 'server', pageSize: 30, pageSizeOptions: [20, 30, 50, 100],
                url: "CRM_contract.grid.xhd?rnd=" + Math.random(),
                width: '100%', height: '100%',
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
            //toolbar1();
            $("#btn_serch").ligerButton({ text: "����", width: 60, click: doserch });
            $("#btn_reset").ligerButton({ text: "����", width: 60, click: doclear });

        });

        function toolbar() {
            $.get("toolbar.GetSys.xhd?mid=sale_contract&rnd=" + Math.random(), function (data, textStatus) {
                //alert(data);
                var data = eval('(' + data + ')');
                var items = [];
                var arr = data.Items;
                for (var i = 0; i < arr.length; i++) {
                    arr[i].icon = "../" + arr[i].icon;
                    items.push(arr[i]);
                }
               

                items.push({
                    type: 'serchbtn',
                    text: '�߼�����',
                    icon: '../images/search.gif',
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

                $("#maingrid4").ligerGetGridManager()._onResize();
            });
        }
        function expand(status) {
            var manager = $("#maingrid4").ligerGetGridManager();
            $(".l-grid-group-togglebtn ", manager.gridbody).click();
        }
        function initSerchForm() {
            var e = $('#employee').ligerComboBox({ width: 96, emptyText: '���գ�' });
            var f = $('#department').ligerComboBox({
                width: 97,
                selectBoxWidth: 240,
                selectBoxHeight: 200,
                valueField: 'id',
                textField: 'text',
                treeLeafOnly: false,
                tree: {
                    url: 'hr_department.tree.xhd?rnd=' + Math.random(),
                    idFieldName: 'id',
                    //parentIDFieldName: 'pid',
                    checkbox: false
                },
                onSelected: function (newvalue) {
                    $.get("hr_employee.combo.xhd?did=" + newvalue + "&rnd=" + Math.random(), function (data, textStatus) {
                        e.setData(eval(data));
                    });
                }
            });
        }
        function serchpanel() {
            initSerchForm();
            if ($(".az").css("display") == "none") {
                $("#grid").css("margin-top", $(".az").height() + "px");
                $("#maingrid4").ligerGetGridManager()._onResize();
            }
            else {
                $("#grid").css("margin-top", "0px");
                $("#maingrid4").ligerGetGridManager()._onResize();
            }
        }
        function doserch() {
            var sendtxt = "&rnd=" + Math.random();
            var serchtxt = $("#serchform :input").fieldSerialize() + sendtxt;
            //alert(serchtxt);
            var manager = $("#maingrid4").ligerGetGridManager();

            manager._setUrl("CRM_contract.grid.xhd?" + serchtxt);
        }
        function doclear() {
            $("input:hidden", "#serchform").val("");
            $("input:text", "#serchform").val("");
            $(".l-selected").removeClass("l-selected");
        }
        $(document).keydown(function (e) {
            if (e.keyCode == 13 && e.target.applyligerui) {
                doserch();
            }
        });


        function add() {
            f_openWindow("sale/contract_add.aspx", "������ͬ", 720, 500, f_save);
        }

        function edit() {
            var manager = $("#maingrid4").ligerGetGridManager();
            var row = manager.getSelectedRow();
            if (row) {
                f_openWindow('sale/contract_add.aspx?id=' + row.id, "�޸ĺ�ͬ", 720, 500, f_save);
            }
            else {
                $.ligerDialog.warn('��ѡ���У�');
            }
        }

        function del() {
            var manager = $("#maingrid4").ligerGetGridManager();
            var row = manager.getSelectedRow();
            if (row) {
                $.ligerDialog.confirm("��ͬɾ���޷��ָ���ȷ��ɾ����", function (yes) {
                    if (yes) {
                        $.ajax({
                            url: "CRM_contract.del.xhd", type: "POST",
                            data: { id: row.id, rnd: Math.random() },
                            success: function (responseText) {
                                f_reload();
                            },
                            error: function () {
                                top.$.ligerDialog.error('ɾ��ʧ�ܣ�');
                            }
                        });
                    }
                })
            }
            else {
                $.ligerDialog.warn("��ѡ������");
            }
        }


        function f_save(item, dialog) {
            var issave = dialog.frame.f_save();
            if (issave) {
                //dialog.close();
                top.$.ligerDialog.waitting('���ݱ�����,���Ժ�...', 9003);
                $.ajax({
                    url: "CRM_contract.save.xhd", type: "POST",
                    data: issave,
                    success: function (responseText) {
                        //$.ligerDialog.closeWaitting();
                        dialog.frame.startup();
                        f_reload();
                    },
                    error: function () {
                        top.$.ligerDialog.closeWaitting();
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
            <table style='width: 950px' class="aztable">
                <tr>
                    <td>
                        <div style='width: 60px; text-align: right; float: right'>�ͻ����ƣ�</div>
                    </td>
                    <td>
                        <input type='text' id='company' name='company' ltype='text' ligerui='{width:120}' /></td>
                    <td>
                        <div style='width: 60px; text-align: right; float: right'>��ʼ���ڣ�</div>
                    </td>
                    <td>
                        <div style='width: 100px; float: left'>
                            <input type='text' id='startdate1' name='startdate1' ltype='date' ligerui='{width:97}' />
                        </div>
                        <div style='width: 98px; float: left'>
                            <input type='text' id='startdate2' name='startdate2' ltype='date' ligerui='{width:96}' />
                        </div>
                    </td>
                    <td>ǩ�����ڣ�</td>
                    <td>
                        <div style='width: 100px; float: left'>
                            <input type='text' id='signdate1' name='signdate1' ltype='date' ligerui='{width:97}' />
                        </div>
                        <div style='width: 98px; float: left'>
                            <input type='text' id='signdate2' name='signdate2' ltype='date' ligerui='{width:96}' />
                        </div>

                    </td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <div style='width: 60px; text-align: right; float: right'>��ͬ����</div>
                    </td>
                    <td>
                        <input id='contract' name="contract" type='text' ltype='text' ligerui='{width:120}' /></td>
                    <td>
                        <div style='width: 60px; text-align: right; float: right'>�������ڣ�</div>
                    </td>
                    <td>
                        <div style='width: 100px; float: left'>
                            <input type='text' id='enddate1' name='enddate1' ltype='date' ligerui='{width:97}' />
                        </div>
                        <div style='width: 98px; float: left'>
                            <input type='text' id='enddate2' name='enddate2' ltype='date' ligerui='{width:96}' />
                        </div>
                    </td>
                    <td>ҵ��Ա</td>
                    <td>
                        <div style='width: 100px; float: left'>
                            <input type='text' id='department' name='department' />
                        </div>
                        <div style='width: 98px; float: left'>
                            <input type='text' id='employee' name='employee' />
                        </div>
                    </td>
                    <td></td>
                    <td>
                        <div id="btn_serch"></div>
                        <div id="btn_reset"></div>

                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
