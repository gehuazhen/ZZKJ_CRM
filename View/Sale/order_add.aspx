<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" />
    <link href="../lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />

    <script src="../lib/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>

    <script src="../lib/jquery-validation/jquery.validate.js" type="text/javascript"></script>
    <script src="../lib/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
    <script src="../lib/jquery-validation/messages_cn.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/common.js" type="text/javascript"></script>

    <script src="../lib/jquery.form.js" type="text/javascript"></script>
    <script src="../JS/XHD.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            $.metadata.setType("attr", "validate");
            XHD.validate($(form1));

            loadForm(getparastr("id"));

        });

        function f_save() {
            var manager = $("#maingrid4").ligerGetGridManager();
            f_check();
            
            if (f_postnum() == 0)
            {
                $.ligerDialog.warn("����Ӳ�Ʒ��");
                return;
            }


            if ($(form1).valid()) {
                var sendtxt = "&id=" + getparastr("id");
                sendtxt += "&PostData=" + JSON.stringify(manager.getChanges());
                sendtxt += "&customer_id=" + getparastr("customer_id");
                return $("form :input").fieldSerialize() + sendtxt;
            }
        }

        function loadForm(oaid) {
            $.ajax({
                type: "get",
                url: "Sale_order.form.xhd", /* ע���������ֶ�ӦCS�ķ������� */
                data: { id: oaid, rnd: Math.random() }, /* ע������ĸ�ʽ������ */
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    var obj = eval(result);
                    for (var n in obj) {
                        if (obj[n] == "null" || obj[n] == null)
                            obj[n] = "";
                    }
                    var rows = [];

                    var customer_id = obj.Customer_id || getparastr("customer_id");
                    if (!customer_id)
                        rows.push([{ display: "�ͻ�", name: "T_customer", validate: "{required:true}", width: 465 }])

                    rows.push(
                            [
                                { display: "�ɽ�ʱ��", name: "T_date", type: "date", options: "{width:180}", validate: "{required:true}", initValue: formatTimebytype(obj.Order_date, "yyyy-MM-dd") },
                                { display: "�������", name: "T_amount", type: "text", options: "{width:180,disabled:true,onChangeValue:function(){ getAmount(); }}", validate: "{required:true}", initValue: toMoney(obj.Order_amount) }
                            ],
                            [
                                { display: "����״̬", name: "T_status", type: "select", options: "{width:180,url:'Sys_Param.combo.xhd?type=order_status',value:'" + obj.Order_status_id + "'}", validate: "{required:true}" },
                                { display: "�Żݽ��", name: "T_discount", type: "text", options: "{width:180,onChangeValue:function(){ getAmount(); }}", validate: "{required:true}", initValue: toMoney(obj.discount_amount) }
                            ],
                            [
                                { display: "֧����ʽ", name: "T_paytype", type: "select", options: "{width:180,url:'Sys_Param.combo.xhd?type=pay_type',value:'" + obj.pay_type_id + "'}", validate: "{required:true}", initValue: formatTimebytype(obj.import_time, "yyyy-MM-dd") },
                                { display: "����ܼ�", name: "T_total", type: "text", options: "{width:180,disabled:true}", validate: "{required:true}", initValue: toMoney( obj.total_amount) }
                            ],
                            [
                                { display: "�ɽ���Ա", name: "T_emp", validate: "{required:true}" }
                            ],
                            [
                                { display: "��ע", name: "T_details", type: "textarea", cols: 73, rows: 4, width: 465, cssClass: "l-textarea", initValue: obj.Order_details }
                            ]
                        );
                   
                    if (!obj.discount_amount)
                        obj.discount_amount = 0;

                    $("#form1").ligerAutoForm({
                        labelWidth: 80, inputWidth: 180, space: 20,
                        fields: [
                            {
                                display: '����', type: 'group', icon: '',
                                rows:rows
                                
                            }
                        ]
                    });
                    f_grid();
                    
                    $("#T_customer").ligerComboBox({
                        width: 465,
                        onBeforeOpen: f_selectCustomer
                    })

                    $("#T_customer").val(obj.Customer_name);
                    $("#T_customer_val").val(obj.customer_id);


                    $("#T_emp").ligerComboBox({
                        width: 180,
                        onBeforeOpen: f_selectEmp
                    })

                    $("#T_emp").val(obj.emp_name);
                    $("#T_emp_val").val(obj.emp_id);
                }
            });
        }
        function f_selectCustomer() {
            $.ligerDialog.open({
                zindex: 9005, title: 'ѡ��ͻ�', width: 650, height: 300, url: '../crm/customer/getCustomer.aspx', buttons: [
                     { text: 'ȷ��', onclick: f_selectCustomerOK },
                     { text: 'ȡ��', onclick: function (item, dialog) { dialog.close();} }
                ]
            });
            return false;
        }

        function f_selectCustomerOK(item, dialog) {
            var data = dialog.frame.f_select();
            if (!data) {
                alert('��ѡ����!');
                return;
            }
            
            $("#T_customer").val(data.cus_name);
            $("#T_customer_val").val(data.id);
            dialog.close();
        }

        function f_selectEmp()
        {
            $.ligerDialog.open({
                zindex: 9005, title: 'ѡ��Ա��', width: 650, height: 300, url: '../hr/getemp_auth.aspx?auth=3', buttons: [
                     { text: 'ȷ��', onclick: f_selectEmpOK },
                     { text: 'ȡ��', onclick: function (item, dialog) { dialog.close(); } }
                ]
            });
            return false;
        }

        function f_selectEmpOK(item, dialog) {
            var data = dialog.frame.f_select();
            if (!data) {
                alert('��ѡ����!');
                return;
            }

            $("#T_emp").val(data.name);
            $("#T_emp_val").val(data.id);
            dialog.close();
        }

        function getAmount()
        {
            var T_amount = $("#T_amount").val();
            var T_discount = $("#T_discount").val();
            var T_total = $("#T_total").val();

            $("#T_discount").val(toMoney(T_discount));
            $("#T_total").val(toMoney(parseFloat(T_amount.replace(/\$|\,/g, '')) - parseFloat(T_discount.replace(/\$|\,/g, ''))));
        }

       

        function f_grid() {
            $("#maingrid4").ligerGrid({
                columns: [

                    {
                        display: '��Ʒ', name: 'product_name', width: 120
                    },
                    {
                        display: '��λ', name: 'unit', width: 40
                    },
                    {
                        display: '���', name: 'specifications', width: 100
                    },
                    {
                        display: '���ۼ�', name: 'agio', width: 80, type: 'float', align: 'right', render: function (item) {
                            return toMoney(item.agio);
                        }
                        , editor: { type: 'float' }
                    },
                    {
                        display: '����', name: 'quantity', width: 60, type: 'int',
                        editor: { type: 'int', isNegative: false }
                    },
                    {
                        display: '�ܼ�', name: 'amount', width: 100, type: 'float', align: 'right', render: function (item) {
                            return toMoney(item.amount);
                        }
                    }
                ],
                allowHideColumn:false,
                onAfterEdit: f_onAfterEdit,
                title: '��Ʒ��ϸ',
                usePager: false,
                enabledEdit: true,
                url: "Sale_order_details.grid.xhd?orderid=" + getparastr("id"),
                width: '100%',
                height: 170,
                heightDiff: -1,
                onLoaded: f_loaded
            });

        }

        function f_loaded() {
            if ($("#btn_add").length > 0)
                return;

            $(".l-panel-header").append("<div style='width:150px;float:right'><div id = 'btn_add' style='margin-top:2px;'></div><div id = 'btn_del' style='margin-top:2px;'></div></div>");
            $(".l-grid-loading").fadeOut();
            $("#btn_add").ligerButton({
                width: 60,
                text: "���",
                icon: '../../images/icon/11.png',
                click: add
            })

            $("#btn_del").ligerButton({
                width: 60,
                text: "ɾ��",
                icon: '../../images/icon/12.png',
                click: pro_remove
            })
            $("#maingrid4").ligerGetGridManager()._onResize();
        }        

        function f_onAfterEdit(e) {
            var manager = $("#maingrid4").ligerGetGridManager();
            //alert(JSON.stringify(e)); return;
            manager.updateCell('amount', e.record.agio * e.record.quantity, e.record);
            $("#T_amount").val(toMoney(manager.getColumnDateByType('amount', 'sum') * 1.0));
            getAmount();
        }        

        function add() {
            f_openWindow("product/GetProduct.aspx", "ѡ���Ʒ", 800, 400, f_getpost, 9003);
        }
        function pro_remove() {
            var manager = $("#maingrid4").ligerGetGridManager();
            manager.deleteSelectedRow();
            setTimeout(function () {
                $("#T_amount").val(toMoney(manager.getColumnDateByType('amount', 'sum') * 1.0));
                getAmount();
            }, 50)
           
        }
        function f_getpost(item, dialog) {
            var rows = null;
            if (!dialog.frame.f_select()) {
                alert('��ѡ���Ʒ!');
                return;
            }
            else {
                rows = dialog.frame.f_select();

                //�����ظ�
                var manager = $("#maingrid4").ligerGetGridManager();
                var data = manager.getData();

                for (var i = 0; i < rows.length; i++) {
                    rows[i].product_id = rows[i].id;
                    var add = 1;
                    for (var j = 0; j < data.length; j++) {
                        if (rows[i].product_id == data[j].product_id) {
                            add = 0;
                        }
                    }
                    if (add == 1) {
                        //price
                        rows[i].quantity = 1;
                        rows[i]["amount"] = rows[i].agio * rows[i].quantity;
                        manager.addRow(rows[i]);
                    }
                }
                dialog.close();
            }
            $("#T_amount").val(toMoney(manager.getColumnDateByType('amount', 'sum') * 1.0));
            getAmount();
        }

        function f_postnum() {
            var manager = $("#maingrid4").ligerGetGridManager();
            return manager.getColumnDateByType('amount', 'count') * 1.0;            
        }
        
        function f_check() {
            var g = $("#maingrid4").ligerGetGridManager().endEdit(true);
        }
        function remote() {
            var url = "PB_BicycleType.Exist.xhd?id=" + getparastr("id") + "&rnd=" + Math.random();
            return url;
        }

    </script>

</head>
<body style="overflow: hidden;">
    <form id="form1" onsubmit="return false">
    </form>
    <div style="padding: 5px 4px 5px 2px;">

        <div id="maingrid4">
        </div>
    </div>
</body>
</html>
