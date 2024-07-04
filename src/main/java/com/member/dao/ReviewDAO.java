package com.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.member.domain.ReviewVO;

public interface ReviewDAO {
	
	//로그인
	/*
	 * @Select("select user_id,user_password from login where user_id=#{user_id} and user_password=#{user_password}"
	 * ) public LoginVO memberLogin(String user_id,String user_password);
	 */

	// 전체 리뷰 조회
   @Select("SELECT COUNT(*) FROM review where isReview=0 or isReview=1")
  	public int getReviewCount();
	
	// 리뷰 추가
    /*
    @Insert("INSERT INTO review (review_id, member_id, isbn, review_date, review_content, review_score) " +
            "VALUES (#{review_id}, #{member_id}, #{isbn}, #{review_date,jdbcType=DATE}, #{review_content,jdbcType=VARCHAR}, #{review_score})")
    void insertReview(ReviewVo review); */
	
    //최대값을 구해주는 메서드 작성
    @Select("select max(review_id) from review")
    public int getMaxReview();
    
    //글 작성하기
    @Insert("INSERT INTO review (review_id, member_id, isbn, review_content, review_score, isReview, ordersPrint_id) " +
            "VALUES (#{review_id}, #{member_id}, #{isbn}, #{review_content,jdbcType=VARCHAR}, #{review_score}, #{isReview}, #{ordersPrint_id})")
    void insertReview(ReviewVO review);
    
    
    // 특정 리뷰 조회
    @Select("SELECT * FROM review WHERE review_id = #{review_id}")
    List<ReviewVO> getReviewById(int review_id);

    //글 수정하기
    @Update("UPDATE review " +
            "SET review_content=#{review_content, jdbcType=VARCHAR}, " +
            "    review_score=#{review_score, jdbcType=INTEGER} " +
            "WHERE review_id=#{review_id, jdbcType=INTEGER}")
    void updateReview(ReviewVO reviewVo);
    
    //글 삭제하기
    @Delete("DELETE FROM review WHERE review_id=#{review_id, jdbcType=INTEGER}")
    void deleteReview(int review_id);
    
    // 작성 가능한 리뷰 페이징 목록
    @Select("SELECT * FROM (SELECT a.*, rownum rnum FROM "
            + "(SELECT * FROM review WHERE isreview = 0 ORDER BY review_id DESC) a) "
            + "WHERE rnum >= #{start} AND rnum <= #{end}")
    List<ReviewVO> getReviewListNotReviewed(Map<String, Object> map);
    
//    // 작성 가능한 리뷰 갯수
//    @Select("SELECT count(*) FROM (SELECT a.*, rownum rnum FROM "
//            + "(SELECT * FROM review WHERE isreview = 0 ORDER BY review_id DESC) a) ")
//    List<ReviewVo> getReviewCountNotReviewed(Map<String, Object> map);

    
    // 작성한 리뷰 페이징 목록
    @Select("SELECT * FROM (SELECT a.*, rownum rnum FROM "
            + "(SELECT * FROM review WHERE isreview = 1 ORDER BY review_id DESC) a) "
            + "WHERE rnum >= #{start} AND rnum <= #{end}")
    List<ReviewVO> getReviewListReviewed(Map<String, Object> map);
    
//    // 작성한 리뷰 갯수 
//    @Select("SELECT count(*) FROM (SELECT a.*, rownum rnum FROM "
//            + "(SELECT * FROM review WHERE isreview = 1 ORDER BY review_id DESC) a) ")
//    List<ReviewVo> getReviewCountReviewed(Map<String, Object> map);
    
    //기간별 조회
    @Select("SELECT * FROM review WHERE review_date BETWEEN #{startDate, jdbcType=DATE} AND #{endDate, jdbcType=DATE}")
    List<ReviewVO> getReviewsByDateRange(Map<String, Object> dateRange);
    
//    @Select("SELECT * FROM (SELECT a.*, rownum rnum FROM "
//    		+ "(SELECT * FROM review where isreview=0 ORDER BY review_id DESC) a) "
//    		+ "WHERE rnum >= #{start} AND rnum <= #{end}")
//    List<ReviewVo> getReviewList(Map<String, Object> map);

//    // 필터 적용된 리뷰 갯수
//    @Select("select count(*) from ")
//    public int getFilterReivewCount(Map<String, Object> map);
}

