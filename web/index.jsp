<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>springmvc</title>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/frame.js"></script>
<script type="text/javascript">
    var url = window.location.origin + '/'
            + window.location.pathname.split('/')[1];
    var result;
    var page = 1;
    var pageSize = 1;
    var getXMLHttpRequest = function() {
        var xmlhttp;
        if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {// code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        return xmlhttp;
    };
    window.onload = function() {
        Frame();
        document.getElementById('addUser').addEventListener('click',
                function() {
                    var xmlhttp = getXMLHttpRequest();
                    xmlhttp.open('post', url + '/user/addUser', true);
                    xmlhttp.send();
                }, false);
        document.getElementById('getUserList').addEventListener(
                'click',
                function() {
                    var xmlhttp = getXMLHttpRequest();
                    xmlhttp.open('post', url + '/user/getUserList', false);
                    xmlhttp.setRequestHeader('Content-type',
                            'application/x-www-form-urlencoded');
                    xmlhttp.onreadystatechange = function() {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                            result1 = xmlhttp.responseText;
                            result = eval('(' + xmlhttp.responseText + ')');
                            var foreach = document.getElementById('foreach');
                            var html = '';
                            for (var i = 0; i < result.userList.length; i++) {
                                var user = result.userList[i];
                                html += '<tr>';
                                for ( var prop in user) {
                                    if (user.hasOwnProperty(prop)) {
                                        html += '<td>' + prop + '</td>';
                                    }
                                }
                                html += '</tr>';
                            }
                            for (var i = 0; i < result.userList.length; i++) {
                                var user = result.userList[i];
                                html += '<tr>';
                                for ( var prop in user) {
                                    if (user.hasOwnProperty(prop)) {
                                        html += '<td>' + user[prop] + '</td>';
                                    }
                                }
                                html += '</tr>';
                            }
                            foreach.innerHTML = html;
                        }
                    };
                    xmlhttp.send('page=' + page + '&pageSize=' + pageSize);
                }, true);
    };
</script>
</head>
<body>
 <input type="button" id="addUser" value="添加用户" />
 <input type="button" id="getUserList" value="分页获取用户列表" />
 <table id="foreach" border="1">
  <frame:foreach list="result.userList" var="user">
   <tr>
    <td>{{user['id']}}</td>
   </tr>
  </frame:foreach>
 </table>
</body>
</html>