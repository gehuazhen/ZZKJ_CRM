﻿/*
* CRM_contract.cs
*
* 功 能： N/A
* 类 名： CRM_contract
*
* Ver    变更日期             负责人     变更内容
* ───────────────────────────────────
* V1.0  2017-09-16 00:10:54   黄润伟    
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
using System.Collections.Generic;
using XHD.Common;
using XHD.Model;
namespace XHD.BLL
{
	/// <summary>
	/// CRM_contract
	/// </summary>
	public partial class CRM_contract
	{
		private readonly XHD.DAL.CRM_contract dal=new XHD.DAL.CRM_contract();
		public CRM_contract()
		{}
		#region  BasicMethod
		/// <summary>
		/// 增加一条数据
		/// </summary>
		public bool Add(XHD.Model.CRM_contract model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// 更新一条数据
		/// </summary>
		public bool Update(XHD.Model.CRM_contract model)
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

		#endregion  ExtensionMethod
	}
}

