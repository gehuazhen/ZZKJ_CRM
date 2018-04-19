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
namespace XHD.Model
{
	/// <summary>
	/// Personal_queckmenu:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class Personal_queckmenu
	{
		public Personal_queckmenu()
		{}
		#region Model
		private string _user_id;
		private string _menu_id;
		/// <summary>
		/// 
		/// </summary>
		public string user_id
		{
			set{ _user_id=value;}
			get{return _user_id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string menu_id
		{
			set{ _menu_id=value;}
			get{return _menu_id;}
		}
		#endregion Model

	}
}

