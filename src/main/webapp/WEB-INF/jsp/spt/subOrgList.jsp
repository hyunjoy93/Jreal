<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- HEADER -->
<c:import url="/link/pageLink?link=/inc/header" />
<!-- NAV -->
<c:import url="/link/pageLink?link=/inc/nav" />

<style>
  body {
    font-family: Arial, sans-serif;
    background: #f4f4f4;
  }

  .org-wrapper {
    display: flex;
    flex-direction: column;
    gap: 60px;
  }

  /* 각 줄: 지점명 + 인물 리스트 */
  .line-group {
    display: flex;
    align-items: center; /* ← 이게 핵심!! 세로 줄 맞춤 */
    gap: 20px;
    flex-wrap: wrap;
    width: 100%;
  }

  .branch-box,
  .ceo-box {
    background-color: #000717;
    color: #ffffff;
    padding: 10px 25px;
    border-radius: 6px;
    font-size: 1.2em;
    font-weight: bold;
    text-align: center;
    white-space: nowrap;
    height: fit-content;
    margin-top: auto;
    margin-bottom: auto;
  }

  .person-list {
    display: flex;
    gap: 20px;
    flex-wrap: wrap;
  }

  .person-box {
    background-color: #ffffff;
    border: 1px solid #ccc;
    border-radius: 8px;
    width: 140px;
    height: 180px; /* 높이 고정 */
    box-shadow: 2px 2px 8px rgba(0,0,0,0.05);
    flex-shrink: 0;
    text-align: center;

    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center; /* 세로 가운데 정렬 */
    padding: 15px;
  }

  .person-img {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    background-color: #ddd;
    margin-bottom: 10px;
    background-size: cover;
    background-position: center;
  }

  .person-name {
    font-weight: bold;
    margin-bottom: 4px;
  }

  .person-role {
    font-size: 0.9em;
    color: #555;
  }
</style>

<!-- CONTENTS -->
<section class="section">

  <div class="conHead">
    <ol class="breadcrumb">
      <li><a href="" class="home">Home</a></li>
      <li>업무관리</li>
      <li>조직도</li>
    </ol>

    <div class="headline">
      <h2 class="pageTitle">조직도</h2>
    </div>
  </div>

  <div class="conBody">
    <div class="org-wrapper">

      <!-- 총 대표 줄 -->
      <div class="line-group">
        <div class="ceo-box">제이부동산</div>
        <div class="person-list">
          <div class="person-box">
            <div class="person-img" style="background-image: url('https://via.placeholder.com/80');"></div>
            <div class="person-name">석진영</div>
            <div class="person-role">총괄대표</div>
          </div>
        </div>
      </div>

      <!-- 권선분점 줄 -->
      <div class="line-group">
        <div class="branch-box">권선분점</div>
        <div class="person-list" style="margin-left : 17px;">
          <div class="person-box">
            <div class="person-img" style="background-image: url('https://via.placeholder.com/80');"></div>
            <div class="person-name">홍길동</div>
            <div class="person-role">지점장</div>
          </div>
          <div class="person-box">
            <div class="person-img" style="background-image: url('https://via.placeholder.com/80');"></div>
            <div class="person-name">김영업</div>
            <div class="person-role">영업팀</div>
          </div>
          <div class="person-box">
            <div class="person-img" style="background-image: url('https://via.placeholder.com/80');"></div>
            <div class="person-name">이마케팅</div>
            <div class="person-role">마케팅</div>
          </div>
        </div>
      </div>

      <!-- 팔달본점 줄 -->
      <div class="line-group">
        <div class="branch-box">팔달본점</div>
		<div class="person-list" style="margin-left : 17px;">
          <div class="person-box">
            <div class="person-img" style="background-image: url('https://via.placeholder.com/80');"></div>
            <div class="person-name">최총무</div>
            <div class="person-role">총무팀</div>
          </div>
          <div class="person-box">
            <div class="person-img" style="background-image: url('https://via.placeholder.com/80');"></div>
            <div class="person-name">정개발</div>
            <div class="person-role">개발팀</div>
          </div>
          <div class="person-box">
            <div class="person-img" style="background-image: url('https://via.placeholder.com/80');"></div>
            <div class="person-name">유지원</div>
            <div class="person-role">지원팀</div>
          </div>
        </div>
      </div>

    </div>
  </div>
</section>

<!-- FOOTER -->
<c:import url="/link/pageLink?link=/inc/footer" />

<script type="text/javascript">
  $(function(){
    fnInit();
  });

  function fnInit() {
    fnInitGnbLnb(6, 2, 6, 2);
    fnCommon();
  }
</script>
