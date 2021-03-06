﻿<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="ie=edge chrome=1" />
    <link href="../../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" />
    <link href="../../lib/ligerUI/skins/Gray2014/css/all.css" rel="stylesheet" />
    <link href="../../CSS/input.css" rel="stylesheet" />

    <script src="../../lib/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="../../lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>

    <script src="../../lib/jquery.form.js" type="text/javascript"></script>
    <script src="../../lib/json.js" type="text/javascript"></script>
    <script src="../../JS/XHD.js" type="text/javascript"></script>

    <script src="../../JS/echarts-all.js" type="text/javascript"></script>
    <script type="text/javascript">

        var manager;
        var manager1;
        $(function () {

            initLayout();
            $(window).resize(function () {
                initLayout();
            });


            $("#maingrid5").ligerGrid({
                columns: [
                    
                    {
                        display: '来源', name: 'yy', width: 120, render: function (item) {
                            if (!item.yy)
                                item.yy = "【系统】未分类";
                            return item.yy;
                        }
                    },
                    {
                        display: '时间一', name: 'dt1', width: 120, render: function (item) {
                            if (typeof (item.dt1) == "number" && item.dt1 != "0")
                                return item.dt1;
                            else
                                return "0";
                        }
                    },
                    {
                        display: '时间二', name: 'dt2', width: 120, render: function (item) {
                            if (typeof (item.dt2) == "number" && item.dt2 != "0")
                                return item.dt2;
                            else
                                return "0";
                        }
                    },
                    {
                        display: '增幅', name: 'm3', width: 120, render: function (item) {
                            var dt1, dt2;
                            if (typeof (item.dt1) == "number" && item.dt1 != "0")
                                dt1 = item.dt1;
                            else
                                dt1 = 0;
                            if (typeof (item.dt2) == "number" && item.dt2 != "0")
                                dt2 = item.dt2;
                            else
                                dt2 = 0;
                            if (dt1 > dt2)
                                return "↓ " + (dt2 - dt1);
                            else
                                return "↑ " + (dt2 - dt1);
                        }
                    },
                    {
                        display: '比例', name: 'm4', width: 120, render: function (item) {
                            var dt1, dt2;
                            if (typeof (item.dt1) == "number" && item.dt1 != "0")
                                dt1 = item.dt1;
                            else
                                dt1 = 0;
                            if (typeof (item.dt2) == "number" && item.dt2 != "0")
                                dt2 = item.dt2;
                            else
                                dt2 = 0;
                            if (dt1 == 0)
                                return "--";
                            if (dt1 > dt2)
                                return "↓ " + Math.round((dt2 - dt1) * 100 / dt1) + " %";
                            else
                                return "↑ " + Math.round((dt2 - dt1) * 100 / dt1) + " %";
                        }
                    }
                ],
                url: '',
                usePager: false,
                //dataAction: 'local', pageSize: 30, pageSizeOptions: [20, 30, 50, 100],
                width: '100%', height: '100%',
                //title: "年度统计表",
                heightDiff: -20
            });
            var items = [];
            items.push({ type: 'textbox', id: 'year1', text: '时间1：' });
            items.push({ type: 'textbox', id: 'month1', text: '年' });
            items.push({ type: 'text', text: '月' });
            items.push({ type: 'text', text: '  -  ' });
            items.push({ type: 'textbox', id: 'year2', text: '时间2：' });
            items.push({ type: 'textbox', id: 'month2', text: '年' });
            items.push({ type: 'text', text: '月' });
            items.push({ type: 'line' });

            items.push({ type: 'button', text: '统计', icon: '../../images/search.gif', disable: true, click: function () { doserch() } });
            items.push({ type: 'button', text: '重置', icon: '../../images/edit.gif', disable: true, click: function () { $("#serchform").each(function () { this.reset(); $(".l-selected").removeClass("l-selected"); }); } });

            $("#toolbar").ligerToolBar({
                items: items
            });


            $("#grid").height(document.documentElement.clientHeight - $(".toolbar").height() - 350);
            $("#maingrid5").ligerGetGridManager()._onResize();

            var d = new Date();
            var nowYear = +d.getFullYear();
            var nowMonth = d.getMonth()+1;
            var syearData = [], smonthDate = [];
            for (var i = nowYear; i >= nowYear - 20; i--) {
                syearData.push({ 'text': i, 'id': i });
            }
            for (var i = 1; i <= 12; i++) {
                smonthDate.push({ 'text': i, 'id': i });
            }
            $("#year1").ligerComboBox({ width: 60, data: syearData, value: nowYear - 1 });
            $("#year2").ligerComboBox({ width: 60, data: syearData, value: nowYear });
            $("#month1").ligerComboBox({ width: 60, data: smonthDate, value: nowMonth });
            $("#month2").ligerComboBox({ width: 60, data: smonthDate, value: nowMonth });

            doserch();
        });

        function initSelect() {
            var d = new Date();
            var nowYear = +d.getFullYear();
            var syearData = [];
            for (var i = nowYear; i >= nowYear - 20; i--) {
                syearData.push({ 'text': i, 'id': i });
            }
            $("#syear").ligerComboBox({
                width: 100,
                data: syearData,
                initValue: nowYear
            })
        }

        function test(GridData) {
            var series = [];
            var legend = [];

            var dc1 = 0, dc2 = 0;
            for (var i = 0; i < GridData.Rows.length; i++) {
                var yy = GridData.Rows[i].yy;
                if (!yy)
                    yy = "未分类";

                var dt1 = typeof (GridData.Rows[i].dt1) != 'number' ? 0 : GridData.Rows[i].dt1;
                var dt2 = typeof (GridData.Rows[i].dt2) != 'number' ? 0 : GridData.Rows[i].dt2;

                series.push({ "name": yy, "type": "bar", "data": [dt1, dt2] });
                dc1 += dt1; dc2 += dt2;
                legend.push(yy);
            }

            series.push({ "name": '总计', "type": "line", "data": [dc1, dc2] });
            legend.push("总计");
            var myChart = echarts.init(document.getElementById('graph'));

            var option = {
                tooltip: {
                    show: true
                },
                legend: {
                    data: legend
                },
                xAxis: [
                    {
                        type: 'category',
                        data: [
                            $("#year1").val() + "年" + $("#month1").val() + "月",
                            $("#year2").val() + "年" + $("#month2").val() + "月"
                        ]
                    }
                ],
                yAxis: [
                    {
                        type: 'value'
                    }
                ],
                series: series,

                grid: {
                    x: 40,
                    y: 20,
                    x2: 10
                }
            };

            // 为echarts对象加载数据 
            myChart.setOption(option);
            $("#graph").css({ "filter": "alpha(opacity=100)", "background": "#fff" });
        }
        function doserch() {
            var sendtxt = "&Action=Compared_source&rnd=" + Math.random();
            var serchtxt = $("#serchform :input").fieldSerialize() + sendtxt;
            //alert(serchtxt);
            var manager = $("#maingrid5").ligerGetGridManager();

            $.ligerDialog.waitting('数据查询中,请稍候...');
            $.ajax({
                url: "CRM_Customer.Compared_source.xhd", type: "POST",
                data: serchtxt,
                dataType: 'json',
                beforeSend: function () {
                    
                },
                success: function (responseText) {
                    manager._setUrl("CRM_Customer.Compared_source.xhd?" + serchtxt);
                    
                    $.ligerDialog.closeWaitting();
                    test(responseText);
                },
                error: function () {
                    $.ligerDialog.closeWaitting();
                    $.ligerDialog.error('查询失败！请检查查询项。');
                }
            });
            //test();
            manager.changeHeaderText('dt1', $("#year1").val() + "年" + $("#month1").val() + "月");
            manager.changeHeaderText('dt2', $("#year2").val() + "年" + $("#month2").val() + "月");
        }
        function f_reload() {
            var manager = $("#maingrid5").ligerGetGridManager();
            manager.loadData(true);
        };
    </script>
</head>
<body>
    <div style="padding: 10px">
        <div style="position: relative; z-index: 9999">
            <form id="serchform">
                <div id="toolbar"></div>
            </form>
        </div>

        <form id="form1" onsubmit="return false">
            <div id="griddiv">
                 <div id="graph" style="height: 280px;margin:1px; box-shadow: 0 2px 10px rgba(0,0,0,0.3);"></div>

                <div id="maingrid5" style="margin-top: 10px;box-shadow: 0 2px 10px rgba(0,0,0,0.3);"></div>
            </div>
        </form>
    </div>

</body>
</html>

