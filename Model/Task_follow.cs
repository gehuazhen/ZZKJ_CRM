/*
* Task_follow.cs
*
* 功 能： N/A
* 类 名： Task_follow
*
* Ver    变更日期             负责人     变更内容
* ───────────────────────────────────
* V1.0  2016-03-10 17:07:11    黄润伟    
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
	/// Task_follow:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class Task_follow
	{
		public Task_follow()
		{}
		#region Model
		private string _id;
		private string _task_id;
		private string _follow_id;
		private DateTime? _follow_time;
		private string _follow_content;
		private int? _follow_status;
		
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
		public string task_id
		{
			set{ _task_id=value;}
			get{return _task_id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string follow_id
		{
			set{ _follow_id=value;}
			get{return _follow_id;}
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
		public string follow_content
		{
			set{ _follow_content=value;}
			get{return _follow_content;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? follow_status
		{
			set{ _follow_status=value;}
			get{return _follow_status;}
		}
		
		#endregion Model

	}
}

