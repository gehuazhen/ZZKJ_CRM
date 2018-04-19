<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" />
    <link href="../../lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />

    <script src="../../lib/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>

    <script src="../../lib/jquery-validation/jquery.validate.js" type="text/javascript"></script>
    <script src="../../lib/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
    <script src="../../lib/jquery-validation/messages_cn.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/common.js" type="text/javascript"></script>
    <script src="../../JS/XHD.js" type="text/javascript"></script>
    <script src="../../lib/jquery.form.js" type="text/javascript"></script>

    <script type="text/javascript">
        var xNode = null, xtype = 'select';
        UE = parent.UE, xform = parent.xform;
        $(function () {
            $.metadata.setType("attr", "validate");
            XHD.validate($(form1));

            $("#maingrid4").ligerGrid({
                columns: [
                        { display: '���', width: 50, render: function (item,i) { return item.n; } },
                    { display: '��ϵ��', name: 'C_name', width: 100 },
                    { display: 'ְ��', name: 'C_position', width: 100 },
                    { display: '�Ա�', name: 'C_sex', width: 50 },
                    { display: '�����ͻ�', name: 'customer', width: 180 },
                    { display: '�ֻ�', name: 'C_mob', width: 120 }

                ],
                //usePager: false,
                dataAction: 'server',
                pageSize: 30,
                pageSizeOptions: [20, 30, 50, 100],
                checkbox: true,
                url: "CRM_Contact.grid.xhd?smstype=1&smsid=" + getparastr("id"),
                width: '100%', height: 160,
                heightDiff: -1
            })
            loadForm(getparastr("id"));
            toolbar();
        });

        function f_save() {
            if ($(form1).valid()) {
                var manager = $("#maingrid4").ligerGetGridManager();
                var data = manager.getData();

                var ids = "", mobiles = "";
                for (var i = 0; i < data.length; i++) {
                    ids += data[i].id + ",";
                    mobiles += data[i].C_mob + ",";
                }
                return $("form :input").fieldSerialize() + "&ids=" + ids + "&mobiles=" + mobiles;
            }
            else {
                $.ligerDialog.warn("�����ֶ�δͨ����֤��", "���棡");
            }
        }        

        function f_num()
        {
            var manager = $("#maingrid4").ligerGetGridManager();
            var data = manager.getData();
            var len=data.length;
            if (len < 1)
            {
                $.ligerDialog.warn("��ѡ����ϵ��", "���棡");
            }
            return len;
        }

        function loadForm(oaid) {
            $.ajax({
                type: "GET",
                url: "SMS.form.xhd", /* ע���������ֶ�ӦCS�ķ������� */
                data: { id: oaid, rnd: Math.random() }, /* ע������ĸ�ʽ������ */
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    var obj = eval(result);
                    for (var n in obj) {
                        if (obj[n] == "null" || obj[n] == null)
                            obj[n] = "";
                    }
                    $("#form1").ligerAutoForm({
                        labelWidth: 80, inputWidth: 480, space: 20,
                        fields: [
                            {
                                display: '���Ͷ���', type: 'group', icon: '',
                                rows: [
                                    [{ display: "��������", name: "T_title", type: "text", options: "{width:480}", validate: "{required:true}" ,initValue:obj.sms_title}],
                                    [{ display: "��������", name: "T_content", type: "textarea", cols: 76, rows: 7, cssClass: 'l-textarea', validate: "{required:true}",initValue:obj.sms_content }]
                                ]
                            }
                        ]
                    });

                }
            });
            
        }

        function toolbar() {
            var items = [];

            items.push({ type: 'button', text: '����', icon: '../../images/icon/11.png', disable: true, click: function () { add() } });
            items.push({ type: 'button', text: 'ɾ��', icon: '../../images/icon/12.png', disable: true, click: function () { deleteRow() } });
            items.push({ type: 'text', text: ' ע���ռ������δ����ӣ������ֻ������Ƿ���ȷ' });

            $("#toolbar").ligerToolBar({
                items: items
            });
        }
        function add() {
            f_openWindow("crm/customer/getcontactmult.aspx", "ѡ����ϵ��", 580, 400, f_getcontact, 9003);
        }
        function deleteRow() {
            var manager = $("#maingrid4").ligerGetGridManager();
            manager.deleteSelectedRow();
        }
        function f_getcontact(item, dialog) {
            var rows = dialog.frame.f_select();
            if (!rows || rows == "") {
                alert('��ѡ����ϵ��!');
                return;
            }

            dialog.close();

            var manager = $("#maingrid4").ligerGetGridManager();
            var data = manager.getData();

            if (data.length + rows.length >= 200) {
                $.ligerDialog.error("������200������");
                return;
            }

            for (var i = 0; i < rows.length; i++) {
                var add = 1;

                //�ֻ���֤
                var telNum = rows[i].C_mob;

                var length = telNum.length;
                var isTel = (length == 11 && /^(1\d{10})$/.test(telNum))

                if (!isTel) add = 0;

                //�����ظ�
                if (add) {
                    for (var j = 0; j < data.length; j++) {
                        if (rows[i].id == data[j].id) {
                            add = 0;
                        }
                    }
                }

                if (add == 1) {
                    manager.addRow(rows[i]);
                }
            }
        }



    </script>
</head>
<body style="overflow:hidden;">
    <form id="form1" onsubmit="return false">
    </form>
    <form id="form2" onsubmit="return false">
        <div style="margin: 2px;margin-top:5px; ">
            <div id="toolbar"></div>
            <div id="maingrid4" style="margin: -1px;"></div>

        </div>
    </form>
</body>
</html>
