﻿/*
* Sale_order_details.cs
*
* 功 能： N/A
* 类 名： Sale_order_details
*
* Ver    变更日期             负责人     变更内容
* ───────────────────────────────────
* V1.0  2016-03-08 08:53:11    黄润伟    
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
	/// Sale_order_details
	/// </summary>
	public partial class Sale_order_details
	{
		private readonly XHD.DAL.Sale_order_details dal=new XHD.DAL.Sale_order_details();
		public Sale_order_details()
		{}
		#region  BasicMethod
		

		/// <summary>
		/// 增加一条数据
		/// </summary>
		public bool Add(XHD.Model.Sale_order_details model)
		{
			return dal.Add(model);
		}

        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool Update(XHD.Model.Sale_order_details model)
        {
            return dal.Update(model);
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public bool Delete(string id)
		{
			
			return dal.Delete(id);
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

		

		#endregion  BasicMethod
		#region  ExtensionMethod

		#endregion  ExtensionMethod
	}
}

