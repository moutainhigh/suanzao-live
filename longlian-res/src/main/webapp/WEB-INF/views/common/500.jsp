<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@include file="/WEB-INF/views/common/taglibs.jsp"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.io.StringWriter"%>
<%@ page import="java.net.InetAddress"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="org.slf4j.Logger"%>
<%@ page import="org.slf4j.LoggerFactory"%>
<%response.setStatus(200);%>

<%
pageContext.setAttribute("ctx", request.getContextPath());
Throwable ex = null;
if (exception != null) {
	ex = exception;
}
if (request.getAttribute("javax.servlet.error.exception") != null) {
	ex = (Throwable) request.getAttribute("javax.servlet.error.exception");
}

//记录日志
Logger logger = LoggerFactory.getLogger("500.jsp");
String requestInfo = "";
try {
	StringBuilder buff = new StringBuilder();
	buff.append(InetAddress.getLocalHost())
		.append("\n");
    buff.append("Header....\n");
    Enumeration<String> e = request.getHeaderNames();
    String key;
    while(e.hasMoreElements()){
        key = e.nextElement();
        buff.append(key)
			.append("=")
			.append(request.getHeader(key))
			.append("\n");
    }
    buff.append("Attribute....\n");
    e = request.getAttributeNames();
    while(e.hasMoreElements()){
        key = e.nextElement();
        buff.append(key)
			.append("=")
			.append(request.getAttribute(key))
			.append("\n");
    }

    buff.append("Parameter....\n");
    e = request.getParameterNames();
    while(e.hasMoreElements()){
        key = e.nextElement();
		buff.append(key)
			.append("=")
			.append(java.util.Arrays.asList(request.getParameterValues(key)))
			.append("\n");
    }
	requestInfo = buff.toString().replaceAll("<", "&lt;");
} catch(Throwable t) {
    logger.error("fetch request info error", t);
}
logger.error(requestInfo, ex);
%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/WEB-INF/views/common/meta.jsp"%>
    <title>500 - 系统内部发生错误</title>
	<%@include file="/WEB-INF/views/include/header.jsp" %>
		<script type="text/javascript">
$(function() {
	$('#targetContentDiv').height($(window).innerHeight() - 150);
})
    </script>
	<style type="text/css">
	
#ContentDiv {
	width:400px;
	height:300px;
	position: absolute;
	left:50%;
	top:50%;
	margin-left:-200px;
	margin-top:-150px;
	background-color: #fff;
	text-align: center;
	font-family: "微软雅黑";
	vertical-align: middle;
}

#ContentDiv h1 {
	width:100%;
	height:120px;
	background:url(../staticResource/images/framelayout/500.png) no-repeat center center;
}

#ContentDiv p {
	font-size: 24px;
    font-weight:normal;
    line-height: 1.25;
	padding: 10px;
	color:#666;
}

#ContentDiv li {
	display: inline;
	list-style: none outside none;
}
.btn {
	border: none;
	background: none;
	box-shadow: none;
	color: #fff;
	box-shadow: none;
}
a.btn:hover {
	color: #fff;
}
.btn:link,
.btn:hover,
.btn:active {
	background-color: #0090e6;
}

button.btn,
span.btn,
a.btn,input.btn{
	padding: 3px 5px;
	width:60px;
	text-align: center;
	font-size: 12px;
	background-color: #45b7f9;
	background: transparent linear-gradient(to bottom, #45b7f9 0%, #0399f0 100%) repeat scroll 0px 0px;
	color: #fff;
	border-radius: 3px;
	text-decoration: none;
	border: 1px solid #0882c9;
	text-shadow: none;
	margin-right: 10px;
	margin-left: 2px;
}
button.btn:focus,
input.btn:focus,
span.btn:focus,
a.btn:focus,
button.btn:hover,
a.btn:hover,
input.btn:hover,
span.btn:hover {
	background: transparent linear-gradient(to bottom, #16a1f1 0%, #0983cb 100%) repeat scroll 0px 0px;
	color: #fff;
}

button.btn.disabled:hover,
span.btn.disabled:hover,
a.btn.disabled:hover,
input.btn.disabled:hover,
button.btn[disabled]:hover,
span.btn[disabled]:hover,
a.btn[disabled]:hover,
input.btn[disabled]:hover
{
    background-image: none;
    color: inherit;
}
	</style>
  </head>

  <body>

	<div id="ContentDiv">
	  <div class="containers">
		<h1></h1>
		<p>系统内部发生错误...建议您</p>
		<ul>
		  <li><a class="btn btn-primary" href="${ctx}/dashboard/dashboard.do?_token=${_token}">返回首页</a></li>
		  <!-- <li><a class="btn" href="javascript:void(0);" onclick="">联系管理员</a></li>
		  <li><a class="btn" href="javascript:void(0);" onclick="$('#output').show();$('#targetContentDiv').hide();">显示详情</a></li> -->
		</ul>
      </div>
	</div>
	<div id="output" style="display:none">
	  <div style="text-align:center;" class="container">
	    <a class="btn btn-info container" href="javascript:void(0);" onclick="$('#output').hide();$('#targetContentDiv').show();">返回</a>
	  </div>
	  <pre>
<%=requestInfo%>
<hr>
<%
StringWriter writer = new StringWriter();
ex.printStackTrace(new PrintWriter(writer));
out.println(writer.toString());
%>
	  </pre>
	</div>

  </body>

</html>
