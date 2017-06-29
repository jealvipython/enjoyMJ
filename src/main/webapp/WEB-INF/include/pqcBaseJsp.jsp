<%--
  Created by IntelliJ IDEA.
  User: joseph
  Date: 2017/6/13
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="ctx" value="${pageContext.request.contextPath}${fns:getAdminPath()}"/>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"/>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>

</head>


<style>
    .alertMask{position: fixed;top: 0;bottom: 0;left: 0;right: 0;background: rgba(0,0,0,.5);display:none;z-index:9}
    .maskWrapper{width: 84%;margin: 30% auto 0;border-radius: .1rem;background: #fff;font-size: .32rem;}
    .col_3{color: #333}
    .col_6{color: #666;}
    .col_f{color: #fff;}

    .font28{font-size: .28rem;}
    .font33{font-size: .33rem;}
    .maskTit{height: 1rem;line-height: 1rem;text-align: center;}
    .maskContent{padding: .5rem;border-top: 1px solid #ddd;border-bottom: 1px solid #ddd;line-height: 1.5em;}
    .maskBtns{width: 83%;margin: 0 auto;padding-bottom: .2rem;padding-top: .2rem;}
    .maskBtn{display: block;width: 60%;text-align: center;line-height: .76rem;}
    .maskBtn{background: #0780ec;border-radius: .1rem;display: block;width: 47.6%;
        text-align: center;line-height: .76rem;font-size:.33rem;margin: 0 auto;}
</style>

<link type="text/css" rel="stylesheet" href="${ctxStatic}/mobile/modules/Manager/css/waitMe.css">
<link rel="stylesheet" type="text/css"
      href="${ctxStatic}/mobile/modules/pqc/css/globalUtil.css" />



<script type="text/javascript" src="${ctxStatic}/mobile/modules/Manager/js/lib/jquery-2.1.1.min.js"></script>
<script type="text/javascript"
        src="${ctxStatic}/mobile/modules/Manager/js/utils/waitMe.js"></script>

<script type="text/javascript" src="${ctxStatic}/mobile/modules/Manager/js/utils/global.js"></script>

<script type="text/javascript" src="${ctxStatic}/mobile/modules/pqc/js/applyCheckBase/CommonJs/dataLoading.js"></script>
<body>
<script type="text/javascript">
    var basePqcUrl = "${ctx}/app/pqc";



</script>

<div class="alertMask undis">
    <div class="maskWrapper">
        <p class="col_3 maskTit">质检员您好</p>
        <div class="font28 col_6 maskContent"></div>
        <div class="maskBtns clearfix">
            <a class="maskBtn font33 col_f" href="javascript:;">我知道了</a>
        </div>
    </div>
</div>
</body>
</html>
