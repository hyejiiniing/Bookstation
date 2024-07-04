package com.member.domain;

public class CartVO {
    
    private long cart_id;
    private String member_id;
    private String isbn;
    private int bookCount; 
    private String book_name;
    private int book_price;
    private int book_discount;
   
    public long getCart_id() {
        return cart_id;
    }
    public void setCart_id(long cart_id) {
        this.cart_id = cart_id;
    }
    public String getMember_id() {
        return member_id;
    }
    public void setMember_id(String member_id) {
        this.member_id = member_id;
    }
    public String getIsbn() {
        return isbn;
    }
    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }
    public int getBookCount() {
        return bookCount;
    }
    public void setBookCount(int bookCount) {
        this.bookCount = bookCount;
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
	public int getBook_discount() {
		return book_discount;
	}
	public void setBook_discount(int book_discount) {
		this.book_discount = book_discount;
	}
	
    @Override
    public String toString() {
        return "CartVO [cart_id=" + cart_id + ", member_id=" + member_id + ", isbn=" + isbn 
                            + ", bookCount=" + bookCount + "]";
    }
}
