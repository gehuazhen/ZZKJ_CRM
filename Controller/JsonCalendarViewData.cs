/*
* JsonCalendarViewData.cs
*
* 功 能： N/A
* 类 名： JsonCalendarViewData
*
* Ver    变更日期             负责人     变更内容
* ───────────────────────────────────
* V1.0  2015-06-23 18:38:21    黄润伟    
*
* Copyright (c) 2015 www.xhdcrm.com   All rights reserved.
*┌──────────────────────────────────┐
*│　版权所有：黄润伟                      　　　　　　　　　　　　　　│
*└──────────────────────────────────┘
*/

using System;
using System.Collections.Generic;
using XHD.Model;

namespace XHD.Controller
{
    public class JsonCalendarViewData
    {
        public JsonCalendarViewData(List<Personal_Calendar> eventList, DateTime startDate, DateTime endDate)
        {
            events = eventList;
            start = startDate;
            end = endDate;
            issort = true;
        }

        public JsonCalendarViewData(List<Personal_Calendar> eventList, DateTime startDate, DateTime endDate, bool isSort)
        {
            start = startDate;
            end = endDate;
            events = eventList;
            issort = isSort;
        }

        public List<Personal_Calendar> events { get; private set; }
        public bool issort { get; private set; }

        public DateTime start { get; private set; }
        public DateTime end { get; private set; }
    }
}