package com.sample.web.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

/**
 * 목록페이지를 표시할 때 필요한 정보를 표현하는 클래스다.
 * {@code List<T> items}는 화면에 표시할 데이터를 담는 멤버변수다
 * {@code Pagination paging}는 화면에 표시할 페이지 정보를 담는 멤버변수다
 * 
 * @param <T>
 *
 */
@AllArgsConstructor
@Getter
@ToString
public class ListDto<T> {
	
	private List<T> items;
	private Pagination paging;
	
}
