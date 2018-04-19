﻿/*
* Sale_order.cs
*
* 功 能： N/A
* 类 名： Sale_order
*
* Ver    变更日期             负责人     变更内容
* ───────────────────────────────────
* V1.0  2016-03-08 08:50:40    黄润伟    
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
	/// Sale_order
	/// </summary>
	public partial class Sale_order
	{
		private readonly XHD.DAL.Sale_order dal=new XHD.DAL.Sale_order();
		public Sale_order()
		{}
		#region  BasicMethod
		
		/// <summary>
		/// 增加一条数据
		/// </summary>
		public bool Add(XHD.Model.Sale_order model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// 更新一条数据
		/// </summary>
		public bool Update(XHD.Model.Sale_order model)
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
		/// 删除一条数据
		/// </summary>
		public bool DeleteList(string idlist )
		{
			return dal.DeleteList(XHD.Common.PageValidate.SafeLongFilter(idlist,0) );
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
        /// <summary>
        ///     更新收款金额
        /// </summary>
        /// <param name="orderid"></param>
        /// <returns></returns>
        public bool UpdateReceive(string orderid)
        {
            return dal.UpdateReceive(orderid);
        }

        

        /// <summary>
        ///     同比环比
        /// </summary>
        /// <param name="dt1"></param>
        /// <param name="dt2"></param>
        /// <param name="idlist"></param>
        /// <returns></returns>
        public DataSet Compared_empcusorder(string year1, string month1, string year2, string month2, string idlist)
        {
            return dal.Compared_empcusorder(year1, month1, year2, month2, idlist);
        }

        /// <summary>
        ///     客户成交统计
        /// </summary>
        public DataSet report_emporder(int year, string idlist)
        {
            return dal.report_emporder(year, idlist);
        }

        /// <summary>
        ///     更新发票金额
        /// </summary>
        /// <param name="orderid"></param>
        /// <returns></returns>
        public bool UpdateInvoice(string orderid)
        {
            return dal.UpdateInvoice(orderid);
        }

        #endregion  ExtensionMethod
    }
}

