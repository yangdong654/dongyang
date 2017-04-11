var login = angular.module("user",[]);
var config = [ "$httpProvider", function ($httpProvider) {
    if (!$httpProvider.defaults.headers.get) {
        $httpProvider.defaults.headers.get = {};
    }
    $httpProvider.defaults.headers.common["X-Requested-With"] = 'XMLHttpRequest';
    $httpProvider.defaults.headers.get['Cache-Control'] = 'no-cache';
    $httpProvider.defaults.headers.get['Pragma'] = 'no-cache';
}];
login.config(config);
login.controller("task",["mainService" ,"$filter","$scope" , "$http","$window",
    function(mainService, $filter, $scope, $http ,  $window) {
        $scope.visible =false;
        $scope.user = {
            mobile:"",
            name:"",
        }
        
        $scope.sub = function(callBack){
            if ($("form").valid(null,"error!")==false){
                //$("#error-text").text("error!"); 1.0.4版本已将提示直接内置掉，简化前端。
                return false;
            }
            var data = {};
            data=  mainService.doSave($scope.user).then(function(result) {
                    var success = result.success;
                    data = result;
                    callBack(result);
                    return result;
                },
                function(error){
                    alert("保存失败，请与管理员联系！");
                });
        }
        $scope.getUserById = function(){
             mainService.getUserById(id).then(function(result) {
                  var success = result.success;
                  $scope.user = result.data;
            },
            function(error){
                alert("保存失败，请与管理员联系！");
            });
        }
        
        $scope.setDate = function(obj){
            $scope.user.entryTime = $(obj).val();
        }
        
        if(id > 0){
            $scope.getUserById();
        }
    }
])

login.service("mainService",function($http , $q){
    return {
        doSave : function(user){
            return $http.post(contextPath+'/userController/doSaveAndUpdate', user).then(function(response) {
                return response.data;
            });
        },
        getUserById : function(id){
            return $http.get(contextPath+'/userController/getUserById?id=' + id).then(function(response) {
                return response.data;
            });
        }
    }
})

function doSave(callback ){
    var appElement = document.querySelector('[ng-controller=task]');
    var $scope = angular.element(appElement).scope();
    var  json = $scope.sub(function(json){
        callback(json);
    });
}

function setDate(obj){
    var appElement = document.querySelector('[ng-controller=task]');
    var $scope = angular.element(appElement).scope();
    var  json = $scope.setDate(obj);
}
