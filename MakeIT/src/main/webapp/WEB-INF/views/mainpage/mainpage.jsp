<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<<<<<<< HEAD
	
<jsp:include page="/WEB-INF/views/common/header.jsp">
=======
<jsp:include page="/WEB-INF/views/common/mainHeader.jsp">
>>>>>>> refs/remotes/origin/lsh
	<jsp:param value="HelloSpring" name="pageTitle"/>
</jsp:include>

 <div id="famousContentWrap">
        <P id="famousContentTitle">&nbsp;&nbsp;인기 컨텐츠</P>
        <div id="famousContentBody">
            <div id="famousContentLeft"></div>
            <div id="famousContentRight"></div>
            <div id="famousContent"></div>
        </div>
    </div>

    <div id="widthBar"></div>

    <div id="recentlyViewWrap">
        <p id="recentlyViewTitle">최근 본 페이지</p>

        <div id="recentlyViewBody">
            <div id="recentlyView"></div>
            <div id="recentlyViewLeft"></div>
            <div id="recentlyViewRight"></div>
        </div>
    </div>

    <div id="similarContentWrap">
        <p id="similarContentTitle">관련 페이지</p>
        <div id="similarContentBody">
            <div id="similarContent1"></div>
            <div id="similarContent2"></div>
            <div id="similarContent3"></div>
            <div id="similarContent4"></div>
            <div id="similarContent5"></div>
        </div>
    </div>

    <div id="widthBar"></div>

    <div id="rankingViewWrap">
        <div id="rankingViewTitle">랭킹</div>
        <div id="rankingViewAlign">
            <div id="rankingViewBody">
                <div id="rankingViewDiv"></div>
                <div id="rankingView"></div>
            </div>
            <div id="rankingDetailViewBody">
                <div id="rankingDetailView"></div>
            </div>
        </div>
    </div>
    
    <script>
    var checkRankingView = false;
    $('#rankingViewDiv').click(function(){
        if(checkRankingView == false){
            $('#rankingDetailViewBody').css('width','300px');
            $('#rankingDetailViewBody').css('height','350px');
            $('#rankingDetailViewBody').css('opacity','1');
            checkRankingView = true;
        }else{
            $('#rankingDetailViewBody').css('width','0px');
            $('#rankingDetailViewBody').css('height','0px');
            $('#rankingDetailViewBody').css('opacity','0');
            checkRankingView = false;
        }
    });
    </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>






