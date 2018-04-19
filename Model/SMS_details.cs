/*
* SMS_details.cs
*
* 功 能： N/A
* 类 名： SMS_details
*
* Ver    变更日期             负责人     变更内容
* ───────────────────────────────────
* V1.0  2017/3/14 13:25:46   黄润伟    
*
* Copyright © 2015 www.xhdcrm.com All rights reserved.
__  ___   _ ____   ____ ____  __  __ 
\ \/ / | | |  _ \ / ___|  _ \|  \/  |
 \  /| |_| | | | | |   | |_) | |\/| |
 /  \|  _  | |_| | |___|  _ <| |  | |
/_/\_\_| |_|____/ \____|_| \_\_|  |_|
*/
using System;
namespace XHD.Model
{
    /// <summary>
    /// SMS_details:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class SMS_details
    {
        public SMS_details()
        { }
        #region Model
        private string _sms_id;
        private string _contact_id;
        private string _mobiles;
        
        /// <summary>
        /// 
        /// </summary>
        public string sms_id
        {
            set { _sms_id = value; }
            get { return _sms_id; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string contact_id
        {
            set { _contact_id = value; }
            get { return _contact_id; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string mobiles
        {
            set { _mobiles = value; }
            get { return _mobiles; }
        }
      
        #endregion Model

    }
}

