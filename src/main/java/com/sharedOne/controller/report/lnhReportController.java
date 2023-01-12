/*package com.sharedOne.controller.report;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;

import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharedOne.domain.master.ProductDto;
import com.sharedOne.domain.order.OrderHeaderDto;
import com.sharedOne.domain.order.OrderItemDto;
import com.sharedOne.domain.report.OrderReportDto;
import com.sharedOne.domain.report.PageInfo;
import com.sharedOne.domain.report.ReportDto;
import com.sharedOne.service.master.lnhProductService;
import com.sharedOne.service.report.HmsReportService;
import com.sharedOne.service.report.lnhReportService;

@Controller
@RequestMapping("report")
public class lnhReportController {

	@Autowired
	private lnhProductService productService;
	
	@Autowired
	private lnhReportService service;
	
	@Autowired
	private HmsReportService hmsService;
	
	@GetMapping("monthlyReport")
	public void getMontlyReport(@RequestParam(name = "orderQ", defaultValue = "") String orderQ, 
								@RequestParam(name = "orderS", defaultValue = "") String orderS,
								
								@RequestParam(name = "productCode", defaultValue = "") String productCode, 
								@RequestParam(name = "productName", defaultValue = "") String productName,
								@RequestParam(name = "productType", defaultValue = "") String productType, 
								@RequestParam(name = "size", defaultValue = "") String size,
								
								@RequestParam(name = "startDateTime", defaultValue = "0001-01-01") String startDateTime,
								@RequestParam(name = "endDateTime", defaultValue = "9999-12-31") String endDateTime,
								
								@RequestParam(name = "productQ", defaultValue = "") String productQ,
								@RequestParam(name = "productS", defaultValue = "") String productS,
								
								@RequestParam(name = "Today", defaultValue = "") String Today,
								@RequestParam(name = "1Week", defaultValue = "") String Week,
								@RequestParam(name = "15Day", defaultValue = "") String Fifteen_Day,
								@RequestParam(name = "1Month", defaultValue = "") String One_Month,
								@RequestParam(name = "3Month", defaultValue = "") String Three_Month,
								@RequestParam(name = "1Year", defaultValue = "") String One_Year,
								
								@RequestParam(name = "page", defaultValue = "1") int page, 
								PageInfo pageInfo, 
								Model model) {
		
		// 현재 날짜 구하기
        LocalDate now = LocalDate.now();
 
        // 포맷 정의
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
 
        // 포맷 적용
        String formatedNow = now.format(formatter);
 
        // 결과 출력
        System.out.println(formatedNow);  
        
        System.out.println("AAAA");
        
		System.out.println("################" + startDateTime);
		
		//조건 검색 제품 리스트
		List <ProductDto> productList = productService.selectProductList();
		
		Set <String> setTypes = new HashSet<>();
		for( ProductDto product : productList) {
			setTypes.add(product.getProductType());
		}
		
		Set <Integer> setSizes = new HashSet<>();
		for( ProductDto product : productList) {
			setSizes.add(product.getSize());
		}
		
		model.addAttribute("types", setTypes);
		model.addAttribute("sizes", setSizes);
		model.addAttribute("productList", productList);
		
		//business logic 작동		
		List<OrderReportDto> orderList = hmsService.orderList(page, 
														      orderS, 
														      orderQ, 
														      productCode, 
														      productName, 
														      productType, 
														      size, 
														      startDateTime,
														      endDateTime,
														      Today,
														      Week,
														      Fifteen_Day,
														      One_Month,
														      Three_Month,
														      One_Year,
														      pageInfo);	
		System.out.println(orderList);
    
		// List<ProductDto> productCatalog = hmsService.productCatalog(productS, productQ); 
		
		
    // List<OrderItemDto> itemList = orderList.get(0).getOrderItem();
 
		// System.out.println("컨트롤러: " + orderList);
		// System.out.println(itemList);
		// System.out.println("월별매출"+thisYearSales);
		
		// add attribute
		// model.addAttribute("productCatalog", productCatalog); // c:forEach items = productCatalog
		// model.addAttribute("itemList", itemList);
		
		//올해 매출 그래프(디폴트)
		List<ReportDto> thisYearSales = service.thisYearSales();
		
			
			//검색 결과 리스트
			List<OrderHeaderDto> orderList = service.orderList(orderQ);
			
			//검색결과 바이어 리스트
			List<String> buyerList = new ArrayList<>();
			for (int i = 0; i < orderList.size(); i++) {
				buyerList.add(orderList.get(i).getBuyerCode());
			}
			
			Map<String, Integer> buyerSales = service.salesByBuyer(orderQ, buyerList);

		
			System.out.println("오더리스트 사이즈: " + orderList.size());
			
			  
			System.out.println("바이어 별 매출 "+buyerSales);
			 
			
			System.out.println("컨트롤러: " + orderList);

			System.out.println("월별매출"+thisYearSales);
			
			// add attribute
			model.addAttribute("orderList", orderList); // c:forEach items = orderList
			model.addAttribute("buyerSales", buyerSales);
		  model.addAttribute("thisYearSales",thisYearSales);

	}
	
	//엑셀 다운로드
	@RequestMapping("excelDown")
	@ResponseBody
	public void excelDown(HttpServletResponse response,	@RequestParam(name = "orderQ", defaultValue = "") String orderQ) throws IOException {
		
		
		 try (Workbook workbook = new XSSFWorkbook()) {
			 
			 Sheet sheet = workbook.createSheet("레포트");
			 int rowNo = 0;
			 
			 CellStyle headStyle = workbook.createCellStyle();
	            headStyle.setFillForegroundColor(HSSFColor.HSSFColorPredefined.LIGHT_BLUE.getIndex());
	            headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	            Font font = workbook.createFont();
	            font.setFontName(HSSFFont.FONT_ARIAL); // 폰트 스타일
	            font.setColor(HSSFColor.HSSFColorPredefined.WHITE.getIndex()); // 폰트 색 지정
	            font.setFontHeightInPoints((short) 13); // 폰트 크기
	            headStyle.setFont(font);
	            
	            //셀병합
				sheet.addMergedRegion(new CellRangeAddress(0, 1, 0, 11)); //첫행, 마지막행, 첫열, 마지막열 병합
				
				//테이블 셀 스타일
				CellStyle cellStyle = workbook.createCellStyle();
				sheet.setColumnWidth(0, (sheet.getColumnWidth(0))+(short)2048); // 0번째 컬럼 넓이 조절
				sheet.setColumnWidth(6, (sheet.getColumnWidth(6))+(short)2048); // 6번째 컬럼 넓이 조절
				sheet.setColumnWidth(7, (sheet.getColumnWidth(7))+(short)2048); // 7번째 컬럼 넓이 조절
				sheet.setColumnWidth(8, (sheet.getColumnWidth(8))+(short)2048); // 8번째 컬럼 넓이 조절
				cellStyle.setAlignment(HorizontalAlignment.CENTER);
				
				Font fontTitle = workbook.createFont();
				fontTitle.setColor(HSSFColor.HSSFColorPredefined.LIGHT_BLUE.getIndex());
				fontTitle.setFontName(HSSFFont.FONT_ARIAL);
				fontTitle.setBold(true);
				fontTitle.setFontHeightInPoints((short)20); // 폰트 크기
				cellStyle.setFont(fontTitle ); // cellStyle에 font를 적용
			
				// 타이틀 생성
				Row xssfRow = sheet.createRow(rowNo++); // 행 객체 추가
				Cell xssfCell = xssfRow.createCell((short) 0); // 추가한 행에 셀 객체 추가
				xssfCell.setCellStyle(cellStyle); // 셀에 스타일 지정
				xssfCell.setCellValue("레포트"); // 데이터 입력
				
				sheet.createRow(rowNo++);
				xssfRow = sheet.createRow(rowNo++);  // 빈행 추가
			 
				Row headerRow = sheet.createRow(rowNo++);
				headerRow.createCell(0).setCellValue("주문서 ID");
				headerRow.createCell(1).setCellValue("바이어코드");
				headerRow.createCell(2).setCellValue("제품코드");
				headerRow.createCell(3).setCellValue("단가");
				headerRow.createCell(4).setCellValue("수량");
				headerRow.createCell(5).setCellValue("합계");
				headerRow.createCell(6).setCellValue("등록일");
				headerRow.createCell(7).setCellValue("수정일");
				headerRow.createCell(8).setCellValue("납기일");
				headerRow.createCell(9).setCellValue("담당자");
				headerRow.createCell(10).setCellValue("상태");
				headerRow.createCell(11).setCellValue("메세지");
			 
			 for(int i=0; i<=11; i++){
	                headerRow.getCell(i).setCellStyle(headStyle);
	            }
			 
			 List<OrderHeaderDto> list = service.orderList(orderQ);
			 
			 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			  
				 for (OrderHeaderDto board1 : list) {
					 //오더 아이템이 하나만 있는 경우
					 if(board1.getOrderItem().size() ==1) {
						 Row row = sheet.createRow(rowNo++);
						 row.createCell(0).setCellValue(board1.getOrderCode());
						 row.createCell(1).setCellValue(board1.getBuyerCode());
						 row.createCell(2).setCellValue(board1.getOrderItem().get(0).getProductCode());
						 row.createCell(3).setCellValue(board1.getOrderItem().get(0).getSalePrice());
						 row.createCell(4).setCellValue(board1.getOrderItem().get(0).getQuantity());
						 row.createCell(5).setCellValue(board1.getOrderItem().get(0).getSum());

						 Date cell6 = java.sql.Date.valueOf(board1.getInserted());
						 String inserted = sdf.format(cell6);
						 row.createCell(6).setCellValue(inserted);
						 
						 Date cell7 = java.sql.Date.valueOf(board1.getModified());
						 String modified = sdf.format(cell7);
						 row.createCell(7).setCellValue(modified);
						 
						 Date cell8 = java.sql.Date.valueOf(board1.getDeliveryDate());
						 String deliveryDate = sdf.format(cell8);
						 row.createCell(8).setCellValue(deliveryDate);
						 
						 row.createCell(9).setCellValue(board1.getWriter());
						 row.createCell(10).setCellValue(board1.getStatus());
						 row.createCell(11).setCellValue(board1.getMessage());
					 }
					 //오더 아이템이 여러개 인 경우
					 if(board1.getOrderItem().size() !=1) {
						 List<OrderItemDto> itemList = new ArrayList<>();
						 
						 itemList = board1.getOrderItem();
						 for (OrderItemDto board2 : itemList) {
							 Row row = sheet.createRow(rowNo++);
							 row.createCell(0).setCellValue(board1.getOrderCode());
							 row.createCell(1).setCellValue(board1.getBuyerCode());
							 row.createCell(2).setCellValue(board2.getProductCode());
							 row.createCell(3).setCellValue(board2.getSalePrice());
							 row.createCell(4).setCellValue(board2.getQuantity());
							 row.createCell(5).setCellValue(board2.getSum());
							 Date cell6 = java.sql.Date.valueOf(board1.getInserted());
							 String inserted = sdf.format(cell6);
							 row.createCell(6).setCellValue(inserted);
							
							 Date cell7 = java.sql.Date.valueOf(board1.getModified());
							 String modified = sdf.format(cell7);
							 row.createCell(7).setCellValue(modified);
							 
							 Date cell8 = java.sql.Date.valueOf(board1.getDeliveryDate());
							 String deliveryDate = sdf.format(cell8);
							 row.createCell(8).setCellValue(deliveryDate);
							 
							 row.createCell(9).setCellValue(board1.getWriter());
							 row.createCell(10).setCellValue(board1.getStatus());
							 row.createCell(11).setCellValue(board1.getMessage());
						 }
						 
					 }
					 
				}
			 
			 
			 
			 response.setContentType("ms-vnd/excel");
			 response.setHeader("Content-Disposition", "attachment;filename=report.xls");
			 
			 workbook.write(response.getOutputStream());
			 workbook.close();
			 

			}

		}

}*/