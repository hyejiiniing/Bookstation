package com.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.member.domain.OrderVO;
import com.member.domain.OrdersPrintVO;
import com.member.domain.shippingVO;

public interface AllOrderDAO {
	
//    @Select("select * from orders1")
//    public List<ordersVO> AllOrderList();
	
    // orders 테이블에서 모든 주문 조회
    @Select("select * from ("
    		+ "select rownum rnum, orders.* from orders where member_id=#{member_id}"
    		+ "	) where rnum between #{start} and #{end}")
    public List<OrderVO> getOrders(Map<String, Object> dateRange);
    // ordersPrint 테이블에서 모든 주문 조회
    @Select("select * from ("
    		+ " select rownum rnum, ordersPrint.* from ordersPrint where member_id=#{member_id}"
    		+ "	) where rnum between #{start} and #{end}")
    public List<OrdersPrintVO> getOrdersPrint(Map<String, Object> dateRange);
    // shipping 테이블에서 모든 배송 조회
    @Select("select * from ("
    		+ "		select rownum rnum, shipping.* from shipping, orders "
    		+ "		where orders.member_id=#{member_id} and "
    		+ "		shipping.order_id=orders.order_id "
    		+ "	) where rnum between #{start} and #{end}")
    public List<shippingVO> getShipping(Map<String, Object> dateRange);
    
    // orders 테이블에서 모든 주문 개수
    @Select("select count(*) from orders where member_id=#{member_id}")
    public int getOrdersCount(String member_id);
    // ordersPrint 테이블에서 모든 주문 개수
    @Select("select count(*) from ordersPrint where member_id=#{member_id}")
    public int getOrdersPrintCount(String member_id);
    // shipping 테이블에서 모든 배송 개수
    @Select("select count(shipping.*) from shipping, orders "
    		+ "where orders.member_id=#{member_id} and "
    		+ "shipping.order_id=orders.order_id")
    public int getShippingCount(String member_id);
    
    // 날짜 조회 
    /*
    // orders 테이블에서 기간별 조회 / 오라클에 맞는 경로 이름 변경 필요 
    @Select("SELECT * FROM orders WHERE order_date BETWEEN #{startDate, jdbcType=DATE} AND #{endDate, jdbcType=DATE}")
    List<OrderVO> getOrdersByDateRange(Map<String, Object> dateRange);

    // ordersPrint 테이블에서 기간별 조회 / 오라클에 맞는 경로 이름 변경 필요 
    @Select("SELECT * FROM ordersPrint WHERE order_date BETWEEN #{startDate, jdbcType=DATE} AND #{endDate, jdbcType=DATE}")
    List<OrdersPrintVO> getOrdersPrintByDateRange(Map<String, Object> dateRange);
    
    // shipping 테이블에서 기간별 조회 / 오라클에 맞는 경로 이름 변경 필요 
    @Select("SELECT * FROM shipping WHERE ship_date BETWEEN #{startDate, jdbcType=DATE} AND #{endDate, jdbcType=DATE}")
    List<shippingVO> getShippingByDateRange(Map<String, Object> dateRange); 
    */
    
    //오라클
 // orders 테이블에서 기간별 조회
    @Select("select * from ("
    		+ "SELECT rownum rnum, ORDERS.* FROM ORDERS WHERE member_id=#{member_id} "
    		+ "and ORDER_DATE BETWEEN #{startDate, jdbcType=DATE} AND #{endDate, jdbcType=DATE} "
    		+ "	) where rnum between #{start} and #{end}")
    List<OrderVO> getOrdersByDateRange(Map<String, Object> dateRange);

    // ordersPrint 테이블에서 기간별 조회 / 오라클에 맞는 경로 이름 변경 필요 
    @Select("select * from ("
    		+ "SELECT rownum rnum, ORDERSPRINT.* FROM ORDERSPRINT WHERE member_id=#{member_id}"
    		+ " and ORDER_DATE BETWEEN #{startDate, jdbcType=DATE} AND #{endDate, jdbcType=DATE}"
    		+ " 	) where rnum between #{start} and #{end}")
    List<OrdersPrintVO> getOrdersPrintByDateRange(Map<String, Object> dateRange);

    // shipping 테이블에서 기간별 조회 / 오라클에 맞는 경로 이름 변경 필요 
    @Select("select * from ("
    		+ "SELECT rownum rnum, SHIPPING.* FROM SHIPPING WHERE member_id=#{member_id}"
    		+ " and SHIP_DATE BETWEEN #{startDate, jdbcType=DATE} AND #{endDate, jdbcType=DATE}"
    		+ "	) where rnum between #{start} and #{end}")
    List<shippingVO> getShippingByDateRange(Map<String, Object> dateRange);
}
	