/*
* Sys_Param_City.cs
*
* 功 能： N/A
* 类 名： Sys_Param_City
*
* Ver    变更日期             负责人     变更内容
* ───────────────────────────────────
* V1.0  2016-01-28 21:23:02    黄润伟    
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
	/// Sys_Param_City:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class Sys_Param_City
	{
		public Sys_Param_City()
		{}
		#region Model
		private string _id;
		private string _provinces_id;
		private string _city;
		private int? _city_order;
		private string _city_type;
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
		public string Provinces_id
		{
			set{ _provinces_id=value;}
			get{return _provinces_id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string City
		{
			set{ _city=value;}
			get{return _city;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? City_order
		{
			set{ _city_order=value;}
			get{return _city_order;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string City_type
		{
			set{ _city_type=value;}
			get{return _city_type;}
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

