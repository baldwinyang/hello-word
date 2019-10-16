<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<meta http-equiv="Content-Type" content="text/html; charset=uft-8">
<title>Insert title here</title>
<style>
th, tr, td, table {
	border: 1px solid red;
}
</style>
</head>

<script type="text/javascript">
function submitTable(){
var account = document.getElementById("account").value;
var name=document.getElementById("name").value;
var password=document.getElementById("password").value;
row = document.getElementById("table").insertRow();
if(row!=null){
cell=row.insertCell();
cell.innerHTML=account;
cell = row.insertCell();
cell.innerHTML=name;
cell = row.insertCell();
cell.innerHTML=password;
}
return false;
}
</script>
<body>
<form onsubmit="return submitTable()">
账号：<input type="text" id="account"><br>
姓名：<input type="text" id="name"><br>
密码：<input type="password" id="password"><br>
<input name="submit" type="button" id="submit" value="提交" onclick="return submitTable()">
</form>
<hr>
<table border="1" width="50%" align="center" id="table">
<tr>
<th>账号</th><th>姓名</th><th>密码</th>
</tr>
</table>
</body>
</html>
