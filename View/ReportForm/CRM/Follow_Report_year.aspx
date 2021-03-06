<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
                    //
                    {
                        display: '项目', name: 'items', width: 120, render: function (item) {
                            if (item.items == "")
                                item.items = "未分类";
                            return item.items;
                        },
                        totalSummary: { type: 'total' }
                    },
                    {
                        display: '一月', name: 'm1', width: 50, render: function (item) {
                            if (typeof (item.m1) == "undefined" || (typeof (item.m1) == "number" && item.m1 == "0"))
                                return "0";
                            else
                                return item.m1;
                        },
                        totalSummary: { type: 'tsum' }
                    },
                    {
                        display: '二月', name: 'm2', width: 50, render: function (item) {
                            if (typeof (item.m2) == "undefined" || (typeof (item.m2) == "number" && item.m2 == "0"))
                                return "0";
                            else
                                return item.m2;
                        },
                        totalSummary: { type: 'tsum' }
                    },
                    {
                        display: '三月', name: 'm3', width: 50, render: function (item) {
                            if (typeof (item.m3) == "undefined" || (typeof (item.m3) == "number" && item.m3 == "0"))
                                return "0";
                            else
                                return item.m3;
                        },
                        totalSummary: { type: 'tsum' }
                    },
                    {
                        display: '四月', name: 'm4', width: 50, render: function (item) {
                            if (typeof (item.m4) == "undefined" || (typeof (item.m4) == "number" && item.m4 == "0"))
                                return "0";
                            else
                                return item.m4;
                        },
                        totalSummary: { type: 'tsum' }
                    },
                    {
                        display: '五月', name: 'm5', width: 50, render: function (item) {
                            if (typeof (item.m5) == "undefined" || (typeof (item.m5) == "number" && item.m5 == "0"))
                                return "0";
                            else
                                return item.m5;
                        },
                        totalSummary: { type: 'tsum' }
                    },
                    {
                        display: '六月', name: 'm6', width: 50, render: function (item) {
                            if (typeof (item.m6) == "undefined" || (typeof (item.m6) == "number" && item.m6 == "0"))
                                return "0";
                            else
                                return item.m6;
                        },
                        totalSummary: { type: 'tsum' }
                    },
                    {
                        display: '七月', name: 'm7', width: 50, render: function (item) {
                            if (typeof (item.m7) == "undefined" || (typeof (item.m7) == "number" && item.m7 == "0"))
                                return "0";
                            else
                                return item.m7;
                        },
                        totalSummary: { type: 'tsum' }
                    },
                    {
                        display: '八月', name: 'm8', width: 50, render: function (item) {
                            if (typeof (item.m8) == "undefined" || (typeof (item.m8) == "number" && item.m8 == "0"))
                                return "0";
                            else
                                return item.m8;
                        },
                        totalSummary: { type: 'tsum' }
                    },
                    {
                        display: '九月', name: 'm9', width: 50, render: function (item) {
                            if (typeof (item.m9) == "undefined" || (typeof (item.m9) == "number" && item.m9 == "0"))
                                return "0";
                            else
                                return item.m9;
                        },
                        totalSummary: { type: 'tsum' }
                    },
                    {
                        display: '十月', name: 'm10', width: 40, render: function (item) {
                            if (typeof (item.m10) == "undefined" || (typeof (item.m10) == "number" && item.m10 == "0"))
                                return "0";
                            else
                                return item.m10;
                        },
                        totalSummary: { type: 'tsum' }
                    },
                    {
                        display: '十一月', name: 'm11', width: 50, render: function (item) {
                            if (typeof (item.m11) == "undefined" || (typeof (item.m11) == "number" && item.m11 == "0"))
                                return "0";
                            else
                                return item.m11;
                        },
                        totalSummary: { type: 'tsum' }
                    },
                    {
                        display: '十二月', name: 'm12', width: 50, render: function (item) {
                            if (typeof (item.m12) == "undefined" || (typeof (item.m12) == "number" && item.m12 == "0"))
                                return "0";
                            else
                                return item.m12;
                        },
                        totalSummary: { type: 'tsum' }
                    }
                ],
                url: '',
                usePager: false,
                //dataAction: 'local', pageSize: 30, pageSizeOptions: [20, 30, 50, 100],
                width: '100%', height: '100%',
                //title: "年度统计表",
                heightDiff: -20
            });

            $("#toolbar").ligerToolBar({
                items: [
                    { type: 'textbox', id: 'stype', text: '统计项:' },
                    { type: 'textbox', id: "syear", text: "年度：" },
                    { type: 'button', text: '统计', icon: '../../images/search.gif', disable: true, click: function () { doserch(); } },
                    { type: 'button', text: '重置', icon: '../../images/edit.gif', disable: true, click: function () { $("#serchform").each(function () { this.reset(); $(".l-selected").removeClass("l-selected"); }); } }
                ]
                //激活哪个
            });
            initSelect();

            $("#grid").height(document.documentElement.clientHeight - $(".toolbar").height() - 350);

            $("#maingrid5").ligerGetGridManager()._onResize();
            doserch();
        });

        function initSelect() {
            $("#stype").ligerComboBox({
                width: 100,
                initValue: 'follow_type',
                data: [
                    { 'text': '跟进方式', 'id': 'follow_type' }
                ]
            })
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
            var mc1 = 0; mc2 = 0; mc3 = 0; mc4 = 0; mc5 = 0; mc6 = 0; mc7 = 0; mc8 = 0; mc9 = 0; mc10 = 0; mc11 = 0; mc12 = 0;
            for (var i = 0; i < GridData.Rows.length; i++) {
                var flowtype = GridData.Rows[i].items;
                if (GridData.Rows[i].items == "undefined")
                    flowtype = "未分类";
                var m1 = typeof (GridData.Rows[i].m1) != 'number' ? 0 : GridData.Rows[i].m1;
                var m2 = typeof (GridData.Rows[i].m2) != 'number' ? 0 : GridData.Rows[i].m2;
                var m3 = typeof (GridData.Rows[i].m3) != 'number' ? 0 : GridData.Rows[i].m3;
                var m4 = typeof (GridData.Rows[i].m4) != 'number' ? 0 : GridData.Rows[i].m4;
                var m5 = typeof (GridData.Rows[i].m5) != 'number' ? 0 : GridData.Rows[i].m5;
                var m6 = typeof (GridData.Rows[i].m6) != 'number' ? 0 : GridData.Rows[i].m6;
                var m7 = typeof (GridData.Rows[i].m7) != 'number' ? 0 : GridData.Rows[i].m7;
                var m8 = typeof (GridData.Rows[i].m8) != 'number' ? 0 : GridData.Rows[i].m8;
                var m9 = typeof (GridData.Rows[i].m9) != 'number' ? 0 : GridData.Rows[i].m9;
                var m10 = typeof (GridData.Rows[i].m10) != 'number' ? 0 : GridData.Rows[i].m10;
                var m11 = typeof (GridData.Rows[i].m11) != 'number' ? 0 : GridData.Rows[i].m11;
                var m12 = typeof (GridData.Rows[i].m12) != 'number' ? 0 : GridData.Rows[i].m12;

                series.push({ "name": flowtype, "type": "bar", "data": [m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12] });
                legend.push(flowtype);
                mc1 += m1; mc2 += m2; mc3 += m3; mc4 += m4; mc5 += m5; mc6 += m6; mc7 += m7; mc8 += m8; mc9 += m9; mc10 += m10; mc11 += m11; mc12 += m12;
            }
            series.push({ "name": "总计", "type": "line", "data": [mc1, mc2, mc3, mc4, mc5, mc6, mc7, mc8, mc9, mc10, mc11, mc12] });
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
                        data: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"]
                    }
                ],
                yAxis: [
                    {
                        type: 'value'
                    }
                ],
                series: series,
                dataZoom: {
                    show: true,
                    realtime: true,
                    start: 0,
                    end: 100
                },
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
            var sendtxt = "&rnd=" + Math.random();
            var serchtxt = $("#serchform :input").fieldSerialize() + sendtxt;
            //alert(serchtxt);
            var manager = $("#maingrid5").ligerGetGridManager();

            $.ligerDialog.waitting('数据查询中,请稍候...');
            $.ajax({
                url: "Reports_CRM.Follow_Reports_year.xhd", type: "POST",
                data: serchtxt,
                dataType: 'json',
                beforeSend: function () {

                },
                success: function (responseText) {
                    manager._setUrl("Reports_CRM.Follow_Reports_year.xhd?" + serchtxt);
                    $.ligerDialog.closeWaitting();
                    test(responseText);
                },
                error: function () {
                    top.$.ligerDialog.closeWaitting();
                    top.$.ligerDialog.error('查询失败！请检查查询项。');
                }
            });
            //test();
        }
        function f_reload() {
            var manager = $("#maingrid5").ligerGetGridManager();
            manager.loadData(true);
        };


    </script>
</head>
<body>
    <div style="padding: 10px;">
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
