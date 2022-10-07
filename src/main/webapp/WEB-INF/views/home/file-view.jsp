<%--
  Created by IntelliJ IDEA.
  User: snow
  Date: 2022-10-04
  Time: 19:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function loadJson(){
      $.ajax({
        url:"${cpath}/fileList.do",
        type:"get",
        dataType:"json",
        success: ajaxHtml,
        error:function(){alert("error");}
      });
    }

    function ajaxHtml(data){
      var html="<table class='table'>";
      html+="<tr>";
      html+="<td>아이디</td>";
      html+="<td>파일명</td>";
      html+="</tr>";

      $.each(data, (index,obj)=>{
        html+="<tr>";
        html+="<td>"+obj.id+"</td>";
        html+="<td>"+obj.name+"</td>";
        html+="</tr>";
      })
      html+="</table>";

      $("#fileList").html(html);


    }
</script>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark" aria-label="Tenth navbar example">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/file-view">Raspberry pi NAS</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/file-view">File_View</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/file/">File_UpLoad</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">Menu</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/file-view">File_View</a></li>
            <li><a class="dropdown-item" href="/file/">File_UpLoad</a></li>
            <li><a class="dropdown-item" href="#">___</a></li>
            <li><a class="dropdown-item" href="#">LogOut</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
<!-- 썸네일 이미지 테스트-->
<div class="container">
  <div class="row">
    <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
      <thead>
      <tr>
        <th style="background-color: #eeeeee; text-align:center;">No</th>
        <th style="background-color: #eeeeee; text-align:center;">Title</th>
        <th style="background-color: #eeeeee; text-align:center;">Publisher</th>
        <th style="background-color: #eeeeee; text-align:center;">Date</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td>test1</td>
        <td>hi</td>
        <td>진효식</td>
        <td>2022-9-20</td>
      </tr>
      <tr>
        <td>test2</td>
        <td>hi</td>
        <td>진효식</td>
        <td>2022-9-20</td>
      </tr>
      <tr>
        <td>test3</td>
        <td>hi</td>
        <td>정훈찬</td>
        <td>2022-9-20</td>
      </tr>
      <tr>
        <td>test4</td>
        <td>hi</td>
        <td>정훈찬</td>
        <td>2022-9-20</td>
      </tr>
      <tr>
        <td>test5</td>
        <td>hi</td>
        <td>김설</td>
        <td>2022-9-20</td>
      </tr>
      <tr>
        <td>test6</td>
        <td>hi</td>
        <td>김설</td>
        <td>2022-9-20</td>
      </tr>

      </tbody>
    </table>

    <a href="/file/" class="btn btn-dark pull-right">File-UpLoad</a>
    <button class="btn btn-success btn-sm" onclick="loadJson()">file list</button>
    <br/><br/>   <!--버튼 클릭시 ajax로 넘어가서 출력되어야하는데 실패함 error출력됨-->
    <div id="fileList">
      list here
    </div>
    <c:forEach var="dto" items="${list}"> <!-- jstl로 출력하는 방식인데 실패함 -->
        ${dto.id}
        ${dto.name}<br/>
    </c:forEach>
  </div>
</div>