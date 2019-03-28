<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>


 								<c:choose>
                                	<c:when test="${not empty memberList }">
                                		<thead>
		                                    <tr>
		                                        <th>글번호</th>
		                                        <th>제목</th>
		                                        <th>아이디</th>
		                                        <th>날짜</th>
		                                        <th>조회수</th>

		                                    </tr>
		                                </thead>
		                                <tbody>
                                		<c:forEach items="${memberList }" var="member">
	                                				<tr class="boardView" style="cursor:pointer">
				                                        <td class="boardFreeNo">${member.get("FREENO")}</td>
				                                        <td>${member.get("FREETITLE")}</td>
				                                        <td class="boardViewId">${member.get("MEMBERID")}</td>
				                                        <td>${member.get("FREEDATE")}</td>
				                                        <td>${member.get("FREEVIEWS")}</td>
				                                    </tr>
                                		</c:forEach>
                                			<tr>
                                				<td colspan="7">${memberPageBar }</td>
                                			</tr>
                                		</tbody>
                                	</c:when>
                                	<c:otherwise>

											<tr>
												<th>회원정보가 없습니다.</th>
											</tr>

										</tbody>
									</c:otherwise>
                                </c:choose>