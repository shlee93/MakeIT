package com.kh.makeit.common;

public class PageFactory {
	
	public static String getPageBar(int totalCon, int cPage, int numPerPage, String url) {
		String pageBar = "";
		int pageBarSize = 5;
		
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;
		int totalPage = (int)Math.ceil((double)totalCon/numPerPage); 
		pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
		// 이전
		if(pageNo==1) {
			pageBar+="<li class='page-item' disabled>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar+="</li>";
		} else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar+="</li>";
		}
		// 페이지 숫자
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item' active>";
				pageBar+="<a class='page-link'>"+pageNo+"</a>";
				pageBar+="</li>";
			} else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		// 다음
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item' disabled>";
			pageBar+="<a class='page-link' href='#'>다음</a>";
			pageBar+="</li>";
		} else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>다음</a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		// 페이징처리 스크립트
		pageBar+="<script>";
		pageBar+="function fn_paging(cPage)";
		pageBar+="{location.href='"+url+"?cPage='+cPage";
		pageBar+="}";
		pageBar+="</script>";
		return pageBar;
	}
	
	
	public static String getPageBarAjax(int totalCon, int cPage, int numPerPage, String url) {
		String pageBar = "";
		int pageBarSize = 5;
		
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;
		int totalPage = (int)Math.ceil((double)totalCon/numPerPage); 
		pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
		// 이전
		if(pageNo==1) {
			pageBar+="<li class='page-item' disabled>";
			pageBar+="<a class='page-link' tabindex='-1'>이전</a>";
			pageBar+="</li>";
		} else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar+="</li>";
		}
		// 페이지 숫자
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item' active>";
				pageBar+="<a class='page-link'>"+pageNo+"</a>";
				pageBar+="</li>";
			} else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+");'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		// 다음
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item' disabled>";
			pageBar+="<a class='page-link'>다음</a>";
			pageBar+="</li>";
		} else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+");'>다음</a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		// 페이징처리 스크립트
		pageBar+="<script>";
		pageBar+="function fn_paging(cPage)";
		pageBar+="{";
		pageBar+="$.ajax({";
		pageBar+="url:'"+url+"',";
		pageBar+="dataType:'html',";
		pageBar+="data:{'memberId':$('#memberId').val(),";
		pageBar+="'sellcPage':cPage,";
		pageBar+="'buycPage':cPage,";
		pageBar+="'freecPage':cPage,";
		pageBar+="'qnacPage':cPage,";
		pageBar+="'fadeStatus':$('#fadeStatus').val(),";
		pageBar+="'naviBarStatus':$('#naviBarStatus').val()},";
		pageBar+="success:function(data){";
		pageBar+="$('#ajaxHtml').html(data);";
		pageBar+="}});";
		pageBar+="};";
		pageBar+="</script>";
		return pageBar;
	}
}
