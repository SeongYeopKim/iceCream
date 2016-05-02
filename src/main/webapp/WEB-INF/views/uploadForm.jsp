<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="upload1" method="post" enctype="multipart/form-data">
파일명 <input type="file" name="theFile"><br>
셀명<input type="text" name="theText"><br>
<input type="submit" value="업로드">
</form>
</body>
</html>