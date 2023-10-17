<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="constants.ForwardConst" %>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.0/js/jquery.tablesorter.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.0/css/theme.default.min.css">

<script>
const checkbox3 = document.getElementsByClassName('checks')

function checkAllBox(trueOrFalse) {
  for(i = 0; i < checkbox3.length; i++) {
    checkbox3[i].checked = trueOrFalse
  }
}

function getValue() {
    var checks = document.getElementsByClassName('checks');
    var str = '';

    for ( i = 0; i < ${meetings_count}; i++) {
        if ( checks[i].checked === true ) {
            str += checks[i].value + "; ";
        }
    }
    alert(str);
}

function myFunctionName() {
  // Declare variables
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput4");
  filter = input.value.toUpperCase();
  table = document.getElementById("report_list");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}

function myFunctionDate() {
    // Declare variables
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("myInput5");
    filter = input.value.toUpperCase();
    table = document.getElementById("report_list");
    tr = table.getElementsByTagName("tr");

    // Loop through all table rows, and hide those who don't match the search query
    for (i = 0; i < tr.length; i++) {
      td = tr[i].getElementsByTagName("td")[1];
      if (td) {
        txtValue = td.textContent || td.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
          tr[i].style.display = "";
        } else {
          tr[i].style.display = "none";
        }
      }
    }
  }

function myFunctionCompanyName() {
      // Declare variables
      var input, filter, table, tr, td, i, txtValue;
      input = document.getElementById("myInput6");
      filter = input.value.toUpperCase();
      table = document.getElementById("report_list");
      tr = table.getElementsByTagName("tr");

      // Loop through all table rows, and hide those who don't match the search query
      for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[2];
        if (td) {
          txtValue = td.textContent || td.innerText;
          if (txtValue.toUpperCase().indexOf(filter) > -1) {
            tr[i].style.display = "";
          } else {
            tr[i].style.display = "none";
          }
        }
      }
    }

function myFunctionCustomerName() {
    // Declare variables
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("myInput7");
    filter = input.value.toUpperCase();
    table = document.getElementById("report_list");
    tr = table.getElementsByTagName("tr");

    // Loop through all table rows, and hide those who don't match the search query
    for (i = 0; i < tr.length; i++) {
      td = tr[i].getElementsByTagName("td")[3];
      if (td) {
        txtValue = td.textContent || td.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
          tr[i].style.display = "";
        } else {
          tr[i].style.display = "none";
        }
      }
    }
  }

function myFunctionStatus() {
    // Declare variables
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("myInput8");
    filter = input.value.toUpperCase();
    table = document.getElementById("report_list");
    tr = table.getElementsByTagName("tr");

    // Loop through all table rows, and hide those who don't match the search query
    for (i = 0; i < tr.length; i++) {
      td = tr[i].getElementsByTagName("td")[4];
      if (td) {
        txtValue = td.textContent || td.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
          tr[i].style.display = "";
        } else {
          tr[i].style.display = "none";
        }
      }
    }
  }

$(document).ready(function() {
    $('#report_list').tablesorter();
});
</script>

<c:set var="actMet" value="${ForwardConst.ACT_MET.getValue()}" />
<c:set var="commIdx" value="${ForwardConst.CMD_INDEX.getValue()}" />
<c:set var="commShow" value="${ForwardConst.CMD_SHOW.getValue()}" />
<c:set var="commNew" value="${ForwardConst.CMD_NEW.getValue()}" />

<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>商談　一覧</h2>
        <input type="text" id="myInput4" onkeyup="myFunctionName()" placeholder="氏名を入力してください。">
        <input type="text" id="myInput5" onkeyup="myFunctionDate()" placeholder="日付を入力してください。">
        <input type="text" id="myInput6" onkeyup="myFunctionCompanyName()" placeholder="会社名を入力してください。">
        <input type="text" id="myInput7" onkeyup="myFunctionCustomerName()" placeholder="お客様名を入力してください。">
        <input type="text" id="myInput8" onkeyup="myFunctionStatus()" placeholder="進捗状況を入力してください。">
        <table id="report_list">
            <tbody>
                <thead>
                <tr>
                    <th class="meeting_name">氏名</th>
                    <th class="meeting_date">日付</th>
                    <th class="meeting_company_name">会社名</th>
                    <th class="meeting_customer_name">お客様名</th>
                    <th class="meeting_status">進捗状況</th>
                    <th class="meeting_action">操作</th>
                </tr>
                </thead>
                <c:forEach var="meeting" items="${meetings}" varStatus="status">
                    <fmt:parseDate value="${meeting.meetingDate}" pattern="yyyy-MM-dd" var="meetingDay" type="date" />

                    <tr class="row${status.count % 2}">
                        <td class="meeting_name"><input type="checkbox" class="checks" value="${meeting.status}" > <c:out value="${meeting.employee.name}" /></td>
                        <td class="meeting_date"><fmt:formatDate value='${meetingDay}' pattern='yyyy-MM-dd' /></td>
                        <td class="meeting_company_name"">${meeting.company_name}</td>
                        <td class="meeting_customer_name">${meeting.customer_name}</td>
                        <td class="meeting_status">${meeting.status}</td>
                        <td class="meeting_action"><a href="<c:url value='?action=${actMet}&command=${commShow}&id=${meeting.id}' />">詳細を見る</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <input type="button" onClick="checkAllBox(true)" value="全選択">
        <input type="button" onClick="checkAllBox(false)" value="全解除"><br><br>
        <button onclick="getValue()">値を取得</button>

        <div id="pagination">
            （全 ${meetings_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((meetings_count - 1) / maxRow) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='?action=${actMet}&command=${commIdx}&page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>

    </c:param>
</c:import>