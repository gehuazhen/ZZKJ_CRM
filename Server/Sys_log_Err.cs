﻿/*
* Sys_log_Err.cs
*
* 功 能： N/A
* 类 名： Sys_log_Err
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
using System.Data;
using System.Text;
using System.Web;
using XHD.Common;
using XHD.Controller;

namespace XHD.Server
{
    public class Sys_log_Err
    {
        public static BLL.Sys_log_Err log = new BLL.Sys_log_Err();
        public static Model.Sys_log_Err model = new Model.Sys_log_Err();

        public HttpContext Context;
        public string emp_id;
        public string emp_name;
        public Model.hr_employee employee;
        public HttpRequest request;
        public string uid;


        public Sys_log_Err()
        {
        }

        public Sys_log_Err(HttpContext context)
        {
            Context = context;
            request = context.Request;

            var userinfo = new User_info();
            employee = userinfo.GetCurrentEmpInfo(context);

            emp_id = employee.id;
            emp_name = PageValidate.InputText(employee.name, 50);
            uid = PageValidate.InputText(employee.uid, 50);
        }

        public string grid()
        {
            int PageIndex = int.Parse(request["page"] == null ? "1" : request["page"]);
            int PageSize = int.Parse(request["pagesize"] == null ? "30" : request["pagesize"]);
            string sortname = request["sortname"];
            string sortorder = request["sortorder"];

            if (string.IsNullOrEmpty(sortname))
                sortname = " Err_time";
            if (string.IsNullOrEmpty(sortorder))
                sortorder = " desc";

            string sorttext = " " + sortname + " " + sortorder;

            string Total = "0";

            DataSet ds = null;

            string serchtext = "1=1";

            if (!string.IsNullOrEmpty(request["stype"]))
                serchtext += " and Err_type = '" + request["stype"] + "'";

            if (!string.IsNullOrEmpty(request["sstart"]))
                serchtext += " and Err_time >= '" + DateTime.Parse(request["sstart"]) + "'";

            if (!string.IsNullOrEmpty(request["sdend"]))
                serchtext += " and Err_time <= '" +
                             DateTime.Parse(request["sdend"]).AddHours(23).AddMinutes(59).AddSeconds(59) + "'";

            if (!string.IsNullOrEmpty(request["stext"]))
            {
                serchtext += " and (Err_url like N'%" + request["stext"] + "%'";
                serchtext += " or Err_message like N'%" + request["stext"] + "%'";
                serchtext += " or Err_source like N'%" + request["stext"] + "%'";
                serchtext += " or Err_ip like N'%" + request["stext"] + "%'";
            }

            ds = log.GetList(PageSize, PageIndex, serchtext, sorttext, out Total);

            string dt = GetGridJSON.DataTableToJSON1(ds.Tables[0], Total);
            return dt;
        }

        public string logtype()
        {
            DataSet ds = log.GetLogtype();

            var str = new StringBuilder();

            str.Append("[");

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                str.Append($"{{\"value\":\"{ ds.Tables[0].Rows[i]["Err_type"] }\",\"text\":\"{ ds.Tables[0].Rows[i]["Err_type"] }\"}},");
            }
            str.Replace(",", "", str.Length - 1, 1);
            str.Append("]");

            return str.ToString();
        }
    }
}