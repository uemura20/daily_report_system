<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="constants.AttributeConst" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).on("click", ".add", function() {
    $(this).parent().clone(true).insertAfter($(this).parent());
});
$(document).on("click", ".del", function() {
    var target = $(this).parent();
    if (target.parent().children().length > 1) {
        target.remove();
    }
});
</script>

<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>

    </div>
</c:if>
<fmt:parseDate value="${report.reportDate}" pattern="yyyy-MM-dd" var="reportDay" type="date" />
<label for="${AttributeConst.REP_DATE.getValue()}">日付</label><br />
<input type="date" name="${AttributeConst.REP_DATE.getValue()}" id="${AttributeConst.REP_DATE.getValue()}" value="<fmt:formatDate value='${reportDay}' pattern='yyyy-MM-dd' />" />
<br /><br />

<label>氏名</label><br />
<c:out value="${sessionScope.login_employee.name}" />
<br /><br />

<label for="${AttributeConst.REP_TITLE.getValue()}">タイトル</label><br />
<input type="text" name="${AttributeConst.REP_TITLE.getValue()}" id="${AttributeConst.REP_TITLE.getValue()}" value="${report.title}" />
<br /><br />

<label for="${AttributeConst.REP_CONTENT.getValue()}">内容</label><br />
<textarea  name="${AttributeConst.REP_CONTENT.getValue()}" id="${AttributeConst.REP_CONTENT.getValue()}" rows="10" cols="50">${report.report_content}</textarea>
<br /><br />

<div id="input_pluralBox">
    <div id="input_plural">
<br /><br />
<h1>【商談】</h1>
<br /><br />

<label for="${AttributeConst.MET_COMPANY_NAME.getValue()}">会社名</label><br />
<input type="text" name="${AttributeConst.MET_COMPANY_NAME.getValue()}" id="${AttributeConst.MET_COMPANY_NAME.getValue()}" value="${meeting.company_name}" />
<br /><br />

<label for="${AttributeConst.MET_CUSTOMER_NAME.getValue()}">お客様名</label><br />
<input type="text" name="${AttributeConst.MET_CUSTOMER_NAME.getValue()}" id="${AttributeConst.MET_CUSTOMER_NAME.getValue()}" value="${meeting.customer_name}" />
<br /><br />

<label for="${AttributeConst.MET_CONTENT.getValue()}">内容</label><br />
<textarea  name="${AttributeConst.MET_CONTENT.getValue()}" id="${AttributeConst.MET_CONTENT.getValue()}" rows="10" cols="50">${meeting.meeting_content}</textarea>
<br /><br />

<label for="${AttributeConst.MET_STATUS.getValue()}">進捗状況</label><br />
<input type="text" name="${AttributeConst.MET_STATUS.getValue()}" id="${AttributeConst.MET_STATUS.getValue()}" value="${meeting.status}" />
<br /><br />

<input type="hidden" name="${AttributeConst.MET_ID.getValue()}" value="${meeting.id}" />
        <input type="button" value="＋" class="add pluralBtn">
        <input type="button" value="－" class="del pluralBtn">
    </div>
</div>
<br /><br />


<input type="hidden" name="${AttributeConst.REP_ID.getValue()}" value="${report.id}" />
<input type="hidden" name="${AttributeConst.TOKEN.getValue()}" value="${_token}" />
<button type="submit">投稿</button>