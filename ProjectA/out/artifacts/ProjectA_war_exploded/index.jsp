<%--
  Created by IntelliJ IDEA.
  User: sourabh
  Date: 22/12/16
  Time: 2:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page session="true" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="pkg.MyClass" %>
<%--Download JSON JAR from https://mvnrepository.com/artifact/org.json/json/20090211--%>

<%
    String s = MyClass.DisplayIPv4();
%>
<!-- <md-button class="md md-btn" ng-click=showSimpleToast('<%=s%>')>Connect to Database</md-button> -->
<html ng-app="project">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet'
          type='text/css'>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/angular_material/1.1.1/angular-material.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" type="text/css" href="style.css">


</head>
<body ng-controller="myController">
    
    <ui-view></ui-view>
    
    <!-- <footer>
        <div layout="row" style="background-color:rgb(63,81,200);" layout-align="center center">
            <h4>Copyright &copy; </h4>
        </div>
    </footer> -->

<!-- Scripts -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular-animate.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular-aria.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-material/1.1.1/angular-material.js"></script>
<script src="//cdn.jsdelivr.net/angular-material-icons/0.4.0/angular-material-icons.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-router/0.2.15/angular-ui-router.min.js"></script>
<script src="dirPagination.js"></script>
<script src="IPCalculator.js"></script>
<script src="//code.angularjs.org/1.2.20/angular-sanitize.min.js"></script>
<script src="app.js"></script>
<!-- <script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script> -->

</body>
</html>
