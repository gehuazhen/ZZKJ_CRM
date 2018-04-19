/*
* C_Sys_info.cs
*
* 功 能： N/A
* 类 名： C_Sys_info
*
* Ver    变更日期             负责人     变更内容
* ───────────────────────────────────
* V1.0  2016-02-03 14:16:17    黄润伟    
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
	/// C_Sys_info:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class Sys_info
	{
		public Sys_info()
		{}
		#region Model		
		private string _sys_key;
		private string _sys_value;
		
		/// <summary>
		/// 
		/// </summary>
		public string sys_key
		{
			set{ _sys_key=value;}
			get{return _sys_key;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string sys_value
		{
			set{ _sys_value=value;}
			get{return _sys_value;}
		}
		#endregion Model

	}
}

