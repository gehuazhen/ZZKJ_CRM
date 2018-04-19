/*
* CRM_follow.cs
*
* 功 能： N/A
* 类 名： CRM_follow
*
* Ver    变更日期             负责人     变更内容
* ───────────────────────────────────
* V1.0  2016-03-04 20:46:45    黄润伟    
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
	/// CRM_follow:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class CRM_follow
	{
		public CRM_follow()
		{}
		#region Model
		private string _id;
		private string _customer_id;
		private string _contact_id;
		private string _follow_aim_id;
		private string _follow_type_id;
		private string _follow_content;
		private DateTime? _follow_time;
		private string _employee_id;
		
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
		public string customer_id
		{
			set{ _customer_id=value;}
			get{return _customer_id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string contact_id
		{
			set{ _contact_id=value;}
			get{return _contact_id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string follow_aim_id
		{
			set{ _follow_aim_id=value;}
			get{return _follow_aim_id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string follow_type_id
		{
			set{ _follow_type_id=value;}
			get{return _follow_type_id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string follow_content
		{
			set{ _follow_content=value;}
			get{return _follow_content;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? follow_time
		{
			set{ _follow_time=value;}
			get{return _follow_time;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string employee_id
		{
			set{ _employee_id=value;}
			get{return _employee_id;}
		}
		
		#endregion Model

	}
}

