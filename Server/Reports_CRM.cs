﻿/*
* Reports_CRM.cs
*
* 功 能： N/A
* 类 名： Reports_CRM
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

using System.Data;
using System.Web;
using XHD.Common;
using XHD.Controller;

namespace XHD.Server
{
    public class Reports_CRM
    {
        public HttpContext Context;
        public string emp_id;
        public string emp_name;
        public Model.hr_employee employee;
        public HttpRequest request;
        public string uid;
        

        public Reports_CRM()
        {
        }

        public Reports_CRM(HttpContext context)
        {
            Context = context;
            request = context.Request;

            var userinfo = new User_info();
            employee = userinfo.GetCurrentEmpInfo(context);

            emp_id = employee.id;
            emp_name = PageValidate.InputText(employee.name, 50);
            uid = PageValidate.InputText(employee.uid, 50);
            
        }
        public string CRM_Reports_year()
        {
            var ccc = new BLL.CRM_Customer();

            string stype_val = PageValidate.InputText(request["stype_val"], 255);
            string syear = PageValidate.InputText(request["syear"], 50);

            if (!PageValidate.IsNumber(syear)) return "{}";

            DataSet ds = ccc.Reports_year(stype_val, int.Parse( syear), $"1=1");

            string dt = GetGridJSON.DataTableToJSON(ds.Tables[0]);
            return dt;
        }

        public string Follow_Reports_year()
        {
            var follow = new BLL.CRM_follow();

            string items = "Follow_Type";

            string syear = PageValidate.InputText(request["syear"], 50);
            if (!PageValidate.IsNumber(syear)) return "{}";

            DataSet ds = follow.Reports_year(items,int.Parse(syear), $"1=1");

            string dt = GetGridJSON.DataTableToJSON(ds.Tables[0]);
            return dt;
        }

        public string Funnel()
        {
            string whereStr = "";

            string stype_val = PageValidate.InputText(request["stype_val"], 255);
            string syear = PageValidate.InputText(request["syear"], 50);

            if (!PageValidate.IsNumber(syear)) return "{}";

            stype_val = stype_val.TrimEnd(';');
            string[] ids = stype_val.Split(';');

            string typeid = "";

            for (int i = 0; i < ids.Length; i++)
            {
                typeid += $"'{ids[i]}',";
            }
            typeid = typeid.TrimEnd(',');

            if (!string.IsNullOrEmpty(stype_val) && stype_val != "null")
                whereStr =$" a.id in ({typeid})";

            //context.Response.Write(whereStr);

            var ccc = new BLL.CRM_Customer();
            DataSet ds = ccc.Funnel(whereStr, syear.ToString());

            string dt = GetGridJSON.DataTableToJSON(ds.Tables[0]);

            return dt;
        }
    }
}