﻿/*
* Sys_log_Err.cs
*
* 功 能： N/A
* 类 名： Sys_log_Err
*
* Ver    变更日期             负责人     变更内容
* ───────────────────────────────────
* V1.0  2015-11-01 12:44:11    黄润伟    
*
* Copyright © 2015 www.xhdcrm.com All rights reserved.
*┌──────────────────────────────────┐
*│　版权所有：小黄豆                      　　　　　　　　　　　　　　│
*└──────────────────────────────────┘
*/
using System;
using System.Data;
using System.Collections.Generic;
using XHD.Common;
using XHD.Model;
namespace XHD.BLL
{
	/// <summary>
	/// Sys_log_Err
	/// </summary>
	public partial class Sys_log_Err
	{
		private readonly XHD.DAL.Sys_log_Err dal=new XHD.DAL.Sys_log_Err();
		public Sys_log_Err()
		{}
		#region  BasicMethod
		

		/// <summary>
		/// 增加一条数据
		/// </summary>
		public bool Add(XHD.Model.Sys_log_Err model)
		{
			return dal.Add(model);
		}

		
		
        

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			return dal.GetList(strWhere);
		}
		/// <summary>
		/// 获得前几行数据
		/// </summary>
		public DataSet GetList(int Top,string strWhere,string filedOrder)
		{
			return dal.GetList(Top,strWhere,filedOrder);
		}
		

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetAllList()
		{
			return GetList("");
		}

		/// <summary>
		/// 分页获取数据列表
		/// 分页获取数据列表
		/// </summary>
		public DataSet GetList(int PageSize, int PageIndex, string strWhere, string filedOrder, out string Total)
		{
			return dal.GetList(PageSize, PageIndex, strWhere, filedOrder, out Total);
		}

        #endregion  BasicMethod
        #region  ExtensionMethod
        public DataSet GetLogtype()
        {
            return dal.GetLogtype();
        }
        #endregion  ExtensionMethod
    }
}

