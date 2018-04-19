﻿/*
* Sys_Param_Type.cs
*
* 功 能： N/A
* 类 名： Sys_Param_Type
*
* Ver    变更日期             负责人     变更内容
* ───────────────────────────────────
* V1.0  2016-02-18 20:54:46    黄润伟    
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
	/// 数据访问类:Sys_Param_Type
	/// </summary>
	public partial class Sys_Param_Type
	{
		public Sys_Param_Type()
		{}
		#region  BasicMethod

		

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select id,params_name,params_order,create_id,create_time ");
			strSql.Append(" FROM Sys_Param_Type ");
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
            strSql.Append(" id,params_name,params_order,create_id,create_time ");
            strSql.Append(" FROM Sys_Param_Type ");
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

