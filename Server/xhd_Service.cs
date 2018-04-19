/*
* xhd_Service.cs
*
* 功 能： N/A
* 类 名： Sys_base
*
* Ver    变更日期             负责人     变更内容
* ───────────────────────────────────
* V1.0  2015-10-17 11:38:21    黄润伟    
*
* Copyright (c) 2015 www.xhdcrm.com   All rights reserved.
*┌──────────────────────────────────┐
*│　版权所有：黄润伟                      　　　　　　　　　　　　　　│
*└──────────────────────────────────┘
*/

using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Text;
using System.Web;
using XHD.BLL;
using XHD.Common;
using XHD.Controller;

namespace XHD.Server
{
    public class xhd_Service
    {
        public HttpContext Context;
        public string emp_id;
        public string emp_name;
        public Model.hr_employee employee;
        public HttpRequest request;
        public string uid;

        public xhd_Service()
        {
        }

        public xhd_Service(HttpContext context)
        {
            Context = context;
            request = context.Request;

            var userinfo = new User_info();
            employee = userinfo.GetCurrentEmpInfo(context);

            emp_id = employee.id;
            emp_name = PageValidate.InputText(employee.name, 50);
            uid = PageValidate.InputText(employee.uid, 50);
        }

        /// <summary>
        /// 建议
        /// </summary>
        /// <returns></returns>
        public int suggest()
        {
            var suggest = new XHD.Service.ServiceHelper();
            string Suggestion = emp_name;
            string QQ = null;
            string tel = PageValidate.InputText(employee.tel, 50);
            string email = PageValidate.InputText(employee.email, 250);
            string SuggestContent = PageValidate.InputText(request[""], int.MaxValue);

            return suggest.suggest( Suggestion, QQ, tel, email, SuggestContent);
        }

        /// <summary>
        /// 获取版本
        /// </summary>
        /// <returns></returns>
        public string getVersion()
        {
            var version = new XHD.Service.ServiceHelper();

            string guid = PageValidate.InputText(request["T_guid"], 50);
            string name = PageValidate.InputText(request["T_name"], 250);

            return version.getVersion(guid, name);
        }

    }
}
