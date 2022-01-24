<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/css/base.css" rel="stylesheet">
<script>
		function checkFn(type){
			if(type == 'id'){
				var checkId = /^[a-z]+[a-z0-9]{5,20}/g;
				var value = document.frm.id.value;
				var span = document.getElementsByClassName("id")[0].getElementsByTagName("span")[0];
				if(value == ""){
					span.textContent = "필수 정보입니다";
					span.style.color = "red";
					span.style.display = "inline";
				}else if(!checkId.test(value)){
					span.textContent = "형식오류 입니다";
					span.style.color = "red";
					span.style.display = "inline";
				}else{
					span.textContent = "";
					span.style.display = "none";
				}
			}else if(type == 'pass'){
				var checkId = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
				var value = document.frm.password.value;
				var span = document.getElementsByClassName("password")[0].getElementsByTagName("span")[0];
				if(value == ""){
					span.textContent = "필수 정보입니다";
					span.style.color = "red";
					span.style.display = "inline";
				}else if(!checkId.test(value)){
					span.textContent = "*형식오류";
					span.style.color = "red";
					span.style.display = "inline";
				}else{
					span.textContent = "";
					span.style.display = "none";
				}
			}else if(type == 'passre'){
				var value = document.frm.password.value;
				var value2 = document.frm.passwordre.value;
				var span = document.getElementsByClassName("passwordre")[0].getElementsByTagName("span")[0];
				if(value2 == ""){
					span.textContent = "필수 정보입니다";
					span.style.color = "red";
					span.style.display = "inline";
				}else if(value != value2){
					span.textContent = "*비밀번호 불일치";
					span.style.color = "red";
					span.style.display = "inline";
				}else{
					span.textContent = "";
					span.style.display = "none";
				}
			}else if(type == 'name'){
				var checkName = /^[가-힣]/g;
				var value = document.frm.name.value;
				var span = document.getElementsByClassName("name")[0].getElementsByTagName("span")[0];
				if(value == ""){
					span.textContent = "필수 정보입니다";
					span.style.color = "red";
					span.style.display = "inline";
				}else if(!checkName.test(value)){
					span.textContent = "*형식오류";
					span.style.color = "red";
					span.style.display = "inline";
				}else{
					span.textContent = "";
					span.style.display = "none";
				}
			}else if(type == 'phone'){
				var checkPhone2 = /^[0-9]{11,19}/g;
				var value = document.frm.phone2.value;
				var span = document.getElementsByClassName("phone")[0].getElementsByTagName("span")[0];
				if(value == ""){
					span.textContent = "필수 정보입니다";
					span.style.color = "red";
					span.style.display = "inline";
				}else if(!checkPhone2.test(value)){
					span.textContent = "*형식오류";
					span.style.color = "red";
					span.style.display = "inline";
				}else{
					span.textContent = "";
					span.style.display = "none";
				}
			}
		}
		
		function sumbitFn(){
			var result = true;
			var checkId = /^[a-z]+[a-z0-9]{5,15}/g;
			var value = document.frm.id.value;
			var span = document.getElementsByClassName("id")[0].getElementsByTagName("span")[0];
			if(value == ""){
				span.textContent = "필수 정보입니다";
				span.style.color = "red";
				span.style.display = "inline";
				 result = false;
			}else if(!checkId.test(value)){
				span.textContent = "*형식오류";
				span.style.color = "red";
				span.style.display = "inline";
				result = false;
			}else{
				span.textContent = "";
				span.style.display = "none";
			}
			
			
			var checkPass = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			value = document.frm.password.value;
			span = document.getElementsByClassName("password")[0].getElementsByTagName("span")[0];
			if(value == ""){
				span.textContent = "필수 정보입니다";
				span.style.color = "red";
				span.style.display = "inline";
				result = false;
			}else if(!checkPass.test(value)){
				span.textContent = "*형식오류";
				span.style.color = "red";
				span.style.display = "inline";
				result = false;
			}else{
				span.textContent = "";
				span.style.display = "none";
			}
			
			
			value = document.frm.password.value;
			var value2 = document.frm.passwordre.value;
			span = document.getElementsByClassName("passwordre")[0].getElementsByTagName("span")[0];
			if(value2 == ""){
				span.textContent = "필수 정보입니다";
				span.style.color = "red";
				span.style.display = "inline";
				result = false;
			}else if(value != value2){
				span.textContent = "*비밀번호 불일치";
				span.style.color = "red";
				span.style.display = "inline";
				result = false;
			}else{
				span.textContent = "";
				span.style.display = "none";
			}
			
			
			var checkName = /^[가-힣]/g;
			value = document.frm.name.value;
			span = document.getElementsByClassName("name")[0].getElementsByTagName("span")[0];
			if(value == ""){
				span.textContent = "필수 정보입니다";
				span.style.color = "red";
				span.style.display = "inline";
				result = false;
			}else if(!checkName.test(value)){
				span.textContent = "*형식오류";
				span.style.color = "red";
				span.style.display = "inline";
				result = false;
			}else{
				span.textContent = "";
				span.style.display = "none";
			}
			
			
			var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/g;
			value = document.frm.email.value;
			span = document.getElementsByClassName("email")[0].getElementsByTagName("span")[0];
			if(value == ""){
				span.textContent = "필수 정보입니다";
				span.style.color = "red";
				span.style.display = "inline";
				result = false;
			}else if(!checkEmail.test(value)){
				span.textContent = "*형식오류";
				span.style.color = "red";
				span.style.display = "inline";
				result = false;
			}else{
				span.textContent = "";
				span.style.display = "none";
			}
			
			
			var checkPhone2 = /^[0-9]{3,4}/g;
			value = document.frm.phone2.value;
			span = document.getElementsByClassName("phone")[0].getElementsByTagName("span")[0];
			if(value == ""){
				span.textContent = "필수 정보입니다";
				span.style.color = "red";
				span.style.display = "inline";
				result = false;
			}else if(!checkPhone2.test(value)){
				span.textContent = "*형식오류";
				span.style.color = "red";
				span.style.display = "inline";
				result = false;
			}else{
				span.textContent = "";
				span.style.display = "none";
			}
			
			
			var checkPhone3 = /^[0-9]{4}/g;
			value = document.frm.phone3.value;
			span = document.getElementsByClassName("phone")[0].getElementsByTagName("span")[0];
			if(value == ""){
				span.textContent = "필수 정보입니다";
				span.style.color = "red";
				span.style.display = "inline";
				result = false;
			}else if(!checkPhone3.test(value)){
				span.textContent = "*형식오류";
				span.style.color = "red";
				span.style.display = "inline";
				result = false;
			}else{
				span.textContent = "";
				span.style.display = "none";
			}
			
			if(result){
				document.frm.submit();
			}
		}
	</script>
</head>
<body>
	<%@ include file="/header.jsp" %>
	<section>
		<form action="login.jsp" method="post">
			<div class="row_group">
				<div class=id>
					<h3><label for="id">아이디</label></h3>
					<span><input type="text" id="id" name="id" maxlength="20" onblur="checkFn('id')"></span>
				</div>
				<div class="password">
					<h3><label for="pwd1">비밀번호</label></h3>
					<span><input type="password" id="pwd1" name="pwd" maxlength="20" onblur="checkFn('pass')"></span>
				</div>
				<div class="passwordre">
					<h3><label for="pwd2">비밀번호 재확인</label></h3>
					<span><input type="password" id="pwd2" name="pwdre" maxlength="20" onblur="checkFn('passre')"></span>
				</div>
			</div>
			<div class="name">
				<h3><label for="name">이름</label></h3>
				<span><input type="text" id= "name" name="name" maxlength="20" onblur="checkFn('name')"></span>
			</div>
			<div class="birth">
				<div class=birth_yy>
					<h3><label for="yy">생년월일</label></h3>
					<span><input type="text" id="yy" name="yy" maxlength="4" placeholder="년4자()" onblur="checkFn('birth')"></span>
				</div>
				<div class="birth_mm">
					<select id="mm">
						<option selected>월</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>
				</div>
				<div class="birth_dd">
					<span><input type="text" id="dd" name="dd" maxlength="2" placeholder="일" onblur="checkFn('day')"><span>
				</div>
			</div>
			<div class="gender">
				<h3><label for="gender">성별</label></h3>
					<select id="gender">
						<option selected>성별</option>
						<option>남</option>
						<option>여</option>
					</select>
			</div>
			<div class="phoneNo">
				<h3><label for="phone">연락처</label></h3>
				<span><input type="tel" id="phoneNo" name="phoneNo" placeholder="전화번호 입력" maxlength="16" onblur="checkFn('phone')"></span>
			</div>
			<div class="join">
				<span><input type=submit value="가입하기" onclick="submitFn()"><span>
			</div>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>