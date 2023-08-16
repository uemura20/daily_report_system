<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="constants.ForwardConst" %>

<c:set var="actMet" value="${ForwardConst.ACT_MET.getValue()}" />
<c:set var="commUpd" value="${ForwardConst.CMD_UPDATE.getValue()}" />

<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">

        <h2>商談 編集ページ</h2>
        <form method="POST" action="<c:url value='?action=${actMet}&command=${commUpd}' />">
            <c:import url="_form_update.jsp" />
        </form>

        <p>
            <a href="<c:url value='?action=Meeting&command=index' />">一覧に戻る</a>
        </p>
    </c:param>
</c:import>