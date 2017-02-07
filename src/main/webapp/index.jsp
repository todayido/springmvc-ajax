<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Index</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script type="text/javascript" src="jquery-3.0.0.js"></script>
   </head>
   <script type="text/javascript">
   
        function ajax(){
            $.post(
                "ajax.do",
                {'name':$("#uname").val()},
                function(data){
                    alert(data);
                }
             );
        }
        
        function getData(){
            $.post(
                "json.do",
                function(data){
                    console.log(data);
                    var html = "";
                    for(var i=0;i<data.length;i++){
                        html += "<tr><td>"+data[i].id+"</td>"; 
                        html += "<td>"+data[i].name+"</td>"; 
                        html += "<td>"+data[i].sex+"</td></tr>"; 
                    }
                    $("#content").html(html);
                }
             );
        }
   </script>
  
<body>
    <h2>AJAX</h2>
    <input type="text" name="uname" id="uname">
    <button onclick="ajax()">Check Data</button>
    <h2>JSON</h2><br/>
    <button onclick="getData()">Get Data</button><br/>
    <table>
        <tr>
            <td>编号</td>
            <td>姓名</td>
            <td>性别</td>
        </tr>
        <tbody id="content"></tbody>
    </table>
</body>
</html>
