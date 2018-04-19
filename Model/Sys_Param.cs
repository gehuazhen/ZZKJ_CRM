﻿/*
* Sys_Param.cs
*
* 功 能： N/A
* 类 名： Sys_Param
*
* Ver    变更日期             负责人     变更内容
* ───────────────────────────────────
* V1.0  2016-02-18 20:54:47    黄润伟    
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
	/// Sys_Param:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class Sys_Param
	{
		public Sys_Param()
		{}
		#region Model
		private string _id;
		private string _params_name;
		private string _params_type;
		private int? _params_order=10;
		
		private string _create_id;
		private DateTime? _create_time= DateTime.Now;
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
		public string params_name
		{
			set{ _params_name=value;}
			get{return _params_name;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string params_type
		{
			set{ _params_type=value;}
			get{return _params_type;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? params_order
		{
			set{ _params_order=value;}
			get{return _params_order;}
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

