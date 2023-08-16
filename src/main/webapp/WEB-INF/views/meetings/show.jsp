<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="constants.ForwardConst" %>

<c:set var="actMet" value="${ForwardConst.ACT_MET.getValue()}" />
<c:set var="commIdx" value="${ForwardConst.CMD_INDEX.getValue()}" />
<c:set var="commEdt" value="${ForwardConst.CMD_EDIT.getValue()}" />

<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">

        <h2>商談 詳細ページ</h2>

        <table>
            <tbody>
                <tr>
                    <th>氏名</th>
                    <td><c:out value="${meeting.employee.name}" /></td>
                </tr>
                <tr>
                    <th>日付</th>
                    <fmt:parseDate value="${meeting.meetingDate}" pattern="yyyy-MM-dd" var="meetingDay" type="date" />
                    <td><fmt:formatDate value='${meetingDay}' pattern='yyyy-MM-dd' /></td>
                </tr>
                <tr>
                    <th>会社名</th>
                    <td><pre><c:out value="${meeting.company_name}" /></pre></td>
                </tr>
                <tr>
                    <th>お客様名</th>
                    <td><pre><c:out value="${meeting.customer_name}" /></pre></td>
                </tr>
                <tr>
                    <th>内容</th>
                    <td><pre><c:out value="${meeting.meeting_content}" /></pre></td>
                </tr>
                <tr>
                    <th>進捗状況</th>
                    <td><pre><c:out value="${meeting.status}" /></pre></td>
                </tr>
                <tr>
                    <th>登録日時</th>
                    <fmt:parseDate value="${meeting.createdAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="createDay" type="date" />
                    <td><fmt:formatDate value="${createDay}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                </tr>
                <tr>
                    <th>更新日時</th>
                    <fmt:parseDate value="${meeting.updatedAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="updateDay" type="date" />
                    <td><fmt:formatDate value="${updateDay}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                </tr>
            </tbody>
        </table>

        <c:if test="${sessionScope.login_employee.id == meeting.employee.id}">
            <p>
                <a href="<c:url value='?action=${actMet}&command=${commEdt}&id=${meeting.id}' />">この商談を編集する</a>
            </p>
        </c:if>

        <p>
            <a href="<c:url value='?action=${actMet}&command=${commIdx}' />">一覧に戻る</a>
        </p>
    </c:param>
</c:import>