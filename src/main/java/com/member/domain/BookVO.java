package com.member.domain;

import java.sql.Date;

public class BookVO {
	private int rnum;
	private String isbn;
	private String category_id;
	private String book_name;
	private int book_price;
	private String book_author;
	private String book_publisher;
	private Date book_pubdate;
	private int book_quantity;
	private int book_discount;
	private int book_sell;
	private int book_score;
	
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public int getBook_price() {
		return book_price;
	}
	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}
	public String getBook_author() {
		return book_author;
	}
	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}
	public String getBook_publisher() {
		return book_publisher;
	}
	public void setBook_publisher(String book_publisher) {
		this.book_publisher = book_publisher;
	}
	public Date getBook_pubdate() {
		return book_pubdate;
	}
	public void setBook_pubdate(Date book_pubdate) {
		this.book_pubdate = book_pubdate;
	}
	public int getBook_quantity() {
		return book_quantity;
	}
	public void setBook_quantity(int book_quantity) {
		this.book_quantity = book_quantity;
	}
	public int getBook_discount() {
		return book_discount;
	}
	public void setBook_discount(int book_discount) {
		this.book_discount = book_discount;
	}
	public int getBook_sell() {
		return book_sell;
	}
	public void setBook_sell(int book_sell) {
		this.book_sell = book_sell;
	}
	public int getBook_score() {
		return book_score;
	}
	public void setBook_score(int book_score) {
		this.book_score = book_score;
	}
}
