/*
* Sys_info.cs
*
* 功 能： N/A
* 类 名： Sys_info
*
* Ver    变更日期             负责人     变更内容
* ───────────────────────────────────
* V1.0  2016-07-11 18:10:45   黄润伟    
*
* Copyright © 2015 www.xhdcrm.com All rights reserved.
__  ___   _ ____   ____ ____  __  __ 
\ \/ / | | |  _ \ / ___|  _ \|  \/  |
 \  /| |_| | | | | |   | |_) | |\/| |
 /  \|  _  | |_| | |___|  _ <| |  | |
/_/\_\_| |_|____/ \____|_| \_\_|  |_|
*/
using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using XHD.DBUtility;//Please add references
namespace XHD.DAL
{
	/// <summary>
	/// 数据访问类:Sys_info
	/// </summary>
	public partial class Sys_info
	{
		public Sys_info()
		{}
		#region  BasicMethod


		
		/// <summary>
		/// 更新一条数据
		/// </summary>
		public bool Update(XHD.Model.Sys_info model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Sys_info set ");			
			strSql.Append("sys_value=@sys_value");
			strSql.Append(" where  ");
            strSql.Append("sys_key=@sys_key");
			SqlParameter[] parameters = {
					new SqlParameter("@sys_key", SqlDbType.VarChar,50),
					new SqlParameter("@sys_value", SqlDbType.NVarChar,-1)
            };
			parameters[0].Value = model.sys_key;
			parameters[1].Value = model.sys_value;

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
			strSql.Append("select sys_key,sys_value ");
			strSql.Append(" FROM Sys_info ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			return DbHelperSQL.Query(strSql.ToString());
		}

		
		
		#endregion  BasicMethod
		#region  ExtensionMethod

		#endregion  ExtensionMethod
	}
}

