<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="ie=edge chrome=1" />

    <link href="../../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" />
    <link href="../../lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />
    <link href="../../CSS/input.css" rel="stylesheet" type="text/css" />

    <script src="../../lib/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>

    <script src="../../JS/XHD.js" type="text/javascript"></script>
    <script type="text/javascript">
        var g1, g2, g3, g4, g5, g6;
        $(function () {
            loadForm(getparastr("id"));
            f_tab();
            f_authtab();

            f_heightChanged();
            $(window).resize(function () {
                f_heightChanged();
            });
        })

        function loadForm(oaid) {
            $.ajax({
                type: "GET",
                url: "CRM_Customer.form.xhd", /* ע���������ֶ�ӦCS�ķ������� */
                data: { id: oaid, rnd: Math.random() }, /* ע������ĸ�ʽ������ */
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    var obj = eval(result);
                    for (var n in obj) {
                        if (obj[n] == null || obj[n] == "null")
                            obj[n] = "";
                    }
                    //alert(obj.constructor); //String ���캯��
                    $("#T_cus").text(obj.cus_name);
                    $("#T_add").text(obj.cus_add);
                    $("#T_tel").text(obj.cus_tel);
                    $("#T_fax").text(obj.cus_fax);
                    $("#T_website").text(obj.cus_website);
                    $("#T_descript").text(obj.DesCripe);
                    $("#T_remark").text(obj.Remarks);

                    $("#T_emp").text("��" + obj.department + "��" + obj.employee);

                    $("#T_custype").text(obj.cus_type);
                    $("#T_cussourse").text(obj.cus_source);
                    $("#T_cuslevel").text(obj.cus_level);
                    $("#T_industry").text(obj.cus_industry);
                    $("#T_city").text(obj.Provinces + "." + obj.City);

                    $("#T_status").text(obj.isPrivate == "0" ? "˽��" : "����");
                }
            });

        }
        var tab;
        function f_tab() {
            var bodyHeight = $(window).height() - 275;
            //Tab
            tab = $("#maintab").ligerTab({
                height: bodyHeight,
                onAfterSelectTabItem: f_onResize
            });

        }

        function f_onResize() {
            g1 && g1._onResize();
            g2 && g2._onResize();
            g3 && g3._onResize();
            g4 && g4._onResize();
            g5 && g5._onResize();
            g6 && g6._onResize();
        }

        function f_heightChanged() {
            var bodyHeight = $(window).height() - 275;
            if (tab)
                tab.setHeight(bodyHeight);
        }

        function f_authtab() {
            var curauth = ['customer_contact', 'contact_follow', 'sale_order', 'finance_receivable', 'sale_contract'];
            $.ajax({
                type: "GET",
                url: "Sys_role.getEmpMenus.xhd", /* ע���������ֶ�ӦCS�ķ������� */
                data: { rnd: Math.random() }, /* ע������ĸ�ʽ������ */
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    var obj = eval(result);
                    //obj.menulist[m]                    

                    for (var m in curauth) {
                        var del = true;
                        for (var n in obj.menulist) {
                            if (obj.menulist[n] == curauth[m]) {
                                del = false;
                                buidtoolbar(curauth[m]);
                                break;
                            }
                        }
                        del && tab.removeTabItem(curauth[m]);
                    }

                    buidtabcontent();
                }
            });
        }
        function buidtoolbar(id) {
            $.ajax({
                url: "toolbar.GetSys.xhd",
                type: "POST",
                data: { mid: id, rnd: Math.random() },
                //dataType: "json",
                success: function (result) {
                    var data = eval('(' + result + ')');;

                    var items = [];
                    var arr = data.Items;
                    for (var i = 0; i < arr.length; i++) {
                        arr[i].icon = "../../" + arr[i].icon;
                        if (arr[i].text == "����")
                            continue;
                        items.push(arr[i]);
                    }

                    $("#toolbar_" + id).ligerToolBar({
                        items: items
                    });
                },
                error: function () {
                    $.ligerDialog.error('��');
                }
            });
        }

        function buidtabcontent() {
            setTimeout(f_contact(), 0);
            setTimeout(f_follow(), 10);
            setTimeout(f_order(), 20);
            setTimeout(f_log(), 30);
            setTimeout(f_receivable(), 40);
            setTimeout(f_contract(), 50);
        }

        function f_log() {
            g4 = $("#maingrid_log").ligerGrid({
                columns: [
                    { display: '��־����', name: 'EventType', width: 120 },
                    //{ display: '��ʶ', name: 'EventID', width: 40 },
                    { display: '����', name: 'EventTitle', width: 250 },
                    { display: '������', name: 'UserID', width: 120, render: function (item, i) { return item.UserName } },
                    {
                        display: '����ʱ��', name: 'EventDate', width: 180, render: function (item) {
                            return formatTime(item.EventDate);
                        }
                    },
                    { display: 'IP', name: 'IPStreet', width: 160 }
                ],
                dataAction: 'server', pageSize: 30, pageSizeOptions: [20, 30, 50, 100],
                //checkbox:true,
                url: "Sys_log.grid.xhd?EventID= " + getparastr("id"),
                width: '100%', height: '100%',
                heightDiff: -10,

                detail: {
                    height: 'auto',
                    onShowDetail: function (r, p) {
                        for (var n in r) {
                            if (r[n] == null) r[n] = "";
                        }
                        $(p).append(
                            "<table class='bodytable0'  style='width:99%;margin:5px'>" +
                                //"<tr>" +
                                //    "<td height='23' width='10%' class='table_label'>��־���ͣ�</td><td height='23'  width='15%'>" + r.EventType + "</td>" +                                    
                                //    "<td height='23' width='10%' class='table_label'>���⣺</td><td height='23'  width='15%'>" + r.EventTitle + "</td>" +
                                //    "<td height='23' width='10%' class='table_label'>IP��</td><td height='23'  width='15%'>" + r.IPStreet + "</td>" +
                                //"</tr>" +
                                "<tr>" +

                                    "<td height='23' width='10%' class='table_label'>��ʶ��</td><td height='23'  >" + r.EventID + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td height='23' width='10%' class='table_label'>��־���ݣ�</td><td height='23'>" + r.Log_Content.replace(/\n/g, "<br />") + "</td>" +
                                "</tr>" +
                            "</table>");
                    }
                }
            });
        }

        function f_contact() {
            if (!$("#maingrid_contact")) return;
            g1 = $("#maingrid_contact").ligerGrid({
                columns: [
                    {
                        display: '��ϵ��', name: 'C_name', width: 100, render: function (item) {
                            var html = "<a href='javascript:void(0)' onclick=view('contact','" + item.id + "')>";
                            if (item.C_name)
                                html += item.C_name;
                            html += "</a>";
                            return html;
                        }
                    },
                    { display: '����', name: 'C_department', width: 100 },
                    { display: 'ְ��', name: 'C_position', width: 100 },
                    {
                        display: '�Ա�', name: 'C_sex', width: 50, render: function (item, i) {
                            switch (item.C_sex) {
                                case 0: return "��";
                                case 1: return "Ů";
                            }
                        }
                    },
                    { display: '�绰', name: 'C_tel', width: 120 },
                    { display: '�ֻ�', name: 'C_mob', width: 120 },
                    {
                        display: 'QQ', name: 'C_QQ', width: 100, render: function (item, i) {
                            var html = "<a href='javascript:void(0)' onclick=f_qq('" + item.C_QQ + "')>";
                            if (item.C_QQ) {
                                html += "<img src='../../images/icon/97.png'/>";
                                html += item.C_QQ;
                            }
                            html += "</a>";
                            return html;
                        }
                    },
                    {
                        display: 'Email', name: 'C_email', width: 200, render: function (item, i) {
                            var html = "<a href='mailto:" + item.C_email + "'>";
                            if (item.C_email) {
                                html += "<img src='../../images/icon/47.png'/>";
                                html += item.C_email;
                            }
                            html += "</a>";
                            return html;
                        }
                    }
                ],
                dataAction: 'server',
                pageSize: 30,
                pageSizeOptions: [20, 30, 50, 100],
                url: "CRM_Contact.grid.xhd?customerid=" + getparastr("id"),
                width: '100%',
                height: '100%',
                //title: "Ա���б�",
                heightDiff: -10,
                onRClickToSelect: true
            });

        }

        function f_follow() {
            if (!$("#maingrid_follow")) return;
            g2 = $("#maingrid_follow").ligerGrid({
                columns: [
                    {
                        display: '��ϵ��', name: 'contact_id', width: 80, render: function (item) {
                            var html = "<a href='javascript:void(0)' onclick=view('contact','" + item.contact_id + "')>";
                            if (item.contact_name)
                                html += item.contact_name;
                            html += "</a>";
                            return html;
                        }
                    },
                    {
                        display: '��������', name: 'follow_content', align: 'left', width: 200, render: function (item) {
                            var html = "<div class='abc'><a href='javascript:void(0)' onclick=view('follow','" + item.id + "')>";
                            if (item.follow_content)
                                html += item.follow_content;
                            html += "</a></div>";
                            return html;
                        }
                    },
                        { display: '����Ŀ��', name: 'Follow_aim_id', width: 80, render: function (item, i) { return item.Follow_aim; } },
                    {
                        display: '����ʱ��', name: 'follow_time', width: 140, render: function (item) {
                            return formatTimebytype(item.follow_time, 'yyyy-MM-dd hh:mm');
                        }
                    },
                    { display: '������ʽ', name: 'Follow_Type_id', width: 80, render: function (item, i) { return item.Follow_Type; } },
                    { display: '��������', name: 'Employee_id', width: 80, render: function (item, i) { return item.Department; } },
                    { display: '������', name: 'Employee_id', width: 80, render: function (item, i) { return item.Employee; } },
                    {
                        display: '�´θ���ʱ��', name: 'follow_time', width: 140, render: function (item) {
                            return formatTimebytype(item.next_time, 'yyyy-MM-dd hh:mm');
                        }
                    }
                ],
                onAfterShowData: function (grid) {
                    $(".abc").hover(function (e) {
                        $(this).ligerTip({ content: $(this).text(), width: 200, distanceX: event.clientX - $(this).offset().left - $(this).width() + 15 });
                    }, function (e) {
                        $(this).ligerHideTip(e);
                    });
                },
                //title: "������Ϣ",
                dataAction: 'server', pageSize: 30, pageSizeOptions: [20, 30, 50, 100],
                url: "CRM_follow.grid.xhd?customer_id=" + getparastr("id"),
                width: '100%', height: '100%',
                heightDiff: -10
            });
        }
        function f_order() {
            if (!$("#maingrid_order")) return;
            g3 = $("#maingrid_order").ligerGrid({
                columns: [
                    { display: '�������', name: 'Serialnumber', width: 180 },

                    {
                        display: '�ɽ���Ա', width: 100, render: function (item) {
                            return item.dep_name + "." + item.emp_name;
                        }
                    },
                    { display: '����״̬', name: 'Order_status', width: 100 },
                    {
                        display: '����������', name: 'total_amount', width: 100, align: 'right', render: function (item, i) {
                            return toMoney(item.total_amount);
                        }
                    },
                    {
                        display: '�ɽ�ʱ��', name: 'Order_date', width: 90, render: function (item) {
                            return formatTimebytype(item.Order_date, 'yyyy-MM-dd');
                        }
                    }

                ],
                //title: '��������',
                dataAction: 'server', pageSize: 30, pageSizeOptions: [20, 30, 50, 100],
                url: "Sale_order.grid.xhd?customerid=" + getparastr("id") + "&rnd=" + Math.random(),
                width: '100%', height: '100%',
                heightDiff: -10
            });
        }

        function f_receivable() {
            if (!$("#maingrid_receivable")) return;
            g5 = $("#maingrid_receivable").ligerGrid({
                columns: [
                    { display: '���', name: 'receivable_no', width: 180 },
                    {
                        display: '����', name: 'Order_no', width: 180, render: function (item) {
                            var html = "<a href='javascript:void(0)' onclick=view('order','" + item.order_id + "')>";
                            if (item.Order_no)
                                html += item.Order_no;
                            html += "</a>";
                            return html;
                        }
                    },
                    {
                        display: 'Ӧ�ս��', name: 'receivable_amount', width: 100, align: 'right', render: function (item, i) {
                            return toMoney(item.receivable_amount);
                        }, totalSummary: { type: 'sum_money' }
                    },
                    {
                        display: '���ս��', name: 'received_amount', width: 100, align: 'right', render: function (item, i) {
                            return toMoney(item.received_amount);
                        }, totalSummary: { type: 'sum_money' }
                    },
                    {
                        display: 'δ�����', name: 'arrears_amount', width: 100, align: 'right', render: function (item, i) {
                            return toMoney(item.arrears_amount);
                        }, totalSummary: { type: 'sum_money' }
                    },
                    {
                        display: 'Ӧ��ʱ��', name: 'receivable_time', width: 100, render: function (item, i) {
                            return formatTimebytype(item.receivable_time, "yyyy-MM-dd");
                        }
                    }

                ],
                //title: '�տ��¼',
                dataAction: 'server', pageSize: 30, pageSizeOptions: [20, 30, 50, 100],
                //checkbox:true,
                url: "Finance_Receivable.grid.xhd?customerid=" + getparastr("id") + "&rnd=" + Math.random(),
                width: '100%', height: '100%',
                heightDiff: -10
            });
        }

        function f_contract() {
            if (!$("#maingrid_contract")) return;
            g6 = $("#maingrid_contract").ligerGrid({
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

                dataAction: 'server', pageSize: 30, pageSizeOptions: [20, 30, 50, 100],
                url: "CRM_contract.grid.xhd?customerid=" + getparastr("id") + "&rnd=" + Math.random(),
                width: '100%', height: '100%',
                heightDiff: -10
            });
        }

        function add(item) {
            var url = "", title = "", width = 0, height = 0;
            var menuid = item.menu;
            switch (menuid) {
                case "customer_contact":
                    url = "CRM/Customer/Customer_Contact_add.aspx?customer_id=" + getparastr("id");
                    title = "������ϵ��";
                    width = 730;
                    height = 450;
                    break;
                case "contact_follow":
                    url = "CRM/contact/Customer_follow_add.aspx?customer_id=" + getparastr("id");
                    title = "��������";
                    width = 630;
                    height = 400;
                    break;
                case "sale_order":
                    url = "sale/order_add.aspx?customer_id=" + getparastr("id");
                    title = "��������";
                    width = 770;
                    height = 490;
                    break;
                case "finance_receivable":
                    url = "finance/receivable_add.aspx?customer_id=" + getparastr("id");
                    title = "����Ӧ��";
                    width = 770;
                    height = 490;
                    break;
                case "sale_contract":
                    url = "sale/contract_add.aspx?customer_id=" + getparastr("id");
                    title = "������ͬ";
                    width = 770;
                    height = 490;
                    break;
            }
            f_openWindow(url, title, width, height, function (item, dialog) { f_save(item, dialog, menuid); });
        }
        function edit(item) {
            var url = "", title = "", width = 0, height = 0;
            var menuid = item.menu;
            switch (menuid) {
                case "customer_contact":
                    var row = g1.getSelectedRow();
                    if (!row) {
                        $.ligerDialog.warn('��ѡ���У�');
                        return;
                    }
                    url = "CRM/Customer/Customer_Contact_add.aspx?id=" + row.id;
                    title = "�޸���ϵ��";
                    width = 730;
                    height = 450;
                    break;
                case "contact_follow":
                    var row = g2.getSelectedRow();
                    if (!row) {
                        $.ligerDialog.warn('��ѡ���У�');
                        return;
                    }
                    url = "CRM/contact/Customer_follow_add.aspx?id=" + row.id;
                    title = "�޸ĸ���";
                    width = 630;
                    height = 400;
                    break;
                case "sale_order":
                    var row = g3.getSelectedRow();
                    if (!row) {
                        $.ligerDialog.warn('��ѡ���У�');
                        return;
                    }
                    url = "sale/order_add.aspx?id=" + row.id;
                    title = "��������";
                    width = 770;
                    height = 490;
                    break;
                case "finance_receivable":
                    var row = g5.getSelectedRow();
                    if (!row) {
                        $.ligerDialog.warn('��ѡ���У�');
                        return;
                    }
                    url = "finance/receivable_add.aspx?id=" + row.id;
                    title = "�޸�Ӧ��";
                    width = 770;
                    height = 490;
                    break;
                case "sale_contract":
                    var row = g6.getSelectedRow();
                    if (!row) {
                        $.ligerDialog.warn('��ѡ���У�');
                        return;
                    }
                    url = "sale/contract_add.aspx?id="  +row.id;
                    title = "�޸ĺ�ͬ";
                    width = 770;
                    height = 490;
                    break;
            }
            f_openWindow(url, title, width, height, function (item, dialog) { f_save(item, dialog, menuid); });
        }

        function del(item) {
            var url = "";
            var row;
            switch (item.menu) {
                case "customer_contact":
                    var row = g1.getSelectedRow();
                    url = "CRM_Contact.del.xhd";
                    break;
                case "contact_follow":
                    var row = g2.getSelectedRow();
                    url = "CRM_follow.del.xhd";
                    break;
                case "sale_order":
                    var row = g3.getSelectedRow();
                    url = "Sale_order.del.xhd";
                    break;
                case "finance_receivable":
                    var row = g5.getSelectedRow();
                    url = "Finance_Receivable.del.xhd";
                    break;
                case "sale_contract":
                    var row = g6.getSelectedRow();
                    url = "CRM_contract.del.xhd";
                    break;
            }

            if (!row) {
                $.ligerDialog.warn("��ѡ������!");
                return;
            }

            $.ligerDialog.confirm("����ɾ���޷��ָ���ȷ��ɾ����", function (yes) {
                if (yes) {
                    $.ajax({
                        url: url, type: "POST",
                        data: { id: row.id, rnd: Math.random() },
                        dataType: "json",
                        success: function (result) {
                            top.$.ligerDialog.closeWaitting();

                            var obj = eval(result);

                            if (obj.isSuccess) {
                                f_reload(item.menu);
                            }
                            else {
                                $.ligerDialog.error(obj.Message);
                            }
                        },
                        error: function () {
                            $.ligerDialog.error('ɾ��ʧ�ܣ�');
                        }
                    });
                }
            })
        }

        function f_save(item, dialog, id) {
            var issave = dialog.frame.f_save();
            if (!issave) return;

            var url = "";
            switch (id) {
                case "customer_contact": url = "CRM_Contact.save.xhd"; dialog.close(); break;
                case "contact_follow": url = "CRM_follow.save.xhd"; dialog.close(); break;
                case "sale_order": url = "Sale_order.save.xhd"; dialog.close(); break;
                case "finance_receivable": url = "Finance_Receivable.save.xhd"; dialog.close(); break;
                case "sale_contract": url = "CRM_contract.save.xhd"; break;
            }

            top.$.ligerDialog.waitting('���ݱ�����,���Ժ�...',9003);
            $.ajax({
                url: url, type: "POST",
                data: issave,
                dataType: "json",
                success: function (result) {
                   

                    var obj = eval(result);

                    if (obj.isSuccess) {
                        if (id == "sale_contract") {
                            dialog.frame.startup();
                        }
                        else {
                            top.$.ligerDialog.closeWaitting();
                        }
                        f_reload(id);
                    }
                    else {
                        $.ligerDialog.error(obj.Message);
                    }
                },
                error: function () {
                    top.$.ligerDialog.closeWaitting();
                    $.ligerDialog.error('����ʧ�ܣ�');
                }
            });
        }

        function f_reload(id) {
            switch (id) {
                case "customer_contact": g1.loadData(true); break;
                case "contact_follow": g2.loadData(true); break;
                case "sale_order": g3.loadData(true); break;
                case "finance_receivable": g5.loadData(true); break;
                case "sale_contract": g6.loadData(true); break;
            }
        }

        function toimport()
        { }
    </script>
    <style>
        .bodytable0 td { height: 27px; padding-left: 5px; }
        .l-layout-center { border-top: none; }
    </style>
</head>
<body>
    <div style="margin: 0; padding: 0 5px;">

        <div id="navtab1" style="width: 100%; height: 100%; overflow: hidden; margin-top: 5px;">
            <table style="width: 100%; margin-top: 2px; background: #fff;" class='bodytable0'>
                <tr>
                    <td colspan="4" class="table_title1">�ͻ�����</td>
                </tr>
                <tr>
                    <td class="table_label" style="width: 100px;">�ͻ����ƣ�</td>
                    <td>
                        <span id="T_cus"></span>

                    </td>
                    <td class="table_label" style="width: 100px;">�ͻ���ַ��</td>
                    <td>
                        <span id="T_website"></span>
                    </td>
                </tr>
                <tr>
                    <td class="table_label">������ҵ��</td>
                    <td>
                        <span id="T_industry"></span>
                    </td>
                    <td class="table_label">����������</td>
                    <td>
                        <span id="T_city"></span>
                    </td>
                </tr>
                <tr>
                    <td class="table_label">�ͻ��绰��</td>
                    <td>
                        <span id="T_tel"></span>
                    </td>
                    <td class="table_label">���棺</td>
                    <td>
                        <span id="T_fax"></span>
                    </td>
                </tr>
                <tr>
                    <td class="table_label">�ͻ���ַ��</td>
                    <td>
                        <span id="T_add"></span></td>
                    <td class="table_label">�ͻ����ͣ�</td>
                    <td>
                        <span id="T_custype"></span>
                    </td>
                </tr>
                <tr>
                    <td class="table_label">�ͻ�����</td>
                    <td>

                        <span id="T_cuslevel"></span>
                    </td>
                    <td class="table_label">�ͻ���Դ��</td>
                    <td>

                        <span id="T_cussourse"></span>
                    </td>
                </tr>


                <tr>
                    <td class="table_label">�ͻ�������</td>
                    <td>
                        <span id="T_descript"></span>
                    </td>
                    <td class="table_label">��&nbsp; ע��</td>
                    <td></td>
                </tr>

                <tr>
                    <td class="table_label">״̬��</td>
                    <td>
                        <span id="T_status"></span>
                    </td>
                    <td class="table_label">ҵ��Ա��</td>
                    <td>
                        <span id="T_emp"></span>
                    </td>
                </tr>

            </table>

        </div>
        <div id="layout1" style="margin-top: 5px; background: #fff;">

            <div position="center" id="maintab">
                <div tabid="cus_log" title="������־" style="">
                    <div style="padding: 10px 1px 1px 1px;">
                        <div id="maingrid_log" style="margin: -1px;"></div>
                    </div>
                </div>

                <div tabid="customer_contact" title="��ϵ��">
                    <div style="padding: 10px 1px 1px 1px;">
                        <div id="toolbar_customer_contact"></div>
                        <div id="maingrid_contact" style="margin: -1px;"></div>

                    </div>
                </div>
                <div tabid="contact_follow" title="������Ϣ">
                    <div style="padding: 10px 1px 1px 1px;">
                        <div id="toolbar_contact_follow"></div>
                        <div id="maingrid_follow" style="margin: -1px;"></div>
                    </div>
                </div>
                <div tabid="sale_order" title="��������" style="">
                    <div style="padding: 10px 1px 1px 1px;">
                        <div id="toolbar_sale_order"></div>
                        <div id="maingrid_order" style="margin: -1px;"></div>
                    </div>
                </div>

                <div tabid="finance_receivable" title="Ӧ�չ���" style="">
                    <div style="padding: 10px 1px 1px 1px;">
                        <div id="toolbar_finance_receivable"></div>
                        <div id="maingrid_receivable" style="margin: -1px;"></div>
                    </div>
                </div>


                <div tabid="sale_contract" title="��ͬ����" style="">
                    <div style="padding: 10px 1px 1px 1px;">
                        <div id="toolbar_sale_contract"></div>
                        <div id="maingrid_contract" style="margin: -1px;"></div>
                    </div>
                </div>
            </div>


        </div>
    </div>
</body>
</html>
