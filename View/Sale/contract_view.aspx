<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" />
    <link href="../lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />
    <link href="../CSS/webuploader.css" rel="stylesheet" />

    <script src="../lib/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>

    <script src="../lib/jquery-validation/jquery.validate.js" type="text/javascript"></script>
    <script src="../lib/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
    <script src="../lib/jquery-validation/messages_cn.js" type="text/javascript"></script>
    <script src="../lib/ligerUI/js/common.js" type="text/javascript"></script>

    <script src="../lib/jquery.form.js" type="text/javascript"></script>
    <script src="../JS/XHD.js" type="text/javascript"></script>
    <script src="../JS/webuploader/webuploader.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        var contract_id = null;
        var dialog = frameElement.dialog;

        $(function () {
            $.metadata.setType("attr", "validate");
            XHD.validate($(form1));

            loadForm(getparastr("id"));
        });


        function loadForm(oaid) {
            $.ajax({
                type: "get",
                url: "CRM_contract.form.xhd", /* ע���������ֶ�ӦCS�ķ������� */
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

                    rows.push(
                        [{ display: "��ͬ����", name: "T_name", type: "text", options: "{width:465}", width: 465, initValue: obj.Contract_name }],
                        [
                            { display: "��ͬ���", name: "T_no", type: "text", options: "{width:180}", initValue: obj.Serialnumber },
                            { display: "��ͬ���", name: "T_amount", type: "text", options: "{width:180}", initValue: toMoney(obj.Contract_amount) }
                        ],
                        [
                            { display: "��������", name: "T_Pay_cycle", type: "text", options: "{width:180}", initValue: obj.Pay_cycle },
                            { display: "��ʼʱ��", name: "T_Start_date", type: "text", options: "{width:180}", initValue: formatTimebytype(obj.Start_date, "yyyy-MM-dd") }
                        ],
                        [
                            { display: "�Է�ǩԼ", name: "T_Customer_Contractor", type: "text", options: "{width:180}", initValue: obj.Customer_Contractor },
                            { display: "����ʱ��", name: "T_End_date", type: "text", options: "{width:180}", initValue: formatTimebytype(obj.End_date, "yyyy-MM-dd") }
                        ],
                        [
                            { display: "�ҷ�ǩԼ", name: "T_Our_Contractor", type: "text", options: "{width:180}", initValue: obj.Our_Contractor },
                            { display: "ǩ��ʱ��", name: "T_Sign_date", type: "text", options: "{width:180}", initValue: formatTimebytype(obj.Sign_date, "yyyy-MM-dd") }
                        ],
                        [
                            { display: "��Ҫ����", name: "T_Main_Content", type: "textarea", cols: 77, rows: 4, width: 475, cssClass: "l-textarea", initValue: obj.Main_Content }
                        ],
                        [
                            { display: "��ע", name: "T_Remarks", type: "textarea", cols: 77, rows: 2, width: 475, cssClass: "l-textarea", initValue: obj.Remarks }
                        ]
                    );


                    $("#form1").ligerAutoForm({
                        labelWidth: 80, inputWidth: 180, space: 20,
                        fields: [
                            {
                                display: '��ͬ', type: 'group', icon: '',
                                rows: rows

                            }
                        ]
                    });
                    f_grid();
                }
            });
        }


        function f_grid() {
            $("#maingrid4").ligerGrid({
                columns: [
                    { display: '�ļ���', name: 'file_name', width: 300, align: 'left' },
                    {
                        display: '�ļ���С', name: 'file_size', width: 80, align: 'right', render: function (item, i) {
                            return formatUnits(item.file_size);
                        }
                    },
                    {
                        display: '����', width: 120, render: function (item, i) {
                            var div = ' <a href="javascript:void(0)" onclick="down_atta(\'' + item.real_name + '\')">����</a>    ';
                            return div;
                        }
                    }

                ],
                allowHideColumn: false,
                rowid: 'id',
                title: '����',
                usePager: false,
                enabledEdit: true,
                url: "CRM_contract_atta.grid.xhd?contract_id=" + getparastr("id"),
                width: '100%',
                height: 'auto',
                heightDiff: -1
            });

        }

        function down_atta(filename) {
            var url = "../../file/contract/" + getparastr("id") + "/" + filename;

            var a = filename.IsPicture()
            if (a) {
                window.open(url);
            }
            else
                $("#toexcel").attr("Action", url).submit();
        }

    </script>

</head>
<body style="overflow-y: scroll;">
    <form id="form1" onsubmit="return false">
    </form>
    <div style="padding: 5px 4px 5px 2px;">
        <div id="thelist" class="uploader-list"></div>
        <div id="maingrid4">
        </div>
    </div>
    <form id='toexcel'></form>
</body>
</html>
