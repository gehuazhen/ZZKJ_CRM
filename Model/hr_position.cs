﻿/*
* hr_position.cs
*
* 功 能： N/A
* 类 名： hr_position
*
* Ver    变更日期             负责人     变更内容
* ───────────────────────────────────
* V1.0  2016-02-03 14:16:16    黄润伟    
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
	/// hr_position:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class hr_position
	{
		public hr_position()
		{}
		#region Model
		private string _id;
		private string _position_name;
		private int? _position_order;
		private string _position_level;
		
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
		public string position_name
		{
			set{ _position_name=value;}
			get{return _position_name;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? position_order
		{
			set{ _position_order=value;}
			get{return _position_order;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string position_level
		{
			set{ _position_level=value;}
			get{return _position_level;}
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

