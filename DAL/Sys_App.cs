/*
* Sys_App.cs
*
* 功 能： N/A
* 类 名： Sys_App
*
* Ver    变更日期             负责人     变更内容
* ───────────────────────────────────
* V1.0  2015-11-01 12:44:10    黄润伟    
*
* Copyright © 2015 www.xhdcrm.com All rights reserved.
*┌──────────────────────────────────┐
*│　版权所有：小黄豆                      　　　　　　　　　　　　　　│
*└──────────────────────────────────┘
*/
using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using XHD.DBUtility;//Please add references
namespace XHD.DAL
{
	/// <summary>
	/// 数据访问类:Sys_App
	/// </summary>
	public partial class Sys_App
	{
		public Sys_App()
		{}
		#region  BasicMethod

		


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public bool Add(XHD.Model.Sys_App model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Sys_App(");
			strSql.Append("id,App_name,App_order,App_url,App_handler,App_type,App_icon)");
			strSql.Append(" values (");
			strSql.Append("@id,@App_name,@App_order,@App_url,@App_handler,@App_type,@App_icon)");
			SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.VarChar,50),
					new SqlParameter("@App_name", SqlDbType.NVarChar,100),
					new SqlParameter("@App_order", SqlDbType.Int,4),
					new SqlParameter("@App_url", SqlDbType.VarChar,250),
					new SqlParameter("@App_handler", SqlDbType.VarChar,250),
					new SqlParameter("@App_type", SqlDbType.VarChar,50),
					new SqlParameter("@App_icon", SqlDbType.VarChar,250)};
			parameters[0].Value = model.id;
			parameters[1].Value = model.App_name;
			parameters[2].Value = model.App_order;
			parameters[3].Value = model.App_url;
			parameters[4].Value = model.App_handler;
			parameters[5].Value = model.App_type;
			parameters[6].Value = model.App_icon;

			int rows=DbHelperSQL.ExecuteSql(strSql.ToString(),parameters);
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select id,App_name,App_order,App_url,App_handler,App_type,App_icon ");
			strSql.Append(" FROM Sys_App ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			return DbHelperSQL.Query(strSql.ToString());
		}

        /// <summary>
        /// 获得前几行数据
        /// </summary>
        public DataSet GetList(int Top, string strWhere, string filedOrder)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select ");
            if (Top > 0)
            {
                strSql.Append(" top " + Top.ToString());
            }
            strSql.Append(" id,App_name,App_order,App_url,App_handler,App_type,App_icon ");
            strSql.Append(" FROM Sys_App ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            strSql.Append(" order by " + filedOrder);
            return DbHelperSQL.Query(strSql.ToString());
        }

        #endregion  BasicMethod
        #region  ExtensionMethod

        #endregion  ExtensionMethod
    }
}

