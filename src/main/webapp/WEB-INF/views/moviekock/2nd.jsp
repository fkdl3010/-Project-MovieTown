<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../template/header.jsp">
	<jsp:param value="2번째 페이지" name="title" />
</jsp:include>

  <link rel="stylesheet" href="/movie/assets/style/2nd.css"/>

  <div class="main-wrapper">

    <div class="nav-category">
      <form class="top-form">
        <select name="left" class="selectpicker left">
          <option value="모든장르">모든장르</option>
          <option value="모든장르">모든장르</option>
          <option value="모든장르">모든장르</option>
          <option value="모든장르">모든장르</option>
        </select>
        <select name="right" class="selectpicker right">
          <option value="정렬기준">정렬기준</option>
          <option value="정렬기준">정렬기준</option>
          <option value="정렬기준">정렬기준</option>
          <option value="정렬기준">정렬기준</option>
        </select>
      </form>
    </div>
  
    <div class="main-movieList">
      <div class="list"></div>
      <div class="list"></div>
      <div class="list"></div>
      <div class="list"></div>
      <div class="list"></div>
      <div class="list"></div>
      <div class="list"></div>
      <div class="list"></div>
      <div class="list"></div>
      <div class="list"></div>
      <div class="list"></div>
      <div class="list"></div>
    </div>

  </div>
</body>
</html>