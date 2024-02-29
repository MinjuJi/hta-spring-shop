package com.sample.web.form;

import org.springframework.web.multipart.MultipartFile;

import com.sample.vo.Product;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductCreateForm {
	
	private int companyNo;
	private String name;
	private int price;
	private int stock;
	private MultipartFile photofile; // Spring MVC는 첨부파일 업로드를 지원하는 MultiFile 객체를 지원한다.
	private String description;
}
