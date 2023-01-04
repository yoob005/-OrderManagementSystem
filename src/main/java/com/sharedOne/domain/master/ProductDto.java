package com.sharedOne.domain.master;

import java.time.LocalDate;

import lombok.Data;

@Data
public class ProductDto {
	
	//productCode, productName, productType, weight, size, price, unit, content, inserted
	private String productCode;
	private String productName;
	private String productType;
	private int weight;
	private int size;
	private int price;
	private String unit;
	private String content;
	private LocalDate inserted;
}
