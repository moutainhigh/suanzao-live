<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/common/taglibs.jsp"%>
<!DOCTYPE html>
<html ng-app="appUser">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1;text/html; charset=utf-8"/>
    <title>用户管理</title>
    <%@include file="/WEB-INF/views/include/header.jsp"%>
    <link rel="stylesheet" href="${ctx}/web/res/style/css/style.css">
    <link rel="stylesheet" href="${ctx}/web/res/style/css/upload.css"/>
    <script src="${ctx}/web/res/angular/angular.js"></script>
    <script src="${ctx}/web/res/bootstrap/js/bootstrap3-validation.js"></script>
    <script src="${ctx}/web/res/angular/angular-messages.js"></script>
    <script src="${ctx}/web/res/fileupload/js/vendor/jquery.ui.widget.js"></script>
    <script src="${ctx}/web/res/fileupload/js/jquery.iframe-transport.js"></script>
    <script src="${ctx}/web/res/fileupload/js/jquery.fileupload.js"></script>
    <script src="${ctx}/web/res/fileupload/js/jquery.fileupload-process.js"></script>
    <script src="${ctx}/web/res/fileupload/js/jquery.fileupload-validate.js"></script>
    <script src="${ctx}/web/res/fileupload/upload.js"></script>
    <script src="${requestContext.contextPath}/web/res/js/func/appUser/avatar.js"></script>
    <script>
        var id = ${id};
        $(function () {
            bindImageUpload("upload", 5 * 1024 * 1024, myCallBack)
            $("#form1").validation({icon: true});
        });
        function myCallBack(data) {
            data = data.result;
            if (data.success) {
                var appElement = document.querySelector('[ng-controller=task]');
                var $scope = angular.element(appElement).scope();
                $("#src").show();
                $scope.setPicAddress(data.data.url);
                $('.Img').attr("src", data.data.url);
            } else {
                jbox_notice({content: "选择图片失败", autoClose: 2000, className: "error"});
            }
        }
    </script>
</head>
<body>
<div  style="margin-top:10px; ">
    <form class="form-horizontal form-horizontal-my-from"  id="form1" name="myform" style="" ng-controller="task">
        <input type="hidden" class="form-control"  name="id"  ng-model="shopFloor.id" autocomplete="off" placeholder=""  >

        <div class="form-group">
            <label for="orderSort" class="col-sm-3 control-label">姓名:</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="orderSort" name="orderSort" ng-model="appUser.name"  autocomplete="off" placeholder="" >
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label">性别:</label>

            <div class="col-sm-6">
                <select class="form-control" ng-model="appUser.gender" check-type="select_required">
                    <option value="0">男</option>
                    <option value="1">女</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label">图片路径:</label>

            <div class="col-sm-7 btn-upload">
                <div class="shade-box">本地上传</div>
                <span class="shade-text">请选择图片.png,.gif</span>
                <input type="file" class="file-btn" name="files[]" style="left:0;" id="upload" accept=".png,.gif" value="本地上传"  />
            </div>
        </div>
        <input type="hidden" id="picAddress" name="picAddress" ng-model="appUser.picAddress">

        <div class="form-group" style="display:none;" id="src">
            <label class="col-sm-3 control-label"></label>

            <div class="col-sm-7">
                <img class="Img" ng-src="{{imgSrc}}" height="50px"/>
            </div>
        </div>
    </form>
</div>
</body>
</html>
</div>
</body>
<script>
    $(".file-btn").change(function(){
        var urlVal = $(this).val();
        var filtName = getFileName(urlVal);
        if(!(/(?:png|gif)$/i.test(filtName))){
            return;
        }
        function getFileName(o){
            var pos=o.lastIndexOf("\\");
            return o.substring(pos+1);
        }
        $(this).prev().text(filtName);

    })
</script>
</html>
