<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="ie=edge chrome=1" />

    <link href="../../../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" />
    <link href="../../../lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />
    <link href="../../../CSS/input.css" rel="stylesheet" />

    <script src="../../../lib/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../../../lib/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
    <script src="../../../lib/jquery.form.js" type="text/javascript"></script>
    <script src="../../../JS/XHD.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {

            initLayout();
            $(window).resize(function () {
                initLayout();
            });

            $("#maingrid4").ligerGrid({
                columns: [
                    //{ display: '���', name: 'id', width: 50, render: function (item, i) { return item.n; } },
                    {
                        display: '�ͻ�', name: 'cus_name', width: 200, align: 'left', render: function (item) {
                            var html = "<a href='javascript:void(0)' onclick=view(1,'" + item.id + "')>";
                            if (item.cus_name)
                                html += item.cus_name;
                            html += "</a>";
                            return html;
                        }
                    },
                    { display: '�绰', name: 'cus_tel', width: 120, align: 'right' },
                    { display: '�ͻ�����', name: 'cus_type_id', width: 80, render: function (item, i) { return item.cus_type } },
                    { display: '�ͻ����', name: 'cus_level_id', width: 80, render: function (item, i) { return item.cus_level } },
                    { display: '�ͻ���Դ', name: 'cus_source_id', width: 80, render: function (item, i) { return item.cus_source } },
                    { display: 'ʡ��', name: 'Provinces_id', width: 80, render: function (item, i) { return item.Provinces } },
                    { display: '����', name: 'City_id', width: 80, render: function (item, i) { return item.City } },
                    { display: '������ҵ', name: 'cus_industry_id', width: 80, render: function (item, i) { return item.cus_industry } },
                    { display: '����', name: 'emp_id', width: 80, render: function (item, i) { return item.department } },
                    { display: 'Ա��', name: 'emp_id', width: 80, render: function (item, i) { return item.employee } },
                    {
                        display: '��Դ״̬', name: 'isPrivate', width: 60, render: function (item, i) {
                            if (item.isPrivate == 1) return "����";
                            else
                                return "˽��";
                        }
                    },
                    {
                        display: '������', name: 'lastfollow', width: 90, render: function (item) {
                            var lastfollow = formatTimebytype(item.lastfollow, 'yyyy-MM-dd');
                            if (lastfollow == "1900-01-01")
                                lastfollow = "";
                            return lastfollow;
                        }
                    },
                    {
                        display: 'ɾ��ʱ��', name: 'Delete_time', width: 180, render: function (item) {
                            return formatTimebytype(item.Delete_time, 'yyyy-MM-dd hh:mm:ss');
                        }
                    }

                ],
                rowtype: "CustomerType",
                checkbox: true,
                dataAction: 'server', pageSize: 30, pageSizeOptions: [20, 30, 50, 100],
                url: "CRM_Customer.grid.xhd?isdel=1&rnd=" + Math.random(),
                width: '100%', height: '100%',
                heightDiff: -10,
                onAfterShowData: function (grid) {
                    $("tr[rowtype='�ѳɽ�']").addClass("l-treeleve2").removeClass("l-grid-row-alt");
                },

                onRClickToSelect: true,
                onContextmenu: function (parm, e) {
                    actionCustomerID = parm.data.id;
                    menu.show({ top: e.pageY, left: e.pageX });
                    return false;
                }

            });
            $('#serchform').ligerForm();
            initSerchForm();
            toolbar();
            //toolbar1();

        });

        function toolbar() {
            $("#btn_serch").ligerButton({ text: "����", width: 60, click: doserch });
            $("#btn_reset").ligerButton({ text: "����", width: 60, click: doclear });
            $.get("toolbar.GetSys.xhd?mid=tools_customer&rnd=" + Math.random(), function (result, textStatus) {
                var data = eval('(' + result + ')');;
                //alert(data);
                var items = [];
                var arr = data.Items;
                for (var i = 0; i < arr.length; i++) {
                    arr[i].icon = "../../../" + arr[i].icon;
                    items.push(arr[i]);
                }

                items.push({
                    type: 'serchbtn',
                    text: '�߼�����',
                    icon: '../../../images/search.gif',
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

                $("#grid").height(document.documentElement.clientHeight - $(".toolbar").height());
                $("#maingrid4").ligerGetGridManager()._onResize();

            });
        }
        function initSerchForm() {
            var a = $('#T_City').ligerComboBox({ width: 96, emptyText: '���գ�' });
            var b = $('#T_Provinces').ligerComboBox({
                width: 97,

                url: "Sys_Provinces.combo.xhd?rnd=" + Math.random(),
                onSelected: function (newvalue) {
                    $.get("Sys_City.combo.xhd?provincesid=" + newvalue + "&rnd=" + Math.random(), function (data, textStatus) {
                        a.setData(eval(data));
                    });
                },
                emptyText: '���գ�'
            });
            $('#customertype').ligerComboBox({ width: 97, emptyText: '���գ�', url: "Sys_Param.combo.xhd?type=cus_type&rnd=" + Math.random() });
            $('#customerlevel').ligerComboBox({ width: 96, emptyText: '���գ�', url: "Sys_Param.combo.xhd?type=cus_level&rnd=" + Math.random() });
            $('#cus_sourse').ligerComboBox({ width: 196, emptyText: '���գ�', url: "Sys_Param.combo.xhd?type=cus_source&rnd=" + Math.random() });
            $('#industry').ligerComboBox({ width: 120, emptyText: '���գ�', url: "Sys_Param.combo.xhd?type=cus_industry&rnd=" + Math.random() });
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
            if ($(".az").css("display") == "none") {
                $("#grid").css("margin-top", $(".az").height() + "px");
                $("#maingrid4").ligerGetGridManager()._onResize();
            }
            else {
                $("#grid").css("margin-top", "0px");
                $("#maingrid4").ligerGetGridManager()._onResize();
            }
        }
        $(document).keydown(function (e) {
            if (e.keyCode == 13 && e.target.applyligerui) {
                doserch();
            }
        });
        function doserch() {
            var sendtxt = "&isdel=1&rnd=" + Math.random();
            var serchtxt = $("#serchform :input").fieldSerialize() + sendtxt;
            //alert(serchtxt);
            $.ligerDialog.waitting('���ݲ�ѯ��,���Ժ�...');
            var manager = $("#maingrid4").ligerGetGridManager();

            manager._setUrl("CRM_Customer.grid.xhd?" + serchtxt);
            manager.loadData(true);
            $.ligerDialog.closeWaitting();
        }
        function doclear() {
            $("input:hidden", "#serchform").val("");
            $("input:text", "#serchform").val("");
            $(".l-selected").removeClass("l-selected");
        }

        function regain() {
            var manager = $("#maingrid4").ligerGetGridManager();
            var row = manager.getCheckedRows();
            if (row.length > 0) {
                var rowid = "";
                for (var i = 0; i < row.length; i++) {
                    if (i == (row.length - 1)) {
                        rowid += row[i].id;
                    }
                    else {
                        rowid += row[i].id + ",";
                    }
                }
                $.ajax({
                    url: "CRM_Customer.regain.xhd", type: "POST",
                    data: { idlist: rowid, rnd: Math.random() },
                    dataType:'json',
                    success: function (result) {
                        $.ligerDialog.closeWaitting();

                        var obj = eval(result);

                        if (obj.isSuccess) {
                            $.ligerDialog.warn(obj.Message);
                            f_reload();
                        }
                        else {
                            $.ligerDialog.error(obj.Message);
                        }
                    },
                    error: function () {
                        top.$.ligerDialog.error('�ָ�ʧ�ܣ�');
                    }
                });

            }
            else {
                $.ligerDialog.warn("��ѡ������");
            }
        }

        function del() {
            var manager = $("#maingrid4").ligerGetGridManager();
            var row = manager.getCheckedRows();
            if (row.length > 0) {
                $.ligerDialog.confirm("����ɾ�����ָܻ��������������<br/>��ȷ��Ҫɾ����", function (yes) {
                    if (yes) {
                        var rowid = "";
                        for (var i = 0; i < row.length; i++) {                            
                                rowid += row[i].id + ",";
                        }
                        //alert(rowid);
                        $.ajax({
                            url: "CRM_Customer.del.xhd", type: "POST",
                            data: { idlist: rowid, rnd: Math.random() },
                            dataType:'json',
                            success: function (result) {
                                $.ligerDialog.closeWaitting();

                                var obj = eval(result);

                                if (obj.isSuccess) {
                                    $.ligerDialog.warn(obj.Message);
                                    f_reload();
                                }
                                else {
                                    $.ligerDialog.error(obj.Message);
                                }
                            },
                            error: function () {
                                $.ligerDialog.error('ϵͳ����ɾ��ʧ�ܣ�');
                            }
                        });
                    }
                })
            }
            else {
                $.ligerDialog.warn("��ѡ������");
            }
        }

        function f_reload() {
            var manager = $("#maingrid4").ligerGetGridManager();
            manager.loadData(true);
        };

    </script>
    <style type="text/css">
        .l-treeleve1 { background: orange; }

        .l-treeleve2 { background: yellow; }

        .l-treeleve3 { background: #eee; }
    </style>
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
            <div style="">
                <table style='width: 960px' class="aztable">
                    <tr>
                        <td>
                            <div style='float: right; text-align: right; width: 60px;'>�ͻ����ƣ�</div>
                        </td>
                        <td>
                            <input type='text' id='company' name='company' ltype='text' ligerui='{width:120}' /></td>

                        <td>
                            <div style='float: right; text-align: right; width: 60px;'>�ͻ����ͣ�</div>
                        </td>
                        <td>
                            <div style='float: left; width: 100px;'>
                                <input type='text' id='customertype' name='customertype' />
                            </div>
                            <div style='float: left; width: 98px;'>
                                <input type='text' id='customerlevel' name='customerlevel' />
                            </div>
                        </td>
                        <td>
                            <div style='float: right; text-align: right; width: 60px;'>¼��ʱ�䣺</div>
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
                            <input id='keyword' name="keyword" type='text' ltype='text' ligerui='{width:196, nullText: "����ؼ���������ַ����������ע"}' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style='float: right; text-align: right; width: 60px;'>������ҵ��</div>
                        </td>
                        <td>
                            <input id='industry' name="industry" type='text' /></td>

                        <td>
                            <div style='float: right; text-align: right; width: 60px;'>����������</div>
                        </td>
                        <td>
                            <div style='float: left; width: 100px;'>
                                <input type='text' id='T_Provinces' name='T_Provinces' />
                            </div>
                            <div style='float: left; width: 98px;'>
                                <input type='text' id='T_City' name='T_City' />
                            </div>
                        </td>
                        <td>
                            <div style='float: right; text-align: right; width: 60px;'>��������</div>
                        </td>
                        <td>
                            <div style='float: left; width: 100px;'>
                                <input type='text' id='startfollow' name='startfollow' ltype='date' ligerui='{width:97}' />
                            </div>
                            <div style='float: left; width: 98px;'>
                                <input type='text' id='endfollow' name='endfollow' ltype='date' ligerui='{width:96}' />
                            </div>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <div style='float: right; text-align: right; width: 60px;'>�绰��</div>
                        </td>
                        <td>
                            <input type='text' id='tel' name='tel' ltype='text' ligerui='{width:120}' />
                        </td>

                        <td>
                            <div style='float: right; text-align: right; width: 60px;'>�ͻ���Դ��</div>
                        </td>
                        <td>
                            <input type='text' id='cus_sourse' name='cus_sourse' />
                        </td>
                        <td>
                            <div style='float: right; text-align: right; width: 60px;'>ҵ��Ա��</div>
                        </td>
                        <td>
                            <div style='float: left; width: 100px;'>
                                <input type='text' id='department' name='department' />
                            </div>
                            <div style='float: left; width: 98px;'>
                                <input type='text' id='employee' name='employee' />
                            </div>
                        </td>
                        <td>
                            <div id="btn_serch"></div>
                            <div id="btn_reset"></div>
                            <%--<input id='Button2' type='button' value='����' style='height: 24px; width: 80px;' onclick=" doclear() " />
                            <input id='Button1' type='button' value='����' style='height: 24px; width: 80px;' onclick=" doserch() " />--%>
                        </td>
                    </tr>
                </table>

            </div>
        </form>
    </div>
</body>
</html>

