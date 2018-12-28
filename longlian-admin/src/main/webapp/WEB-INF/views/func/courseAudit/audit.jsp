<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/common/taglibs.jsp"%>
<!DOCTYPE html>
<html ng-app="course">
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1;text/html; charset=utf-8"/>
  <title>录播视频审核</title>
  <%@include file="/WEB-INF/views/include/header.jsp"%>
  <link rel="stylesheet" href="${ctx}/web/res/style/css/style.css">
  <script src="${ctx}/web/res/angular/angular.js"></script>
  <script src="${ctx}/web/res/bootstrap/js/bootstrap3-validation.js"></script>
  <script src="${ctx}/web/res/angular/angular-messages.js"></script>
    <script>
    var id = ${id};
    $(function(){
      //1. 简单写法：
      $("#form1").validation({icon:true});
    });
  </script>
  <script src="${requestContext.contextPath}/web/res/js/func/courseAudit/app.js"></script>
  <style>
    .titles{
      width: 250px;
      text-align: right;
    }
    .much{
        display: inline-block;
    }
    .texry{
      position: absolute;
      left: 252px;
      top: 0;
      width: 250px;
      height: 66px;
      font-size: 10px;
      margin-left: 4px;
      resize: none;
      font-size: 14px;
    }
    .footerBtn{
      clear: both;
      text-align: center;
      margin-top: 80px;
    }
  </style>
</head>
<body>
<div  style="margin-top:10px; ">
  <form class="form-horizontal form-horizontal-my-from"  id="form1" name="myform" style="" ng-controller="task">
    <%--<div class="form-group">
      <div class="centers">
          <label class="control-label titles">课程编号：</label>
          <span>{{course.id}}</span>
      </div>
    </div>
    <div class="form-group">
      <div class="centers">
        <label  class="control-label titles">课程名称：</label>
        <span class="much">{{course.liveTopic}}</span>
      </div>
    </div>
    --%>

    <div class="form-group" style="position:relative;">
      <label class="control-label titles"><span style="color: red">*</span>审核意见：</label>
      <textarea class="texry" id="remark" name="remark" ng-model="course.remark"  autocomplete="off" placeholder="" maxlength="100" ></textarea>
    </div>

  </form>
</div>
<div class="footerBtn">
  <button type="button" class="btn btn-danger" style="margin-right: 6px"  onclick="toCheck(-1)">
    <i class=" glyphicon glyphicon-remove"></i> 不通过
  </button>
  <button type="button" class="btn btn-success passBtn"  onclick="toCheck(1)">
    <i class=" glyphicon glyphicon-ok"></i> 通过
  </button>
</div>
</body>
</html>
