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
        $(function () {
            initLayout();
            $(window).resize(function () {
                initLayout();
            });
            $("#maingrid4").ligerGrid({
                columns: [
                    //{ display: '���', width: 50, render: function (item, i) { return item.n; } },
                    {
                        display: '�������', name: 'Serialnumber', width: 180, render: function (item) {
                            var html = "<a href='javascript:void(0)' onclick=view('order','" + item.id + "')>" + item.Serialnumber + "</a>";
                            return html;
                        }
                    },
                    {
                        display: '�ͻ�', name: 'Customer_id', width: 260,  render: function (item) {
                            var html = "<a href='javascript:void(0)' onclick=view('customer','" + item.Customer_id + "')>";
                            if (item.cus_name)
                                html += item.cus_name;
                            html += "</a>";
                            return html;
                        }
                    },
                    { display: '�ɽ�����', name: 'F_dep_id', width: 80, render: function (item, i) { return item.dep_name; } },
                    { display: '�ɽ���Ա', name: 'emp_id', width: 80, render: function (item, i) { return item.emp_name; } },
                    {
                        display: '����״̬', name: 'Order_status_id', width: 70, render: function (item, i) {
                            return item.Order_status;
                        },
                        totalSummary: { type: 'total' }
                    },
                    {
                        display: '����������', name: 'total_amount', width: 100, align: 'right', render: function (item) {
                            return "<div style='color:#135294'>" + toMoney(item.total_amount) + "</div>";
                        }, totalSummary: { type: 'sum_money' }
                    },
                    {
                        display: '�����ܶ����', name: 'receive_money', width: 100, align: 'right', render: function (item) {
                            return "<div style='color:#135294'>" + toMoney(item.receive_money) + "</div>";
                        }, totalSummary: { type: 'sum_money' }
                    },
                    {
                        display: 'δ��������', name: 'arrears_money', width: 100, align: 'right', render: function (item) {
                            return "<div style='color:#135294'>" + toMoney(item.arrears_money) + "</div>";
                        }, totalSummary: { type: 'sum_money' }
                    },
                    {
                        display: '�ѿ�Ʊ�����', name: 'invoice_money', width: 100, align: 'right', render: function (item) {
                            return "<div style='color:#135294'>" + toMoney(item.invoice_money) + "</div>";
                        }
                    },
                    {
                       display: 'δ��Ʊ�����', name: 'arrears_invoice', width: 100, align: 'right', render: function (item) {
                           return "<div style='color:#135294'>" + toMoney(item.arrears_invoice) + "</div>";
                       }
                    },
                    {
                        display: '�ɽ�ʱ��', name: 'Order_date', width: 90, render: function (item) {
                            return formatTimebytype(item.Order_date, 'yyyy-MM-dd');
                        }
                    }

                ],
                //groupColumnName: 'Customer_name', groupColumnDisplay: '�ͻ�',
                //groupRender: function (column, display, data) {
                //    return display + ":" + column + "  ����" + data.length + "����¼����";
                //},
                //defaultCloseGroup: true,
                dataAction: 'server', pageSize: 30, pageSizeOptions: [20, 30, 50, 100],
                url: "Sale_order.grid.xhd?rnd=" + Math.random(),
                width: '100%', height: '100%',
                heightDiff: -10,

                detail: {
                    height: 'auto',
                    onShowDetail: function (r, p) {
                        for (var n in r) {
                            if (r[n] == null) r[n] = "";
                        }
                        var grid = document.createElement('div');
                        $(p).append(grid);
                        $(grid).css('margin', 3).ligerGrid({
                            columns: [
                                //{ display: '���', width: 30, render: function (item, i) { return i + 1; } },
                                { display: '��Ʒ��', name: 'product_name', width: 120 },
                                {
                                    display: '����', name: 'agio', width: 80, type: 'float', align: 'right', render: function (item) {
                                        return toMoney(item.agio);
                                    }
                                },
                                { display: '����', name: 'quantity', width: 40, type: 'int' },
                                { display: '��λ', name: 'unit', width: 40 },
                                {
                                    display: '�ܼ�', name: 'amount', width: 100, type: 'float', align: 'right', render: function (item) {
                                        return toMoney(item.amount) + "Ԫ";
                                    }
                                }

                            ],
                            //selectRowButtonOnly: true,
                            usePager: false,
                            checkbox: true,
                            url: "Sale_order_details.grid.xhd?orderid=" + r.id,
                            width: '99%', height: '180',
                            heightDiff: 0
                        })

                    }
                },
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

            $("#btn_serch").ligerButton({ text: "����", width: 60, click: doserch });
            $("#btn_reset").ligerButton({ text: "����", width: 60, click: doclear });
        });

        function toolbar() {
            $.get("toolbar.GetSys.xhd?mid=sale_order&rnd=" + Math.random(), function (data, textStatus) {
                var data = eval('(' + data + ')');
                //alert(data);
                var items = [];
                var arr = data.Items;
                for (var i = 0; i < arr.length; i++) {
                    arr[i].icon = "../" + arr[i].icon;
                    items.push(arr[i]);
                }
                //items.push({ type: 'button', text: '����չ��/�ر�', icon: '../images/folder-open.gif', disable: true, click: function () { expand(); } });
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
        //function expand(status) {
        //    var manager = $("#maingrid4").ligerGetGridManager();
        //    $(".l-grid-group-togglebtn ", manager.gridbody).click();
        //}
        function initSerchForm() {
            var d = $('#T_status').ligerComboBox({ width: 120, url: "Sys_Param.combo.xhd?type=order_status&rnd=" + Math.random() });
            var e = $('#employee').ligerComboBox({ width: 96 });
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
            var manager = $("#maingrid4").ligerGetGridManager();
            manager._setUrl("Sale_order.grid.xhd?" + serchtxt);
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
            f_openWindow("sale/order_add.aspx", "��������", 770, 500, f_save);
        }

        function edit() {
            var manager = $("#maingrid4").ligerGetGridManager();
            var row = manager.getSelectedRow();
            if (row) {
                f_openWindow('sale/order_add.aspx?id=' + row.id, "�޸Ķ���", 770, 500, f_save);
            }
            else {
                $.ligerDialog.warn('��ѡ���У�');
            }
        }

        function del() {
            var manager = $("#maingrid4").ligerGetGridManager();
            var row = manager.getSelectedRow();
            if (row) {
                $.ligerDialog.confirm("����ɾ���޷��ָ���ȷ��ɾ����", function (yes) {
                    if (yes) {
                        $.ajax({
                            url: "Sale_order.del.xhd", type: "POST",
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
            else {
                $.ligerDialog.warn("��ѡ������");
            }
        }

        function f_check(item, dialog) {

            setTimeout(function (item, dialog) { f_save(item, dialog) }, 100);
        }
        function f_save(item, dialog) {
            var issave = dialog.frame.f_save();
            //alert(postdata);


            if (!issave) {
                return;
            }

            dialog.close();
            $.ligerDialog.waitting('���ݱ�����,���Ժ�...');
            $.ajax({
                url: "Sale_order.save.xhd", type: "POST",
                data: issave,
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
                    $.ligerDialog.closeWaitting();
                    $.ligerDialog.error('����ʧ�ܣ�');
                }
            });
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
            <table style='width: 720px'>
                <tr>
                    <td>
                        <div style='width: 60px; text-align: right; float: right'>�ͻ����ƣ�</div>
                    </td>
                    <td>
                        <input type='text' id='T_cus' name='T_cus' ltype='text' ligerui='{width:120}' /></td>


                    <td>
                        <div style='width: 60px; text-align: right; float: right'>�ɽ�ʱ�䣺</div>
                    </td>
                    <td>
                        <div style='width: 100px; float: left'>
                            <input type='text' id='startdate' name='startdate' ltype='date' ligerui='{width:97}' />
                        </div>
                        <div style='width: 98px; float: left'>
                            <input type='text' id='enddate' name='enddate' ltype='date' ligerui='{width:96}' />
                        </div>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <div style='width: 60px; text-align: right; float: right'>����״̬��</div>
                    </td>
                    <td>
                        <input id='T_status' name="T_status" type='text' /></td>

                    <td>
                        <div style='width: 60px; text-align: right; float: right'>�ɽ���Ա��</div>
                    </td>
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
