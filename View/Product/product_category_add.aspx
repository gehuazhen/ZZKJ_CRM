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
        //ͼ��
        var jiconlist, winicons, currentComboBox;
        $(function () {
            $.metadata.setType("attr", "validate");
            XHD.validate($(form1));

            //$("#T_Contract_name").focus();
            $("form").ligerForm();
            $("#menuicon").bind("click", f_selectIcon);
            $("#T_category_icon").bind("click", f_selectIcon);

            loadForm(getparastr("cid"));

            jiconlist = $("body > .iconlist:first");
            if (!jiconlist.length) jiconlist = $('<ul class="iconlist"></ul>').appendTo('body');
        });

        function f_save() {
            if ($(form1).valid()) {
                var sendtxt = "&id=" + getparastr("cid");
                return $("form :input").fieldSerialize() + sendtxt;
            }
        }

        function loadForm(oaid) {
            $.ajax({
                type: "GET",
                url: "Product_category.form.xhd", /* ע���������ֶ�ӦCS�ķ������� */
                data: { id: oaid, rnd: Math.random() }, /* ע������ĸ�ʽ������ */
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    var obj = eval(result);
                    for (var n in obj) {

                    }
                    //alert(obj.constructor); //String ���캯��
                    $("#T_category_name").val(obj.product_category);
                    $("#T_category_icon").val(obj.product_icon);
                    if (!obj.product_icon)
                        obj.product_icon = 'images/icon/21.png ';
                    $("#menuicon").attr("src", "../" + obj.product_icon);
                    $("#T_category_parent").ligerComboBox({
                        width: 180,
                        selectBoxWidth: 180,
                        selectBoxHeight: 180,
                        valueField: 'id',
                        textField: 'text',
                        value: obj.parentid,
                        treeLeafOnly: false,
                        tree: {
                            onSuccess: function () {
                                setTimeout(function () {
                                    var manager = $(".l-tree").ligerGetTreeManager();
                                    manager.remove($("#" + oaid));
                                }, 100);
                            },
                            url: 'Product_category.combo.xhd?rnd=' + Math.random(),
                            idFieldName: 'id',
                            //parentIDFieldName: 'pid',
                            checkbox: false
                        }
                    })


                }
            });
        }

        function f_selectIcon() {            
            winicons = $.ligerDialog.open({
                title: 'ѡȡͼ��',
                target: jiconlist,
                width: 400, height: 220, modal: true
            });

            $.ajax({
                url: "Sys_base.GetIcons.xhd", type: "get",
                data: { icontype: "1", rnd: Math.random() },
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var obj = eval(data);
                    //alert(obj.length);
                    for (var i = 0, l = obj.length; i < l; i++) {
                        var src = obj[i];
                        var reg = /(images\\icon)(.+)/;
                        var match = reg.exec(src);
                        // alert(match);
                        jiconlist.append("<li><img src='../images/icon/" + src.filename + "' /></li>");
                        if (!match) continue;
                    }


                    $(".iconlist li").live('mouseover', function () {
                        $(this).addClass("over");
                    }).live('mouseout', function () {
                        $(this).removeClass("over");
                    }).live('click', function () {
                        if (!winicons) return;
                        var src = $("img", this).attr("src");
                        var name = src.substr(src.lastIndexOf("/")).toLowerCase();
                        $("#menuicon").attr("src", "../images/icon" + name);
                        $("#T_category_icon").val("images/icon" + name);

                        winicons.close();
                    });
                }
            });

        }


    </script>
    <style type="text/css">
        .iconlist { width: 360px; padding: 3px; }
            .iconlist li { border: 1px solid #FFFFFF; float: left; display: block; padding: 2px; cursor: pointer; }
                .iconlist li.over { border: 1px solid #516B9F; }
                .iconlist li img { height: 16px; height: 16px; }
    </style>

</head>
<body style="padding: 0px">
    <form id="form1" onsubmit="return false">
        <table border="0" cellpadding="3" cellspacing="1" style="background: #fff; width: 400px;" class="aztable">

            <tr>
                <td height="23" style="width: 85px" colspan="2">

                    <div align="left" style="width: 62px">������ƣ�</div>
                </td>
                <td height="23">

                    <input type="text" id="T_category_name" name="T_category_name" ltype="text" ligerui="{width:180}" validate="{required:true}" />

                </td>
            </tr>
            <tr>
                <td height="23" colspan="2">

                    <div align="left" style="width: 62px">�ϼ����</div>
                </td>
                <td height="23">
                    <input type="text" id="T_category_parent" name="T_category_parent" validate="{required:true}" />
                </td>
            </tr>
            <tr>
                <td height="23" style="width: 62px">

                    <div align="left" style="width: 62px">���ͼ�꣺</div>
                </td>
                <td height="23" style="width: 27px">
                    <img id="menuicon" style="width: 16px; height: 16px;" /></td>
                <td height="23">
                    <input type="text" id="T_category_icon" name="T_category_icon" ltype="text" ligerui="{width:180}" validate="{required:true}" />
                </td>
            </tr>

        </table>
    </form>
</body>
</html>
