package com.z.hong.exam.utils;

import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFCell;
import org.apache.poi.xssf.streaming.SXSSFRow;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFRichTextString;

import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName ExcelUtils
 * @Description: 文件导出公共工具
 * @author      : 蔡镇宇czy
 * @Version V1.0
 **/
public class BigExportExcelUtil {

    // 显示的导出表的标题
    private String title;
    // 导出表的列名
    private String[] rowName;

    private List<Object[]> dataList = new ArrayList<Object[]>();


    // 构造方法，传入要导出的数据
    public BigExportExcelUtil(String title, String[] rowName, List<Object[]> dataList) {
        this.dataList = dataList;
        this.rowName = rowName;
        this.title = title;
    }

    /*
     * 导出数据
     */
    public void export(OutputStream out,String[] data) throws Exception {
        try {
            SXSSFWorkbook workbook = new SXSSFWorkbook(); // 创建工作簿对象
            int count=1;
            int datalength=dataList.size();
            int index=0;
            int everyLen=160000;
            if(datalength>everyLen) count=(int)Math.ceil(datalength/(everyLen*1.0));
            for(int m=1;m<=count;m++) {
                SXSSFSheet sheet = workbook.createSheet("0" + m + title);// 创建工作表
                sheet.setDefaultColumnWidth(30);
                // 产生表格标题行
                SXSSFRow rowm = sheet.createRow(0);

                SXSSFCell cellTiltle = rowm.createCell(0);

                // sheet样式定义【getColumnTopStyle()/getStyle()均为自定义方法 - 在下面 - 可扩展】
                CellStyle columnTopStyle = this.getColumnTopStyle(workbook);// 获取列头样式对象
                CellStyle style = this.getStyle(workbook); // 单元格样式对象

                sheet.addMergedRegion(new CellRangeAddress(0, 1, 0,
                        (rowName.length - 1)));
                cellTiltle.setCellStyle(columnTopStyle);
                cellTiltle.setCellValue(title);

                // 定义所需列数
                int columnNum = rowName.length;
                SXSSFRow rowRowName = sheet.createRow(2); // 在索引2的位置创建行(最顶端的行开始的第二行)

                // 将列头设置到sheet的单元格中
                for (int n = 0; n < columnNum; n++) {
                    SXSSFCell cellRowName = rowRowName.createCell(n); // 创建列头对应个数的单元格
                    cellRowName.setCellType(HSSFCell.CELL_TYPE_STRING); // 设置列头单元格的数据类型
                    XSSFRichTextString text = new XSSFRichTextString(rowName[n]);
                    cellRowName.setCellValue(text); // 设置列头单元格的值
                    cellRowName.setCellStyle(columnTopStyle); // 设置列头单元格样式
                }

                // 将查询出的数据设置到sheet对应的单元格中
                for (int len=0; index < everyLen*m&&index<datalength; index++) {

                    Object[] obj = dataList.get(index);// 遍历每个对象

                    SXSSFRow row = sheet.createRow(len + 3);// 创建所需的行数
                    len++;
                    for (int j = 0; j < obj.length; j++) {

                        SXSSFCell cell = null; // 设置单元格的数据类型
                        if (j == 0) {
                            cell = row.createCell(j, HSSFCell.CELL_TYPE_NUMERIC);
                            if(obj[j]==null){
                                cell.setCellValue("");
                            }else {
                                cell.setCellValue(obj[j].toString());
                            }
                        } else {
                            cell = row.createCell(j, HSSFCell.CELL_TYPE_STRING);
                            if (obj[j] != null) {

                                cell.setCellValue(obj[j].toString()); // 设置单元格的值
                            }
                        }
                        cell.setCellStyle(style); // 设置单元格样式
                    }
                }
                // 产生表格标题行
                for(int i=0;i<data.length;i++){
                    SXSSFRow rown = sheet.createRow(dataList.size()+5+i);
                    SXSSFCell cellFinish = rown.createCell(0);
                    cellFinish.setCellStyle(columnTopStyle);
                    cellFinish.setCellValue(data[i]);
                }
//                // 让列宽随着导出的列长自动适应
//                for (int colNum = 0; colNum < columnNum; colNum++) {
//                    int columnWidth = sheet.getColumnWidth(colNum) / 256;
//                    for (int rowNum = 0; rowNum < sheet.getLastRowNum(); rowNum++) {
//                        SXSSFRow currentRow;
//                        // 当前行未被使用过
//                        if (sheet.getRow(rowNum) == null) {
//                            currentRow = sheet.createRow(rowNum);
//                        } else {
//                            currentRow = sheet.getRow(rowNum);
//                        }
//                        if (currentRow.getCell(colNum) != null) {
//                            SXSSFCell currentCell = currentRow.getCell(colNum);
//                            if (currentCell.getCellType() == HSSFCell.CELL_TYPE_STRING) {
//                                String cellvalue = currentCell.getStringCellValue();
//                                int length = cellvalue
//                                        .getBytes().length;
//                                if (columnWidth < length) {
//                                    columnWidth = length;
//                                }
//                            }
//                        }
//                    }
//                    if (colNum == 0) {
//                        sheet.setColumnWidth(colNum, (columnWidth - 2) * 256);
//                    } else {
//                        sheet.setColumnWidth(colNum, (columnWidth + 4) * 256);
//                    }
//                }
            }
            workbook.write(out);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /*
     * 列头单元格样式
     */
    public CellStyle getColumnTopStyle(SXSSFWorkbook workbook) {

        // 设置字体
        Font font = workbook.createFont();
        // 设置字体大小
        font.setFontHeightInPoints((short) 11);
        // 字体加粗
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        // 设置字体名字
        font.setFontName("Courier New");
        // 设置样式;
        CellStyle style = workbook.createCellStyle();
        // 设置底边框;
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        // 设置底边框颜色;
        style.setBottomBorderColor(HSSFColor.BLACK.index);
        // 设置左边框;
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        // 设置左边框颜色;
        style.setLeftBorderColor(HSSFColor.BLACK.index);
        // 设置右边框;
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        // 设置右边框颜色;
        style.setRightBorderColor(HSSFColor.BLACK.index);
        // 设置顶边框;
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        // 设置顶边框颜色;
        style.setTopBorderColor(HSSFColor.BLACK.index);
        // 在样式用应用设置的字体;
        style.setFont(font);
        // 设置自动换行;
        style.setWrapText(false);
        // 设置水平对齐的样式为居中对齐;
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        // 设置垂直对齐的样式为居中对齐;
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);

        return style;

    }

    /*
     * 列数据信息单元格样式
     */
    public CellStyle getStyle(SXSSFWorkbook workbook) {
        // 设置字体
        Font font = workbook.createFont();
        // 设置字体大小
        // font.setFontHeightInPoints((short)10);
        // 字体加粗
        // font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        // 设置字体名字
        font.setFontName("Courier New");
        // 设置样式;
        CellStyle style = workbook.createCellStyle();
        // 设置底边框;
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        // 设置底边框颜色;
        style.setBottomBorderColor(HSSFColor.BLACK.index);
        // 设置左边框;
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        // 设置左边框颜色;
        style.setLeftBorderColor(HSSFColor.BLACK.index);
        // 设置右边框;
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        // 设置右边框颜色;
        style.setRightBorderColor(HSSFColor.BLACK.index);
        // 设置顶边框;
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        // 设置顶边框颜色;
        style.setTopBorderColor(HSSFColor.BLACK.index);
        // 在样式用应用设置的字体;
        style.setFont(font);
        // 设置自动换行;
        style.setWrapText(false);
        // 设置水平对齐的样式为居中对齐;
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        // 设置垂直对齐的样式为居中对齐;
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);

        return style;

    }
}