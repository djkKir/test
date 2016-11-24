<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Information</title>
    <!-- Bootstrap CSS -->
    <%-- <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"> --%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <style type="text/css">
        .myrow-container{
            margin: 20px;
        }
    </style>
</head>
<body class=".container-fluid">
<div class="container myrow-container">
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">
                User Details
            </h3>
        </div>
        <div class="panel-body">
            <form:form id="userRegisterForm" cssClass="form-horizontal" modelAttribute="user" method="post" action="saveUser">

                <div class="form-group">
                    <div class="control-label col-xs-3"> <form:label path="name" >Name</form:label> </div>
                    <div class="col-xs-6">
                        <form:hidden path="id" value="${userObject.id}"/>
                        <form:input cssClass="form-control" path="name" value="${userObject.name}"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="control-label col-xs-3"><form:label path="age" >Age</form:label></div>
                    <div class="col-xs-6">

                        <form:input cssClass="form-control" path="age"  value="${userObject.age}"/>
                </div>
                </div>

                <div class="form-group">
                    <div class="control-label col-xs-3"><form:label path="admin" >isAdmin</form:label></div>
                        <div class="col-xs-6">
                            <c:if test="${userObject.admin == true}">
                                <form:checkbox  path="admin" onclick="${userObject.admin}" checked="checked" /></c:if>
                            <c:if test="${userObject.admin == false}">
                                <form:checkbox  path="admin" onclick="${userObject.admin}"/></c:if>
                            <c:if test="${userObject.admin == null}">
                                <form:checkbox  path="admin" onclick="${userObject.admin}"/></c:if>

                        </div>
                        </div>




                <div class="form-group">
                    <div class="row">
                        <div class="col-xs-4">
                        </div>
                        <div class="col-xs-4">
                            <input type="submit" id="saveUser" class="btn btn-primary" value="Save" onclick="return submitUserForm();"/>
                            </div>
                        <div class="col-xs-4">
                        </div>
                    </div>
                </div>

            </form:form>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script type="text/javascript"  charset="utf-8" >
    function submitUserForm() {

        var name = $('#name').val();
        var age = $('#age').val();
        var admin = $('#admin').val();


        if(name.length ==0) {
            alert('Введите имя');
            $('#name').focus();
            return false;
        }
        if(age <= 0 || isNaN(age)){
            alert('Введите корректный возраст');
            $('#age').focus();
            return false;
        }



        return true;
    };
</script>
</body>


</body>
</html>
