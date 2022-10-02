<%--
  Created by IntelliJ IDEA.
  User: snow
  Date: 2022-09-29
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>


메인페이지 테스트

<table>
    <thread>
        <tr>
            <td>ID</td>
            <td>Name</td>
        </tr>
    </thread>
<c:forEach var="fileDto" items="${fileDto}" varStatus="status">
    <tr>
        <td>${fileDto.id} </td>
        <td>${fileDto.name}</td>
    </tr>
</c:forEach>

</table>