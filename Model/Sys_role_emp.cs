/*
* Sys_role_emp.cs
*
* 功 能： N/A
* 类 名： Sys_role_emp
*
* Ver    变更日期             负责人     变更内容
* ───────────────────────────────────
* V1.0  2016-02-03 14:16:18    黄润伟    
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
	/// Sys_role_emp:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class Sys_role_emp
	{
		public Sys_role_emp()
		{}
		#region Model
		private string _roleid;
		private string _empid;
		
		/// <summary>
		/// 
		/// </summary>
		public string RoleID
		{
			set{ _roleid=value;}
			get{return _roleid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string empID
		{
			set{ _empid=value;}
			get{return _empid;}
		}
		
		#endregion Model

	}
}

