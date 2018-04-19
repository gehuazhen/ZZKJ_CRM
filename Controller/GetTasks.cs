﻿/*
* Controller.cs
*
* 功 能： N/A
* 类 名： Controller
*
* Ver    变更日期             负责人     变更内容
* ───────────────────────────────────
* V1.0  2015-06-23 18:38:21    黄润伟    
*
* Copyright (c) 2015 www.xhdcrm.com   All rights reserved.
*┌──────────────────────────────────┐
*│　版权所有：黄润伟                      　　　　　　　　　　　　　　│
*└──────────────────────────────────┘
*/

using System.Data;
using System.Text;

namespace XHD.Controller
{
    public class GetTasks
    {
        public static string GetTasksString(string Id, DataTable table)
        {
            DataRow[] rows = table.Select($"parentid = '{Id}'");

            if (rows.Length == 0) return string.Empty;

            var str = new StringBuilder();

            foreach (DataRow row in rows)
            {
                str.Append("{");
                for (int i = 0; i < row.Table.Columns.Count; i++)
                {
                    if (i != 0) str.Append(",");
                    str.Append("\"");
                    str.Append(row.Table.Columns[i].ColumnName);
                    str.Append("\":\"");
                    str.Append(row[i]);
                    str.Append("\"");
                }
                if (GetTasksString((string) row["id"], table).Length > 0)
                {
                    str.Append(",\"children\":[");
                    str.Append(GetTasksString((string) row["id"], table));
                    str.Append("]},");
                }
                else
                {
                    str.Append("},");
                }
            }
            return str[str.Length - 1] == ',' ? str.ToString(0, str.Length - 1) : str.ToString();
        }

        public static string GetDepTask(string Id, DataTable table)
        {
            DataRow[] rows = table.Select(string.Format("parentid = '{0}'", Id));

            if (rows.Length == 0) return string.Empty;
            ;
            var str = new StringBuilder();

            foreach (DataRow row in rows)
            {
                str.Append($"'{row["id"]}',");
                if (GetDepTask((string) row["id"], table).Length > 0)
                    str.Append(GetDepTask((string) row["id"], table));
            }
            return str.ToString();
        }

        public static string GetMenuTree(string id, DataTable table)
        {
            DataRow[] rows = table.Select($"parentid='{id}'");

            if (rows.Length == 0) return string.Empty;

            var str = new StringBuilder();

            foreach (DataRow row in rows)
            {
                str.Append("{");
                for (int i = 0; i < row.Table.Columns.Count; i++)
                {
                    if (i != 0) str.Append(",");
                    str.Append($"\"{row.Table.Columns[i].ColumnName}\"");
                    str.Append(":\"");
                    str.Append(row[i]);
                    str.Append("\"");
                }
                if (GetMenuTree((string)row["Menu_id"], table).Length > 0)
                {
                    str.Append(",\"children\":[");
                    str.Append(GetMenuTree((string)row["Menu_id"], table));
                    str.Append("]},");
                }
                else
                {
                    str.Append("},");
                }
            }
            return str[str.Length - 1] == ',' ? str.ToString(0, str.Length - 1) : str.ToString();
        }
    }
}