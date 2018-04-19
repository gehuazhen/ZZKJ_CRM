/*
* GetSession.cs
*
* 功 能： N/A
* 类 名： GetSession
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

using System.Web;
using System.Web.SessionState;

namespace XHD.Controller
{
    public class GetSession : IRequiresSessionState
    {
        private static HttpSessionState Session = HttpContext.Current.Session;
        private HttpRequest Request = HttpContext.Current.Request;
        private HttpResponse Response = HttpContext.Current.Response;
        private HttpServerUtility Server = HttpContext.Current.Server;

        public static HttpSessionState session
        {
            get { return Session; }
            set { Session = value; }
        }
    }
}