﻿/*
* Product_category.cs
*
* 功 能： N/A
* 类 名： Product_category
*
* Ver    变更日期             负责人     变更内容
* ───────────────────────────────────
* V1.0  2016-03-06 13:36:04    黄润伟    
*
* Copyright © 2015 www.xhdcrm.com All rights reserved.
*┌──────────────────────────────────┐
*│　版权所有：小黄豆                      　　　　　　　　　　　　　　│
*└──────────────────────────────────┘
*/
using System;
namespace XHD.Model
{
	/// <summary>
	/// Product_category:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class Product_category
	{
		public Product_category()
		{}
		#region Model
		private string _id;
		private string _product_category;
		private string _parentid;
		private string _product_icon;
		
		private string _create_id;
		private DateTime? _create_time;
		/// <summary>
		/// 
		/// </summary>
		public string id
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string product_category
		{
			set{ _product_category=value;}
			get{return _product_category;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string parentid
		{
			set{ _parentid=value;}
			get{return _parentid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string product_icon
		{
			set{ _product_icon=value;}
			get{return _product_icon;}
		}
		
		/// <summary>
		/// 
		/// </summary>
		public string create_id
		{
			set{ _create_id=value;}
			get{return _create_id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? create_time
		{
			set{ _create_time=value;}
			get{return _create_time;}
		}
		#endregion Model

	}
}

