<%@ Page Language="C#" AutoEventWireup="true" %>

<%--���ҳ��--%>
<%
    //�ж��Ƿ�������
    XHD.Server.install ins = new XHD.Server.install();
    int configed = ins.configed();

    if (configed == 1)
    {
        //�ж��Ƿ��½
        HttpCookie cookie = Request.Cookies[FormsAuthentication.FormsCookieName];
        if (Request.IsAuthenticated && null!=cookie)
            Response.Redirect("main.aspx");

        else
            Response.Redirect("login.aspx");
        //Response.Redirect("login.aspx");
    }
    else
        Response.Redirect("install/index.aspx");
 %>

