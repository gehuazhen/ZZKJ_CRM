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

    <script src="../lib/jquery-validation/jquery.validate.js" type="text/javascript"></script>
    <script src="../lib/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
    <script src="../lib/jquery-validation/messages_cn.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/common.js" type="text/javascript"></script>
    <script src="../JS/XHD.js" type="text/javascript"></script>
    <script src="../lib/jquery.form.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            $.metadata.setType("attr", "validate");
            XHD.validate($(form1));

            //$("#T_Contract_name").focus();

            loadForm(getparastr("pid"));
        });

        function f_save() {
            if ($(form1).valid()) {
                var sendtxt = "&pid=" + getparastr("pid");
                return $("form :input").fieldSerialize() + sendtxt;
            }
        }

        function loadForm(oaid) {
            $.ajax({
                type: "get",
                url: "Product.form.xhd", /* ע���������ֶ�ӦCS�ķ������� */
                data: { Action: 'form', id: oaid, rnd: Math.random() }, /* ע������ĸ�ʽ������ */
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    var obj = eval(result);
                    for (var n in obj) {
                        if (obj[n] == "null" || obj[n] == null)
                            obj[n] = "";
                    }
                    //alert(obj.constructor); //String ���캯��

                    //$("#T_product_category").ligerGetComboBoxManager().selectValue(obj.category_id);

                    if (!obj.category_id)
                        obj.category_id = getparastr("categoryid");

                    $("#form1").ligerAutoForm({
                        labelWidth: 80, inputWidth: 180, space: 20,
                        fields: [
                            {
                                display: '��Ʒ', type: 'group', icon: '',
                                rows: [
                                    [
                                        { display: "��Ʒ����", name: "T_product_name", type: "text", options: "{width:180}", validate: "{required:true}", initValue: obj.product_name },
                                        { display: "��Ʒ���", name: "T_product_category", type: "select", options: "{width:180,treeLeafOnly: false,tree:{url:'Product_category.tree.xhd',idFieldName: 'id',checkbox: false},value:'" + obj.category_id + "'}", validate: "{required:true}" }
                                    ],
                                    [
                                        { display: "�ɱ���", name: "T_cost", type: "text", options: "{width:180,onChangeValue:function(value){ $('#T_cost').val(toMoney(value)); }}", validate: "{required:true}", initValue: toMoney( obj.cost) },
                                        { display: "��Ʒ��λ", name: "T_product_unit", type: "text", options: "{width:180}", validate: "{required:true}", initValue: obj.unit }

                                    ],
                                    [
                                        { display: "���ۼ�", name: "T_price", type: "text", options: "{width:180,onChangeValue:function(value){ $('#T_price').val(toMoney(value)); }}", validate: "{required:true}", initValue:toMoney( obj.price )},
                                        { display: "��Ʒ���", name: "T_specifications", type: "text", options: "{width:180}", initValue: obj.specifications }
                                    ],
                                    [
                                        { display: "�ۿۼ�", name: "T_agio", type: "text", options: "{width:180,onChangeValue:function(value){ $('#T_agio').val(toMoney(value)); }}", validate: "{required:true}", initValue: toMoney( obj.agio )}
                                    ],
                                    [
                                        { display: "��ע", name: "T_Remark", type: "textarea", cols: 73, rows: 4, width: 465, cssClass: "l-textarea", initValue: obj.Remark }
                                    ]
                                ]
                            }
                        ]
                    });
                }
            });
        }

        function set_tomoney(value) {
            $("#T_price").val(toMoney(value));
        }



    </script>
</head>
<body>
     <div style="padding: 10px;">
    <form id="form1" onsubmit="return false">
   
    </form>
         </div>
</body>
</html>
