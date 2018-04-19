/*
* GetTime.cs
*
* 功 能： N/A
* 类 名： GetTime
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
    public class GetTime
    {
        public static int GetTimeZone()
        {
            DateTime now = DateTime.Now;
            DateTime utcnow = now.ToUniversalTime();

            TimeSpan sp = now - utcnow;

            return sp.Hours;
        }

        public static long MilliTimeStamp(DateTime theDate)
        {
            var d1 = new DateTime(1970, 1, 1);
            DateTime d2 = theDate.ToUniversalTime();
            var ts = new TimeSpan(d2.Ticks - d1.Ticks);
            return (long) ts.TotalMilliseconds;
        }
    }
}