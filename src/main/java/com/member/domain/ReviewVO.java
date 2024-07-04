package com.member.domain;

import java.util.Date;

public class ReviewVO {
    private int review_id;
    private String member_id;
    private String isbn;
    private Date review_date;
    private String review_content;
    private int review_score;
    private int isReview; // 새로운 필드 추가
    private long ordersPrint_id;//필드 추가
   

    public long getOrdersPrint_id() {
    	System.out.println("getOrdersPrint_id() 호출됨");
		return ordersPrint_id;
	}
    
	public void setOrdersPrint_id(long ordersPrint_id) {
		this.ordersPrint_id = ordersPrint_id;
		System.out.println("setOrdersPrint_id()호출됨");
	}

	// getters and setters
    public int getReview_id() {
        return review_id;
    }

    public void setReview_id(int review_id) {
        this.review_id = review_id;
    }

    public String getMember_id() {
    	System.out.println("getMember_id=>"+member_id);
        return member_id;
    }
    
    public void setMember_id(String member_id) {
        this.member_id = member_id;
        System.out.println("setMember_id=>"+member_id);
    }

    public String getIsbn() {
    	System.out.println("getIsbn=>"+isbn);
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
        System.out.println("setIsbn=>"+isbn);
    }

    public Date getReview_date() {
    	System.out.println("getReview_date=>"+review_date);
        return review_date;
    }

    public void setReview_date(Date review_date) {
        this.review_date = review_date;
        System.out.println("setReview_date=>"+review_date);
    }

    public String getReview_content() {
    	System.out.println("getReview_content=>"+review_content);
        return review_content;
    }

    public void setReview_content(String review_content) {
        this.review_content = review_content;
        System.out.println("setReview_content=>"+review_content);
    }

    public int getReview_score() {
    	System.out.println("getReview_score=>"+review_score);
        return review_score;
    }

    public void setReview_score(int review_score) {
        this.review_score = review_score;
        System.out.println("setReview_score=>"+review_score);
    }
    
    public int getIsReview() {
    	System.out.println("getIsReview=>"+isReview);
        return isReview;
    }

    public void setIsReview(int isReview) {
        this.isReview = isReview;
        System.out.println("setIsReview=>"+isReview);
    }

    @Override
    public String toString() {
    	// TODO Auto-generated method stub
    	return "review_id="+review_id + "member_id="+member_id +"isbn="+isbn
    			+"review_date="+review_date+"review_content="+review_content
    			+"review_score="+review_score+"isReview="+isReview+"ordersPrint_id="+ordersPrint_id;
    			   
    			   
    				
    }
	
//    public String getBook_name() {
//    	System.out.println("getBook_name=>"+book_name);
//        return book_name;
//    }
//
//    public void setBook_name(String book_name) {
//        this.book_name = book_name;
//        System.out.println("setBook_name=>"+book_name);
//    }
}