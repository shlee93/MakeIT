package com.kh.makeit.common;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoggerInterceptor extends HandlerInterceptorAdapter {
   /* 
    * interceptor(필터랑 유사한 기능)
    * 필터는 클라이언트 요청 -> (이때 필터가 가로챔) 서블릿
    * 인터셉터는 클라이언트 요청 -> 디스패치 서블릿 -> (여기서 인터셉터가 가로챔) 해당 메소드
    * HandlerInterceptorAdapter를 상속해서 클래스를 구현 해당하는 메소드를 오버라이딩 처리하여 구현
    * preHandle : 컨트롤러(메소드) 호출하기 전
    * PostHandle : 컨트롤러(메소드)가 리턴하는 시점
    * afterCompetion : view처리까지 끝나고
    * 호출되는 mapping값을 등록!
    * 
    * 1. 클래스작성
    * 2. interceptor로 등록 -> 
    *      mapping값도 같이 등록 (패턴사용)
    */
   // 로그를 남겨보자 log4j 말고 slf4j를 이용해보자
   private Logger logger = LoggerFactory.getLogger(LoggerInterceptor.class);

   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      if(logger.isDebugEnabled()) {
         logger.debug("==================preHandle start==================");
         logger.debug(request.getRequestURI());
         logger.debug("---------------------------------------------------");
      }
      String msg = "";
      String loc = "";
      String view = "/WEB-INF/views/common/msg.jsp";
      
      HttpSession session=request.getSession();
      if((Map)session.getAttribute("member") == null) {
         msg = "로그인 후 이용해주세요";
         loc = "/";
         request.setAttribute("msg", msg);
         request.setAttribute("loc", loc);
         request.getRequestDispatcher(view).forward(request, response);
         return false;
      }
      return super.preHandle(request, response, handler);
   }

   @Override
   public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
         ModelAndView modelAndView) throws Exception {
      if(logger.isDebugEnabled()) {
         logger.debug("==================postHandle start==================");
         logger.debug(request.getRequestURI());
         logger.debug("----------------------------------------------------");
      }
      super.postHandle(request, response, handler, modelAndView);
   }

   @Override
   public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
         throws Exception {
      if(logger.isDebugEnabled()) {
         logger.debug("================afterCompletion start================");
         logger.debug(request.getRequestURI());
         logger.debug("-----------------------------------------------------");
      }
      super.afterCompletion(request, response, handler, ex);
   }

}