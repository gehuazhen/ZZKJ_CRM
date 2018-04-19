/*
* Sys_Param_Provinces.cs
*
* 功 能： N/A
* 类 名： Sys_Param_Provinces
*
* Ver    变更日期             负责人     变更内容
* ───────────────────────────────────
* V1.0  2016-01-28 21:23:03    黄润伟    
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
	/// Sys_Param_Provinces:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class Sys_Param_Provinces
	{
		public Sys_Param_Provinces()
		{}
		#region Model
		private string _id;
		private string _provinces;
		private int? _provinces_order;
		private string _provinces_type;
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
		public string Provinces
		{
			set{ _provinces=value;}
			get{return _provinces;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? Provinces_order
		{
			set{ _provinces_order=value;}
			get{return _provinces_order;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Provinces_type
		{
			set{ _provinces_type=value;}
			get{return _provinces_type;}
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

