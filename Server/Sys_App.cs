/*
* Sys_App.cs
*
* 功 能： N/A
* 类 名： Sys_App
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
using System.Text;
using System.Web;
using XHD.Common;
using XHD.Controller;

namespace XHD.Server
{
    public class Sys_App
    {
        public static BLL.Sys_App app = new BLL.Sys_App();
        public static Model.Sys_App model = new Model.Sys_App();

        public HttpContext Context;
        public string emp_id;
        public string emp_name;
        public Model.hr_employee employee;
        public HttpRequest request;
        public string uid;
        

        public Sys_App()
        {
        }

        public Sys_App(HttpContext context)
        {
            Context = context;
            request = context.Request;

            var userinfo = new User_info();
            employee = userinfo.GetCurrentEmpInfo(context);

            emp_id = employee.id;
            emp_name = PageValidate.InputText(employee.name, 50);
            uid = PageValidate.InputText(employee.uid, 50);
            
        }

        public string GetSysApp()
        {
            var getappauth = new GetAuthorityByUid();
            string apps = getappauth.GetAuthority(emp_id.ToString(), "Apps");

            bool BtnAble = false;

            if (uid == "admin")
            {
                BtnAble = true;
            }

            DataSet ds = app.GetList(0, "", "App_order");
            string toolbarscript = "{Items:[";

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                toolbarscript += "{";
                toolbarscript += "type: 'button',";
                toolbarscript += "text: '" + ds.Tables[0].Rows[i]["App_name"] + "',";
                toolbarscript += "icon: '" + ds.Tables[0].Rows[i]["App_icon"] + "',";

                if (BtnAble)
                {
                    toolbarscript += "disable: true,";
                }
                else
                {
                    toolbarscript += "disable: " + getappauth.GetAppAuthority(emp_id.ToString(), ds.Tables[0].Rows[i]["id"].ToString()) +",";
                }
                toolbarscript += "click: function () {";
                toolbarscript += "f_according('" + ds.Tables[0].Rows[i]["App_no"] + "')";
                toolbarscript += "}";
                toolbarscript += "},";
            }
            toolbarscript = toolbarscript.Substring(0, toolbarscript.Length - 1);
            toolbarscript += "]}";
            return (toolbarscript);
        }

        public string GetAppList()
        {
            var app = new BLL.Sys_App();
            DataSet ds = app.GetList(0, " ", "App_order");

            var str = new StringBuilder();
            str.Append("[");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                str.Append("{\"id\":\"" + ds.Tables[0].Rows[i]["id"] + "\",\"text\":\"" + ds.Tables[0].Rows[i]["App_name"] + "\",\"App_icon\":\"" + ds.Tables[0].Rows[i]["App_icon"] + "\"},");
            }
            str.Replace(",", "", str.Length - 1, 1);
            str.Append("]");
            return str.ToString();
        }
        
    }
}