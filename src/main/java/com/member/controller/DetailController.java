package com.member.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.member.dao.BookCategoryDAO;
import com.member.dao.BookDAO;
import com.member.domain.BookCategoryVO;
import com.member.domain.BookVO;
import com.member.domain.ReviewVO;

@Controller
public class DetailController {

    private Logger log = Logger.getLogger(this.getClass());

    @Autowired
    private BookDAO bookDAO;

    @Autowired
    private BookCategoryDAO bookCategoryDAO;

    @Autowired
    private ServletContext servletContext;

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public ModelAndView detailprocess(@RequestParam("isbn") String isbn) {
        if (log.isDebugEnabled()) {
            log.debug("bookDAO=" + bookDAO);
        }

        // ISBN을 사용하여 해당 책의 카테고리 ID를 가져옴
        String category_id = bookDAO.getCategoryIdByIsbn(isbn);

        String contentRelativePath = "/book_contents/" + category_id + "/" + isbn + "_content.txt";
        String infoRelativePath = "/book_infos/" + category_id + "/" + isbn + "_info.txt";

        String contentAbsolutePath = servletContext.getRealPath(contentRelativePath);
        String infoAbsolutePath = servletContext.getRealPath(infoRelativePath);

        // 책 목차
        StringBuilder contentBuilder = new StringBuilder();
        try {
            File contentFile = new File(contentAbsolutePath);
            BufferedReader contentReader = new BufferedReader(new FileReader(contentFile));
            String contentLine;
            while ((contentLine = contentReader.readLine()) != null) {
                contentBuilder.append(contentLine).append("<br/>");
            }
            contentReader.close();
        } catch (IOException e) {
            contentBuilder.append("이 책은 목차가 없습니다.");
        }

        // 책 내용
        StringBuilder infoBuilder = new StringBuilder();
        try {
            File infoFile = new File(infoAbsolutePath);
            BufferedReader infoReader = new BufferedReader(new FileReader(infoFile));
            String infoLine;
            while ((infoLine = infoReader.readLine()) != null) {
                infoBuilder.append(infoLine).append("<br/>");
            }
            infoReader.close();
        } catch (IOException e) {
            infoBuilder.append("이 책에 대한 정보가 없습니다.");
        }

        BookVO onebook = bookDAO.getOneBook(isbn);
        List<ReviewVO> reviews = bookDAO.getDetailReviewsByIsbn(isbn);

        // 카테고리 정보 추가
        BookCategoryVO categoryInfo = bookCategoryDAO.getCategoryMainAndSubByIsbn(isbn);
        log.debug("categoryInfo=" + categoryInfo);
        String category_main = null;
        String category_sub = null;
        if (categoryInfo != null) {
            category_main = categoryInfo.getCategory_main();
            category_sub = categoryInfo.getCategory_sub();
            log.debug("category_main=" + category_main);
            log.debug("category_sub=" + category_sub);
        }

        List<BookVO> detailBookList = bookDAO.getdetailbookList(category_id);

        ModelAndView mav = new ModelAndView("detail"); // JSP 파일 이름 설정 (detail.jsp)
        mav.addObject("detailBookList", detailBookList);
        mav.addObject("onebook", onebook);
        mav.addObject("content", contentBuilder.toString()); // 책 내용 전달
        mav.addObject("info", infoBuilder.toString()); // 책 정보 전달
        mav.addObject("category_main", category_main); // 카테고리 메인 전달
        mav.addObject("category_sub", category_sub); // 카테고리 서브 전달
        mav.addObject("reviews", reviews); // 리뷰 전달

        return mav;
    }
}
