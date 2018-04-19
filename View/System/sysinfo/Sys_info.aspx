<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>

    <link href="../../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" />
    <link href="../../lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />
    <link href="../../CSS/input.css" rel="stylesheet" type="text/css" />

    <script src="../../lib/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
    <script src="../../JS/XHD.js" type="text/javascript"></script>
    <script src="../../../lib/jquery.form.js" type="text/javascript"></script>
    <script src="../../JS/ajaxUpload.js" type="text/javascript"></script>

    <script type="text/javascript">
        var btn_upname;
        var sys_id = "", sys_name = "", sys_version = "";
        $(function () {           
            loadform();

            btn_upname = $("#btn_upname").ligerButton({ text: "修改", width: 60, click: f_upname });
            $("#btn_version").ligerButton({ text: "检查新版本", width: 60, click: checkup });
        });

        function f_upname()
        {
            $.ligerDialog.prompt('提示内容', $("#T_name").text(), function (yes, value) {
                if (yes) {
                    $.ajax({
                        url: "Sys_info.up.xhd",
                        type: "POST",
                        data: { name: value, rnd: Math.random() },
                        dataType: "json",
                        success: function (result) {
                            $.ligerDialog.closeWaitting();

                            var obj = eval(result);

                            if (obj.isSuccess) {
                                $.ligerDialog.success('更新成功！');
                                $("#T_name").text(value);
                                top.getsysinfo();
                            }
                            else {
                                $.ligerDialog.error(obj.Message);
                            }
                        },
                        error: function () {
                            $.ligerDialog.error('更新失败！');
                        }
                    });
                }
            });
        }
       
        function loadform() {
            $.ajax({
                type: "GET",
                url: "Sys_info.grid.xhd", /* 注意后面的名字对应CS的方法名称 */
                data: { rnd: Math.random() }, /* 注意参数的格式和名称 */
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    var obj = eval(result);
                    var rows = obj.Rows;
                    var sysinfo = {};
                    for (var i = 0; i < rows.length; i++) {
                        if (rows[i].sys_value == "null" || rows[i].sys_value == null) {
                            rows[i].sys_value = " ";
                        }
                        sysinfo[rows[i].sys_key] = rows[i].sys_value;
                    }
                    //alert(obj.constructor); //String 构造函数

                    sys_id = sysinfo["sys_guid"];
                    sys_name = sysinfo["sys_name"];
                    sys_version = sysinfo["sys_version"];
                    
                    $("#T_name").text(sysinfo["sys_name"]);
                    $("#T_sign").text(sysinfo["sms_sign"]);
                    $("#T_ver").text(sysinfo["sys_version"]);
                    $("#T_mver").text(sysinfo["mob_version"]);
                    $("#T_sms").text(sysinfo["sms_done"]==1?"是":"否");

                    $("#T_logo").attr("src", "../../" + sysinfo["sys_logo"]);
                }
            });
        }

        function checkpath() {
            var path = $("#upload").val();
            $.ligerDialog.confirm("文件已选择，是否开始上传？", function (yes) {
                if (yes) {
                    $.ligerDialog.waitting('数据上传中,请稍候...');
                    ajaxUpload({
                        id: 'upload',
                        frameName: 'a',
                        url: 'upload.upfiles.xhd?ftype=logo',
                        format: ['jpg', 'png', 'gif', 'bmp'],
                        onsuccess: success,
                        onerror: onerror
                    });
                }
            });
        }
        var imagename = "";
        function success(serverData) {
            $.ligerDialog.closeWaitting();

            var start = serverData.indexOf(">");
            if (start != -1) {
                var end = serverData.indexOf("<", start + 1);
                if (end != -1) {
                    serverData = serverData.substring(start + 1, end);
                }
            }

            imagename = serverData;
            $("#T_logo").attr("src", "../../images/logo/" + serverData);

            top.getsysinfo();
        }
        
        function onerror(txt) {
            $.ligerDialog.closeWaitting();
            $.ligerDialog.error(txt);
        }

        function checkup() {           
            $.ligerDialog.waitting('正在获取服务器版本,请稍候...');
            $.ajax({
                type: "GET",
                url: "xhd_Service.getVersion.xhd", /* 注意后面的名字对应CS的方法名称 */
                data: { T_guid: sys_id, T_name: sys_name, rnd: Math.random() }, /* 注意参数的格式和名称 */
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    var server_version = result.version_name;

                    server_version = server_version.toLowerCase().replace('v', '');
                    sys_version = sys_version.toLowerCase().replace('v', '');

                    var a, b = new Array();
                    a = server_version.split('.');
                    b = sys_version.split('.');

                    var va = a[3] * 1 + a[2] * 10 + a[1] * 100000 + a[0] * 10000000;
                    var vb = b[3] * 1 + b[2] * 10 + b[1] * 100000 + b[0] * 10000000;

                    //alert(va + ":" + vb)
                    $.ligerDialog.closeWaitting();
                    if (vb < va) {
                        $.ligerDialog.question("有 " + result.version_name + " 版本可以更新，请前往<br/>    <a href='http://www.xhdcrm.com/down' target='_blank'>小黄豆CRM官网</a>   下载更新。", "提示");
                    }
                    else {
                        $.ligerDialog.success("已经是最新版本，无需升级！");
                    }
                }
                , error: function () {
                    $.ligerDialog.closeWaitting();
                }
            })
        }
    </script>
    <style type="text/css">
        .bodytable0 td { height:30px;}
       
        .fileInput { position: absolute; left: 0; top: 0px; height: 30px; filter: alpha(opacity=0); opacity: 0; background-color: transparent; cursor: pointer; }
        .btn { width: 200px; height: 30px; margin: 10px; background-color: yellow; text-align: center; line-height: 30px; overflow: hidden; display: block; position: relative; box-shadow: 0 0 5px rgba(0,0,0,0.3); border-radius: 3px; text-shadow: 1px 1px 1px #fff; }
       
    </style>
</head>
<body style="padding: 0px">
    <form runat="server" id="form1">
        <div style="padding: 10px 10px 10px 5px;">
            <table class="bodytable0" style="width: 100%; ">

                <tr>
                    <td class="table_title1" colspan="2" >系统信息</td>
                </tr>

                <tr>
                    <td width="150" class="table_label">公司名称：</td>
                    <td >
                       <span id ="T_name" style="float:left;margin-right:20px;padding-top:3px;"></span>
                       <div id="btn_upname"></div>
                    </td>
                    
                </tr>               
               
                <tr>
                    <td class="table_label">当前版本：</td>
                    <td >
                        <span id ="T_ver" style="float:left;margin-right:20px;padding-top:3px;"></span>
                        <div id="btn_version"></div>
                    </td>
                   
                </tr>
                <tr>
                    <td class="table_label">手机版本：</td>
                    <td >
                        <span id ="T_mver"></span>
                    </td>
                   
                </tr>
                <tr>
                    <td class="table_label">短信配置：</td>
                    <td >
                        <span id ="T_sms"></span>
                    </td>
                   
                </tr>
                <tr>
                    <td class="table_label">logo：</td>
                    <td style="background:#02b9e3;">
                        <img id ="T_logo" style="height:50px;"/>
                         <a href="javascript:void(0)" class="uploada">
                        <input type="file" class="fileInput" id="upload" name="fileInput" onchange="checkpath()" accept=".jpg,.bmp,.png,.gif" /> 浏  览
                    </a>
                    </td>
                   
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
