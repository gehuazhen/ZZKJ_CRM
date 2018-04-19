﻿/*
* CalendarViewFormat.cs
*
* 功 能： N/A
* 类 名： CalendarViewFormat
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

namespace XHD.Controller
{
    public class CalendarViewFormat
    {
        public CalendarViewFormat()
        {
        }

        /// <summary>
        ///     Initializes a new instance of the <see cref="CalendarViewFormat" /> class.
        /// </summary>
        /// <param name="viewType">Type of the view.</param>
        /// <param name="showday">The showday.</param>
        /// <param name="weekStartDay">The week start day.</param>
        public CalendarViewFormat(CalendarViewType viewType, DateTime showday, DayOfWeek weekStartDay)
        {
            int index, w;
            switch (viewType)
            {
                case CalendarViewType.day: //日
                    StartDate = showday.Date;
                    EndDate = showday.Date.AddHours(23).AddMinutes(59).AddSeconds(59);
                    break;
                case CalendarViewType.week: // 周            
                    index = weekStartDay.GetHashCode(); //0                  
                    w = index - showday.DayOfWeek.GetHashCode(); //0-1
                    if (w > 0) w = w - 7;
                    StartDate = showday.AddDays(w).Date;
                    EndDate = StartDate.AddDays(6).AddHours(23).AddMinutes(59).AddSeconds(59);
                    break;
                case CalendarViewType.month: // 月         
                    var firstdate = new DateTime(showday.Year, showday.Month, 1);
                    index = weekStartDay.GetHashCode(); //0
                    w = index - firstdate.DayOfWeek.GetHashCode(); //0-1
                    if (w > 0)
                    {
                        w -= 7;
                    }
                    //w = 0;
                    StartDate = firstdate.AddDays(w).Date;
                    EndDate = StartDate.AddDays(34);

                    if (EndDate.Year == showday.Year && EndDate.Month == showday.Month &&EndDate.AddDays(1).Month == EndDate.Month)
                    {
                        EndDate = EndDate.AddDays(7);
                    }
                    EndDate.AddHours(23).AddMinutes(59).AddSeconds(59);
                    break;
            }
        }

        public DateTime StartDate { get; private set; }
        public DateTime EndDate { get; private set; }
    }

    public enum CalendarViewType
    {
        day,
        week,
        workweek,
        month
    }
}