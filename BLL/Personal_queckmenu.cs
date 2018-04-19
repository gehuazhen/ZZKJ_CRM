/*
* Personal_queckmenu.cs
*
* 功 能： N/A
* 类 名： Personal_queckmenu
*
* Ver    变更日期             负责人     变更内容
* ───────────────────────────────────
* V1.0  2016-04-01 12:24:01    黄润伟    
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
	/// Personal_queckmenu
	/// </summary>
	public partial class Personal_queckmenu
	{
		private readonly XHD.DAL.Personal_queckmenu dal=new XHD.DAL.Personal_queckmenu();
		public Personal_queckmenu()
		{}
		#region  BasicMethod

		/// <summary>
		/// 增加一条数据
		/// </summary>
		public bool Add(XHD.Model.Personal_queckmenu model)
		{
			return dal.Add(model);
		}

		
		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool Delete(XHD.Model.Personal_queckmenu model)
		{
			//该表无主键信息，请自定义主键/条件字段
			return dal.Delete(model);
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

