<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="constants.AttributeConst" %>

<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>

    </div>
</c:if>
<fmt:parseDate value="${meeting.meetingDate}" pattern="yyyy-MM-dd" var="meetingDay" type="date" />
<label for="${AttributeConst.MET_DATE.getValue()}">日付</label><br />
<input type="date" name="${AttributeConst.MET_DATE.getValue()}" id="${AttributeConst.MET_DATE.getValue()}" value="<fmt:formatDate value='${meetingDay}' pattern='yyyy-MM-dd' />" />
<br /><br />

<label>氏名</label><br />
<c:out value="${sessionScope.login_employee.name}" />
<br /><br />

<label for="${AttributeConst.MET_TITLE.getValue()}">タイトル</label><br />
<input type="text" name="${AttributeConst.MET_TITLE.getValue()}" id="${AttributeConst.MET_TITLE.getValue()}" value="${meeting.title}" />
<br /><br />

<label for="${AttributeConst.MET_CONTENT.getValue()}">内容</label><br />
<textarea  name="${AttributeConst.MET_CONTENT.getValue()}" id="${AttributeConst.MET_CONTENT.getValue()}" rows="10" cols="50">${meeting.meetingContent}</textarea>
<br /><br />
<input type="hidden" name="${AttributeConst.MET_ID.getValue()}" value="${meeting.id}" />
<input type="hidden" name="${AttributeConst.TOKEN.getValue()}" value="${_token}" />
<button type="submit">投稿</button>