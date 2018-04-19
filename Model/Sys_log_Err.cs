﻿/*
* Sys_log_Err.cs
*
* 功 能： N/A
* 类 名： Sys_log_Err
*
* Ver    变更日期             负责人     变更内容
* ───────────────────────────────────
* V1.0  2015-11-01 12:44:11    黄润伟    
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
    /// Sys_log_Err:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class Sys_log_Err
    {
        public Sys_log_Err()
        { }
        #region Model
        private string _id;
        private int? _err_typeid;
        private string _err_type;
        private DateTime _err_time;
        private string _err_url;
        private string _err_message;
        private string _err_source;
        private string _err_trace;
        private string _err_emp_id;
        private string _err_emp_name;
        private string _err_ip;
        
        /// <summary>
        /// 
        /// </summary>
        public string id
        {
            set { _id = value; }
            get { return _id; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? Err_typeid
        {
            set { _err_typeid = value; }
            get { return _err_typeid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Err_type
        {
            set { _err_type = value; }
            get { return _err_type; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime Err_time
        {
            set { _err_time = value; }
            get { return _err_time; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Err_url
        {
            set { _err_url = value; }
            get { return _err_url; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Err_message
        {
            set { _err_message = value; }
            get { return _err_message; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Err_source
        {
            set { _err_source = value; }
            get { return _err_source; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Err_trace
        {
            set { _err_trace = value; }
            get { return _err_trace; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Err_emp_id
        {
            set { _err_emp_id = value; }
            get { return _err_emp_id; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Err_emp_name
        {
            set { _err_emp_name = value; }
            get { return _err_emp_name; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Err_ip
        {
            set { _err_ip = value; }
            get { return _err_ip; }
        }
        
        #endregion Model

    }
}

