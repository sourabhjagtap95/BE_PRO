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

<%--%@ page import="java.util.StringTokenizer" %>

<%
    String stringFromJava = MyClass.DisplayIPv4();
    StringTokenizer stringTokenizer = new StringTokenizer(stringFromJava,",");
%>
<%
    while(stringTokenizer.hasMoreTokens()){
 /* while(stringTokenizer.hasMoreTokens()){
    */%>
<ul>
  <li><%=stringTokenizer.nextToken()%></li>
  <li><%=stringTokenizer.nextToken()%></li>
  <li><%=stringTokenizer.nextToken()%></li>
  <li><%=stringTokenizer.nextToken()%></li>
  <li><%=stringTokenizer.nextToken()%></li>
  <li><%=stringTokenizer.nextToken()%></li>
  <li><%=stringTokenizer.nextToken()%></li>
</ul>
<%
  }
%>--%>
<%
    String s = MyClass.DisplayIPv4();
%>
<md-button class="md md-btn" ng-click=showSimpleToast('<%=s%>')>Connect to Database</md-button>
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


<div class="container-fluid">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default panel-table">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col col-xs-6">
                            <h3 class="panel-title">Data</h3>
                        </div>

                    </div>
                </div>
                <div class="panel-body">
                    <div class="text-center">
                        <div class="text-left">
                            <div class="dropdown" id="dropdown_selection">
                                <md-button class="md-primary md-raised dropdown-toggle" type="button"
                                           data-toggle="dropdown">Select the version
                                    <span class="caret"></span>
                                </md-button>
                                <ul class="dropdown-menu">
                                    <div>
                                        <span ng-bind="data"></span>
                                    </div>
                                    <li>
                                        <md-button
                                                class="md-default md-raised"
                                                style="margin-left:35px;"
                                                ng-click="IPv4 = true">IPv4
                                        </md-button>
                                    </li>

                                    <li class="divider"></li>
                                    <li>
                                        <md-button class="md-default md-raised" style="margin-left:35px;"
                                                   ng-click="loadIPv6()">IPv6
                                        </md-button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <%--<div id="search_query" >--%>
                        <%--<md-input-container flex>--%>
                        <%--<label>Search<em class="fa fa-search" style="margin-left: 40px;"></em></label>--%>
                        <%--<input  ng-model="query" type="text">--%>
                        <%--</md-input-container>--%>
                        <%--</div>--%>
                        <form ng-submit="addNew()">
                            <div class="text-left" layout-xl="row" layout-sm="column">
                                <!-- <input class="col col-sm-3 form-control" placeholder="Search"/> -->
                                <md-button ng-click="showPrompt()" class="md-fab md-default addNew" title="Add Data"><span
                                        class="fa fa-plus"></span></md-button>
                                <md-button class="md-fab md-primary" title="Delete" ng-click="showConfirm($event)"><span
                                        class="fa fa-trash-o fa-lg"></span></md-button>

                                <md-fab-toolbar 
                                    md-open="false" 
                                    md-direction="right">
                                <md-fab-trigger class="align-with-text">
                                  <md-button aria-label="menu" class="md-fab md-primary">
                                    <em class="fa fa-search"></em>
                                  </md-button>
                                </md-fab-trigger>

                                <md-toolbar>
                                  <md-fab-actions class="md-toolbar-tools">
                                    <md-button aria-label="search_by_ip" ng-model="search_by_ip" class="md-fab md-raised md-mini md-accent">
                                      <md-icon class="material-icons" aria-label="Add">add</md-icon>
                                    </md-button>
                                    {{ search_by_ip }}
                                    <md-button aria-label="search_by_port" ng-click="search_by_port=true" class="md-icon-button">
                                      <em class="fa fa-search"></em>
                                    </md-button>
                                    <md-button aria-label="search_by_subnet" ng-click="search_by_subnet=true" class="md-icon-button">
                                      <em class="fa fa-search"></em>
                                    </md-button>
                                  </md-fab-actions>
                                </md-toolbar>
                              </md-fab-toolbar>
                            </div>
                            <div>
                                {{ search_by_port }}
                                <md-input-container  flex style="margin-left: 200px; width:200px; margin-top: 50px;">
                                    <label style="font-size: large;">
                                        Search
                                        <em class="fa fa-search" 
                                            style="float: right;">
                                        </em>
                                    </label>
                                    <input ng-model="query" type="text">
                                </md-input-container>
                            </div>
                            <div ng-show="search_by_ip">
                                {{ search_by_ip }}
                                <md-input-container ng-show="search_by_ip" flex style="margin-left: 200px; width:200px; margin-top: 50px;">
                                    <%--<label style="font-size: large;">Category<em class="fa fa-search" style="float: right;"></em></label>--%>
                                    <label>Search by IP address: </label>
                                    <input type="text" ng-model="category.sourceIP">
                                </md-input-container>
                            </div>
                    </div>
                    <form method="POST">
                    <div class="jumbotron sliderMenu" ng-show="addingMenu">
                        <div style="float:left">
                            <md-button class="md-fab md-mini" ng-click="addRow()">
                            <em class="fa fa-plus"></em>
                            </md-button>
                            <label>Add New Row</label>
                        </div>
                        <table class="table table-striped table-bordered table-list table-data" >
                            <thead align="center">
                                <tr>
                                    <th>Source IP Address</th>
                                    <th>Source Subnet Mask</th>
                                    <th>Destination IP Address</th>
                                    <th>Destination Subnet Mask</th>
                                    <th>Source Port Address</th>
                                    <th>Destination Port Address</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat = "new_data in IPv4_new_data track by $index">
                                    <td><input type="text" ng-model = "new_data.sourceIP" class="form-control"></td>
                                    <td><input type="text" ng-model = "new_data.sourceSubnet" class="form-control"></td>
                                    <td><input type="text" ng-model = "new_data.destIP" class="form-control"></td>
                                    <td><input type="text" ng-model = "new_data.destSubnet" class="form-control"></td>
                                    <td><input type="text" ng-model = "new_data.sourcePort" class="form-control"></td>
                                    <td><input type="text" ng-model = "new_data.destPort" class="form-control"></td>
                                    <td>
                                        <div layout="row">
                                            <md-button class="md-fab md-warn md-mini" ng-click="deleteNewData($index)"title="Delete">
                                            <em class="fa fa-trash-o fa-lg"></em>
                                            </md-button>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <pre>{{ IPv4_new_data | json }}</pre>
                        <md-button
                            type="submit"
                            name="submitData"
                            style="float:right;" 
                            class="md-raised md-primary" 
                            ng-click="addNewIPv4Data()">
                            Submit
                        </md-button>
                    </div>
                    </form>
                    <%
                        if(request.getParameter("submitData")!=null){
                            out.println("Data to write : ");
                        }
                        else
                            out.println("Hell noooo !!!"+request.getParameter("submitData"));
                    %>

                    <table ng-if="IPv4" class="table table-striped table-bordered table-list table-data" id="myTable">
                        <thead align="center">
                        <tr>
                            <!-- <th>Sr. No.</th> -->
                            <th>
                                <div flex-gt-sm="50">
                                    <md-button class="md-fab md-mini" ng-model="selectedAll" ng-click="checkAll()"><span
                                            class="fa fa-check-square"></span>
                                    </md-button>
                                </div>
                                <%--<input type="checkbox" ng-model="selectedAll" ng-click="checkAll()" /></th>--%>
                            <th align="center">ID</th>
                            <%--<th class="hidden-xs">Version</th>--%>
                            <th>Source IP Address</th>
                            <th>Source Subnet Mask</th>
                            <th>Destination IP Address</th>
                            <th>Destination Subnet Mask</th>
                            <th>Source Port Address</th>
                            <th>Destination Port Address</th>
                            <%--<th align="center">Action&nbsp;<em class="fa fa-cog"></em></th>--%>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="data in IP | limitTo:limit | filter : query | filter : category :strict"
                            ng-class="{'selected':$index == selectedRow}">
                            <!-- <td>{{ $index = $index + 1 }}</td> -->

                            <td align="center">
                                <div flex-gt-sm="50">
                                    <md-checkbox ng-model="data.selected" aria-label="">
                                    </md-checkbox>
                                </div>
                                <%--<input type="checkbox" ng-model="data.selected"/>--%>
                            </td>

                            <td><input type="text" class="form-control" ng-model="data.id" required/></td>
                            <td><input type="text" class="form-control" ng-model="data.sourceIP" required/></td>
                            <td><input type="text" class="form-control" ng-model="data.sourceSubnet" required/></td>
                            <td><input type="text" class="form-control" ng-model="data.destIP" required/></td>
                            <td><input type="text" class="form-control" ng-model="data.destSubnet" required/></td>
                            <td><input type="text" class="form-control" ng-model="data.sourcePort" required/></td>
                            <td><input type="text" class="form-control" ng-model="data.destPort" required/></td>
                            <%--<td align="center">--%>
                            <%--&lt;%&ndash;<action></action>&ndash;%&gt;--%>
                            <%--</td>--%>
                        </tr>
                        </tbody>
                    </table>
                    </form>
                </div>
                <div class="panel-footer">
                    <div class="row">
                        <md-button class="md-fab md-mini md-primary" ng-click="limit = limit + 5" style="float:right;">
                            <span class="caret"></span></md-button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular-animate.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular-aria.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-material/1.1.1/angular-material.js"></script>
<script src="//code.angularjs.org/1.2.20/angular-sanitize.min.js"></script>
<script src="app.js"></script>


</body>
</html>
