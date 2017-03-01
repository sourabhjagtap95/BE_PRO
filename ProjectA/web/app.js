/**
 * Created by sourabh on 22/12/16.
 */
(function(){
    angular
        .module("project",["ngMaterial","ngAnimate","ngSanitize","ngMdIcons","ui.router","angularUtils.directives.dirPagination"])
        .config(function($stateProvider){
            $stateProvider
                .state('data',{
                    url: '/data',
                    templateUrl: 'components/main_data.tpl.jsp'
                })
                .state('newData',{
                    url: '/newData',
                    templateUrl: 'components/newdata.tpl.jsp'
                });
        })
        .service('convertToBinary',function(){
            this.toBinary = function(decNumber){
                return decNumber.toString(2);
            }
        })
        .controller("myController",function($scope,$mdDialog,$mdToast,$mdSidenav,$mdBottomSheet,$http, convertToBinary){

            $scope.IP = [];
            $scope.limit = 5;
            $scope.rows = 0;
            $scope.searchingMenu = false;
            $scope.selectedItem = '';
            $scope.showMembers = false;
            $scope.showGuides=false
            $scope.toggleSidenav = function(menuId) {
                $mdSidenav(menuId).open();
            };
            $scope.showIPCalculator = false;

            $scope.toBinary = function(){
                $scope.sourceIPinBinary = convertToBinary.toBinary($scope.sourceIP);
            }

            $scope.Members = ['Sourabh Jagtap','Rupali Talele','Yash Sawant','Rahul Singh'];
            $scope.Guides = ['Mrs. Mayura Kulkarni','Mr. Kiran Divekar'];

            $scope.modifyJSON = function(){
                angular.forEach($scope.IP,function(item){
                    item.id = parseInt(item.id);
                    item.priority = parseInt(item.priority);
                });
            };

            $scope.showSimpleToast = function(message) {

                $mdToast.show(
                    $mdToast.simple()
                        .content(message)
                        .position('top right')
                        .hideDelay(3000)
                );
            };

            $http.get("dataInJson.json").success(function (data) {
                $scope.IP = data;
                $scope.categories = $scope.getCategories($scope.IP);
            });

            $scope.getCategories = function(IP){
                var categories = [];
                angular.forEach(IP,function (item) {
                    categories.push(item);
                });
                return categories;
            };

            $scope.rows = 1;
            $scope.load = false;
            $scope.loadData = function(id,sourceIP,sourceSubnetMask,destIP,destSubnetMask,sourcePort,destPort){
                $scope.IP = [
                    {
                        "id": id,
                        "sourceIP" :sourceIP,
                        "sourceSubnetMask" : sourceSubnetMask,
                        "destIP" :destIP,
                        "destSubnetMask":destSubnetMask,
                        "sourcePort":sourcePort,
                        "destPort":destPort
                    }
                ];
                $scope.load = true;
            };




            $scope.addData = function(result){
                var table = document.getElementById("myTable");
                var row;
                for(var i=1;i<=result;i++) {
                    row = table.insertRow(i);
                    for(var j=0;j<7;j++) {
                        var cell = row.insertCell(j);
                        cell.innerHTML = j;
                    }
                    var cell7 = row.insertCell(7);
                    cell7.innerHTML = "<button class='btn btn-primary btn-md btn-block' ng-click='showConfirm($event,$index)'>X</button>";
                }

            };
            $scope.showPrompt = function(ev) {
                // Appending dialog to document.body to cover sidenav in docs app
                var confirm = $mdDialog.prompt()
                    .title('How many rows you want to add?')
                    .textContent('Input carefully :P')
                    .ok('Okay!')
                    .cancel('Discard');

                $mdDialog.show(confirm).then(function(result) {
                    $scope.rows = result
                    $scope.addNew(result);
                }, function() {

                });
            };



            $scope.IPv4_new_data = [
                {
                    "id":"",
                    "sourceIP" :"",
                    "sourceSubnet" :"",
                    "destIP" :"",
                    "destSubnet":"",
                    "sourcePort":"",
                    "destPort":"",
                    "priority":""
                }
            ];


            $scope.addRow = function(){
                $scope.IPv4_new_data.push({
                    "id":"",
                    "sourceIP" :"",
                    "sourceSubnet" :"",
                    "destIP" :"",
                    "destSubnet":"",
                    "sourcePort":"",
                    "destPort":"",
                    "priority":""
                });            
            };

            $scope.sortType     = 'id'; // set the default sort type
            $scope.sortReverse  = false; 
            $scope.sort = function(keyname){
                $scope.sortKey = keyname;   //set the sortKey to the param passed
                $scope.reverse = !$scope.reverse; //if true make it false and vice versa
            };

            $scope.deleteNewData = function(index){
                $scope.IPv4_new_data.splice(index,1);
            };

            $scope.toggleSearch = function(){
                $scope.searchingMenu=true;
                $scope.addingMenu = false;
                $('.sliderMenu1').slideToggle('slow');
            };

            $scope.addNew = function (rows) {
                $scope.addingMenu = true;
                $scope.searchingMenu=false;
                $('.sliderMenu').slideToggle('slow');
            };


            $scope.showAlert = function(ev,msg) {
                // Appending dialog to document.body to cover sidenav in docs app
                // Modal dialogs should fully cover application
                // to prevent interaction outside of dialog
                $mdDialog.show(
                  $mdDialog.alert()
                    // .parent(angular.element(document.querySelector('#popupContainer')))
                    .clickOutsideToClose(true)
                    .title('Data to Add')
                    .htmlContent("<pre>"+JSON.stringify($scope.IPv4_new_data,undefined,2)+"</pre>")
                    .ariaLabel('Alert Dialog Demo')
                    .ok('Got it!')
                    .targetEvent(ev)
                );
            };

            $scope.l = 13;
            $scope.addNewIPv4Data = function () {
                if($scope.IPv4_new_data){
                    $scope.showAlert();

                    angular.forEach($scope.IPv4_new_data,function(item) {
                        item.id = $scope.l;
                        // $scope.showSimpleToast(item.id);
                        $scope.l = $scope.l + 1;
                        $scope.IP.push(item);
                    });
                    // $scope.IP.concat($scope.IPv4_new_data);
                    $scope.showSimpleToast("Added Successfully !!");
                    $scope.addingMenu = false;
                }
                $scope.addDataInFile = true;
                $scope.sendDatatoServer();
            };

            $scope.sendDatatoServer = function(){
                // var param = JSON.stringify($scope.IPv4_new_data);
                // var url = "components/newdata.tpl.jsp";
                // $http.post(url, "asdasdasd")
                //     .success(function(data, status, headers, config) {
                //         // this callback will be called asynchronously
                //         // when the response is available
                //         console.log(data);
                //     })
                //     .error(function(data, status, headers, config) {
                //         // called asynchronously if an error occurs
                //         // or server returns response with an error status.
                //     });
                console.log($scope.IPv4_new_data);
                        $http({
                            method : 'POST',
                            url : 'components/newdata.tpl.jsp',
                            data : {'data':JSON.stringify($scope.IPv4_new_data)},
                            headers: {
                                'Content-Type': 'application/json'
                            }
                        }).success(function(data) {
                            console.log("Successfully: "+data);
                        }).error(function(data) {
                            console.log("Error: "+data);
                        });
                        console.log("POST done");
            };

            $scope.addDataInFile = false;

            $scope.show = false;

            $scope.remove = function(){
                var newDataList=[];
                $scope.selectedAll = false;
                angular.forEach($scope.IP, function(selected){
                    if(!selected.selected){
                        newDataList.push(selected);
                    }
                });
                $scope.IP = newDataList;
                $scope.showSimpleToast('Deleted Successfully !!');
            };

            $scope.checkAll = function () {
                if (!$scope.selectedAll) {
                    $scope.selectedAll = true;
                } else {
                    $scope.selectedAll = false;
                }
                angular.forEach($scope.IP, function(data) {
                    data.selected = $scope.selectedAll;
                });
            };

            $scope.status='Default';
            $scope.showConfirm = function(ev) {
                var confirm = $mdDialog.confirm()
                    .title('Would you like to delete this data?')
                    .textContent('All of your details would be erased')
                    .targetEvent(ev)
                    .ok('Yes')
                    .cancel('No');
                $mdDialog.show(confirm).then(function() {
                    // $scope.status = 'You decided to get rid of this data'
                    /*            var i = $scope.IP.indexOf(data);
                     $scope.IP.slice(i,1);
                     $scope.status = data;*/
                    $scope.remove();
                }, function() {
                    $scope.status = 'You decided to keep your data';
                });
            };

        })
        .directive('action',function () {
            var directive = {};
            var cell7 = "<div class='row'>";
            cell7+= "<md-button class='md-fab md-mini md-primary' ng-click='showConfirm()' >";
            cell7+="<em class='fa fa-pencil'></em>";
            cell7+="</md-button>";
            cell7+="<md-button class='md-fab md-mini md-warn' ng-click='showConfirm($event,$index)'>";
            cell7+="<em class='fa fa-trash'></em>";
            cell7+="</md-button>";
            cell7+="</div>";
            directive.template = cell7;

            return directive;
        })
        .directive("mySidenav",function(){
            return{
                templateUrl:'components/slider.html'
            }
        })
        .directive("ipv4Table",function(){
            return{
                templateUrl:'components/ipv4Table.html'
            }
        })
        .directive("addIpv4Data",function(){
            return{
                templateUrl:'components/addIpv4Data.html'
            }
        })
        .directive("searchIpv4Data",function(){
            return{
                templateUrl:'components/searchIPv4Data.html'
            }
        })
        .directive("ipCalculator",function(){
            return{
                templateUrl:'components/ipCalculator.html'
            }
        });
})();