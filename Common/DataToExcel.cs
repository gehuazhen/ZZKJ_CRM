using System;
using System.Collections;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Runtime.InteropServices;
using COM.Excel;
using Excel;
using DataTable = System.Data.DataTable;

namespace XHD.Common
{
    /// <summary>
    ///     ����EXCEL�������ݱ������
    ///     Copyright (C) XHD
    /// </summary>
    public class DataToExcel
    {
        #region ����EXCEL��һ����(��ҪExcel.dll֧��)

        private DateTime afterTime; //Excel����֮��ʱ��
        private DateTime beforeTime; //Excel����֮ǰʱ��
        private int titleColorindex = 15;

        #region ����һ��Excelʾ��

        /// <summary>
        ///     ����һ��Excelʾ��
        /// </summary>
        public void CreateExcel()
        {
            var excel = new Application();
            excel.Application.Workbooks.Add(true);
            excel.Cells[1, 1] = "��1�е�1��";
            excel.Cells[1, 2] = "��1�е�2��";
            excel.Cells[2, 1] = "��2�е�1��";
            excel.Cells[2, 2] = "��2�е�2��";
            excel.Cells[3, 1] = "��3�е�1��";
            excel.Cells[3, 2] = "��3�е�2��";

            //����
            excel.ActiveWorkbook.SaveAs("./tt.xls", XlFileFormat.xlExcel9795, null, null, false, false,
                XlSaveAsAccessMode.xlNoChange, null, null, null, null, null);
            //����ʾ
            excel.Visible = true;
            //			excel.Quit();
            //			excel=null;            
            //			GC.Collect();//��������
        }

        #endregion

        #region ��DataTable�����ݵ�����ʾΪ����

        /// <summary>
        ///     ��DataTable�����ݵ�����ʾΪ����
        /// </summary>
        /// <param name="dt">Ҫ����������</param>
        /// <param name="strTitle">��������ı���</param>
        /// <param name="FilePath">�����ļ���·��</param>
        /// <returns></returns>
        public string OutputExcel(DataTable dt, string strTitle, string FilePath)
        {
            beforeTime = DateTime.Now;

            Application excel;
            _Workbook xBk;
            _Worksheet xSt;

            int rowIndex = 4;
            int colIndex = 1;

            excel = new ApplicationClass();
            xBk = excel.Workbooks.Add(true);
            xSt = (_Worksheet) xBk.ActiveSheet;

            //ȡ���б���			
            foreach (DataColumn col in dt.Columns)
            {
                colIndex++;
                excel.Cells[4, colIndex] = col.ColumnName;

                //���ñ����ʽΪ���ж���
                xSt.get_Range(excel.Cells[4, colIndex], excel.Cells[4, colIndex]).Font.Bold = true;
                xSt.get_Range(excel.Cells[4, colIndex], excel.Cells[4, colIndex]).HorizontalAlignment =
                    XlVAlign.xlVAlignCenter;
                xSt.get_Range(excel.Cells[4, colIndex], excel.Cells[4, colIndex]).Select();
                xSt.get_Range(excel.Cells[4, colIndex], excel.Cells[4, colIndex]).Interior.ColorIndex = titleColorindex;
                    //19;//����Ϊǳ��ɫ��������56��
            }


            //ȡ�ñ���е�����			
            foreach (DataRow row in dt.Rows)
            {
                rowIndex++;
                colIndex = 1;
                foreach (DataColumn col in dt.Columns)
                {
                    colIndex++;
                    if (col.DataType == Type.GetType("System.DateTime"))
                    {
                        excel.Cells[rowIndex, colIndex] =
                            (Convert.ToDateTime(row[col.ColumnName].ToString())).ToString("yyyy-MM-dd");
                        xSt.get_Range(excel.Cells[rowIndex, colIndex], excel.Cells[rowIndex, colIndex])
                            .HorizontalAlignment = XlVAlign.xlVAlignCenter; //���������͵��ֶθ�ʽΪ���ж���
                    }
                    else if (col.DataType == Type.GetType("System.String"))
                    {
                        excel.Cells[rowIndex, colIndex] = "'" + row[col.ColumnName];
                        xSt.get_Range(excel.Cells[rowIndex, colIndex], excel.Cells[rowIndex, colIndex])
                            .HorizontalAlignment = XlVAlign.xlVAlignCenter; //�����ַ��͵��ֶθ�ʽΪ���ж���
                    }
                    else
                    {
                        excel.Cells[rowIndex, colIndex] = row[col.ColumnName].ToString();
                    }
                }
            }

            //����һ���ϼ���			
            int rowSum = rowIndex + 1;
            int colSum = 2;
            excel.Cells[rowSum, 2] = "�ϼ�";
            xSt.get_Range(excel.Cells[rowSum, 2], excel.Cells[rowSum, 2]).HorizontalAlignment = XlHAlign.xlHAlignCenter;
            //����ѡ�еĲ��ֵ���ɫ			
            xSt.get_Range(excel.Cells[rowSum, colSum], excel.Cells[rowSum, colIndex]).Select();
            //xSt.get_Range(excel.Cells[rowSum,colSum],excel.Cells[rowSum,colIndex]).Interior.ColorIndex =Assistant.GetConfigInt("ColorIndex");// 1;//����Ϊǳ��ɫ��������56��

            //ȡ����������ı���			
            excel.Cells[2, 2] = strTitle;

            //������������ı����ʽ			
            xSt.get_Range(excel.Cells[2, 2], excel.Cells[2, 2]).Font.Bold = true;
            xSt.get_Range(excel.Cells[2, 2], excel.Cells[2, 2]).Font.Size = 22;

            //���ñ�����Ϊ����Ӧ���			
            xSt.get_Range(excel.Cells[4, 2], excel.Cells[rowSum, colIndex]).Select();
            xSt.get_Range(excel.Cells[4, 2], excel.Cells[rowSum, colIndex]).Columns.AutoFit();

            //������������ı���Ϊ���о���			
            xSt.get_Range(excel.Cells[2, 2], excel.Cells[2, colIndex]).Select();
            xSt.get_Range(excel.Cells[2, 2], excel.Cells[2, colIndex]).HorizontalAlignment =
                XlHAlign.xlHAlignCenterAcrossSelection;

            //���Ʊ߿�			
            xSt.get_Range(excel.Cells[4, 2], excel.Cells[rowSum, colIndex]).Borders.LineStyle = 1;
            xSt.get_Range(excel.Cells[4, 2], excel.Cells[rowSum, 2]).Borders[XlBordersIndex.xlEdgeLeft].Weight =
                XlBorderWeight.xlThick; //��������߼Ӵ�
            xSt.get_Range(excel.Cells[4, 2], excel.Cells[4, colIndex]).Borders[XlBordersIndex.xlEdgeTop].Weight =
                XlBorderWeight.xlThick; //�����ϱ��߼Ӵ�
            xSt.get_Range(excel.Cells[4, colIndex], excel.Cells[rowSum, colIndex]).Borders[XlBordersIndex.xlEdgeRight]
                .Weight = XlBorderWeight.xlThick; //�����ұ��߼Ӵ�
            xSt.get_Range(excel.Cells[rowSum, 2], excel.Cells[rowSum, colIndex]).Borders[XlBordersIndex.xlEdgeBottom]
                .Weight = XlBorderWeight.xlThick; //�����±��߼Ӵ�


            afterTime = DateTime.Now;

            //��ʾЧ��			
            //excel.Visible=true;			
            //excel.Sheets[0] = "sss";

            ClearFile(FilePath);
            string filename = DateTime.Now.ToString("yyyyMMddHHmmssff") + ".xls";
            excel.ActiveWorkbook.SaveAs(FilePath + filename, XlFileFormat.xlExcel9795, null, null, false, false,
                XlSaveAsAccessMode.xlNoChange, null, null, null, null, null);

            //wkbNew.SaveAs strBookName;
            //excel.Save(strExcelFileName);

            #region  ����Excel����

            //��Ҫ��Excel��DCOM�����������:dcomcnfg


            //excel.Quit();
            //excel=null;            

            xBk.Close(null, null, null);
            excel.Workbooks.Close();
            excel.Quit();


            //ע�⣺�����õ�������Excel����Ҫִ����������������������Excel����
            //			if(rng != null)
            //			{
            //				System.Runtime.InteropServices.Marshal.ReleaseComObject(rng);
            //				rng = null;
            //			}
            //			if(tb != null)
            //			{
            //				System.Runtime.InteropServices.Marshal.ReleaseComObject(tb);
            //				tb = null;
            //			}
            if (xSt != null)
            {
                Marshal.ReleaseComObject(xSt);
                xSt = null;
            }
            if (xBk != null)
            {
                Marshal.ReleaseComObject(xBk);
                xBk = null;
            }
            if (excel != null)
            {
                Marshal.ReleaseComObject(excel);
                excel = null;
            }
            GC.Collect(); //��������

            #endregion

            return filename;
        }

        #endregion

        #region Kill Excel����

        /// <summary>
        ///     ����Excel����
        /// </summary>
        public void KillExcelProcess()
        {
            Process[] myProcesses;
            DateTime startTime;
            myProcesses = Process.GetProcessesByName("Excel");

            //�ò���Excel����ID����ʱֻ���жϽ�������ʱ��
            foreach (Process myProcess in myProcesses)
            {
                startTime = myProcess.StartTime;
                if (startTime > beforeTime && startTime < afterTime)
                {
                    myProcess.Kill();
                }
            }
        }

        #endregion

        /// <summary>
        ///     ���ⱳ��ɫ
        /// </summary>
        public int TitleColorIndex
        {
            set { titleColorindex = value; }
            get { return titleColorindex; }
        }

        #endregion

        #region ��DataTable�����ݵ�����ʾΪ����(��ʹ��Excel����ʹ��COM.Excel)

        #region ʹ��ʾ��

        /*ʹ��ʾ����
		 * DataSet ds=(DataSet)Session["AdBrowseHitDayList"];
			string ExcelFolder=Assistant.GetConfigString("ExcelFolder");
			string FilePath=Server.MapPath(".")+"\\"+ExcelFolder+"\\";
			
			//�����е����Ķ�Ӧ��
			Hashtable nameList = new Hashtable();
			nameList.Add("ADID", "������");
			nameList.Add("ADName", "�������");
			nameList.Add("year", "��");
			nameList.Add("month", "��");
			nameList.Add("browsum", "��ʾ��");
			nameList.Add("hitsum", "�����");
			nameList.Add("BrowsinglIP", "����IP��ʾ");
			nameList.Add("HitsinglIP", "����IP���");
			//����excel����
			DataToExcel dte=new DataToExcel();
			string filename="";
			try
			{			
				if(ds.Tables[0].Rows.Count>0)
				{
					filename=dte.DataExcel(ds.Tables[0],"����",FilePath,nameList);
				}
			}
			catch
			{
				//dte.KillExcelProcess();
			}
			
			if(filename!="")
			{
				Response.Redirect(ExcelFolder+"\\"+filename,true);
			}
		 * 
		 * */

        #endregion

        /// <summary>
        ///     ��DataTable�����ݵ�����ʾΪ����(��ʹ��Excel����)
        /// </summary>
        /// <param name="dt">����DataTable</param>
        /// <param name="strTitle">����</param>
        /// <param name="FilePath">�����ļ���·��</param>
        /// <param name="nameList"></param>
        /// <returns></returns>
        public string DataExcel(DataTable dt, string strTitle, string FilePath, Hashtable nameList)
        {
            var excel = new cExcelFile();
            ClearFile(FilePath);
            string filename = DateTime.Now.ToString("yyyyMMddHHmmssff") + ".xls";
            excel.CreateFile(FilePath + filename);
            excel.PrintGridLines = false;

            var mt1 = cExcelFile.MarginTypes.xlsTopMargin;
            var mt2 = cExcelFile.MarginTypes.xlsLeftMargin;
            var mt3 = cExcelFile.MarginTypes.xlsRightMargin;
            var mt4 = cExcelFile.MarginTypes.xlsBottomMargin;

            double height = 1.5;
            excel.SetMargin(ref mt1, ref height);
            excel.SetMargin(ref mt2, ref height);
            excel.SetMargin(ref mt3, ref height);
            excel.SetMargin(ref mt4, ref height);

            var ff = cExcelFile.FontFormatting.xlsNoFormat;
            string font = "����";
            short fontsize = 9;
            excel.SetFont(ref font, ref fontsize, ref ff);

            byte b1 = 1,
                b2 = 12;
            short s3 = 12;
            excel.SetColumnWidth(ref b1, ref b2, ref s3);

            string header = "ҳü";
            string footer = "ҳ��";
            excel.SetHeader(ref header);
            excel.SetFooter(ref footer);


            var vt = cExcelFile.ValueTypes.xlsText;
            var cf = cExcelFile.CellFont.xlsFont0;
            var ca = cExcelFile.CellAlignment.xlsCentreAlign;
            var chl = cExcelFile.CellHiddenLocked.xlsNormal;

            // �������
            int cellformat = 1;
            //			int rowindex = 1,colindex = 3;					
            //			object title = (object)strTitle;
            //			excel.WriteValue(ref vt, ref cf, ref ca, ref chl,ref rowindex,ref colindex,ref title,ref cellformat);

            int rowIndex = 1; //��ʼ��
            int colIndex = 0;


            //ȡ���б���				
            foreach (DataColumn colhead in dt.Columns)
            {
                colIndex++;
                string name = colhead.ColumnName.Trim();
                object namestr = name;
                IDictionaryEnumerator Enum = nameList.GetEnumerator();
                while (Enum.MoveNext())
                {
                    if (Enum.Key.ToString().Trim() == name)
                    {
                        namestr = Enum.Value;
                    }
                }
                excel.WriteValue(ref vt, ref cf, ref ca, ref chl, ref rowIndex, ref colIndex, ref namestr,
                    ref cellformat);
            }

            //ȡ�ñ���е�����			
            foreach (DataRow row in dt.Rows)
            {
                rowIndex++;
                colIndex = 0;
                foreach (DataColumn col in dt.Columns)
                {
                    colIndex++;
                    if (col.DataType == Type.GetType("System.DateTime"))
                    {
                        object str = (Convert.ToDateTime(row[col.ColumnName].ToString())).ToString("yyyy-MM-dd");
                        ;
                        excel.WriteValue(ref vt, ref cf, ref ca, ref chl, ref rowIndex, ref colIndex, ref str,
                            ref cellformat);
                    }
                    else
                    {
                        object str = row[col.ColumnName].ToString();
                        excel.WriteValue(ref vt, ref cf, ref ca, ref chl, ref rowIndex, ref colIndex, ref str,
                            ref cellformat);
                    }
                }
            }
            int ret = excel.CloseFile();

            //			if(ret!=0)
            //			{
            //				//MessageBox.Show(this,"Error!");
            //			}
            //			else
            //			{
            //				//MessageBox.Show(this,"����ļ�c:\\test.xls!");
            //			}
            return filename;
        }

        #endregion

        #region  �����ʱ��Excel�ļ�

        private void ClearFile(string FilePath)
        {
            String[] Files = Directory.GetFiles(FilePath);
            if (Files.Length > 10)
            {
                for (int i = 0; i < 10; i++)
                {
                    try
                    {
                        File.Delete(Files[i]);
                    }
                    catch
                    {
                    }
                }
            }
        }

        #endregion
    }
}