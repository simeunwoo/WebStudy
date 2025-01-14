<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
	margin-top:50px;
}
.row{
	margin:0px auto;
	width:600px;
}
</style>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
/*
 * 	브라우저 자체에서 처리 : JavaScript
 
 	JavaScript : 사용자 이벤트 (사용자 선택, 마우스 클릭 ...)
 		=> on~ : 많이 사용하는 event
 			onclick : 버튼, 이미지 클릭 시 처리
 			onchange : select => 콤보 박스 => 선택이 변경된 경우
 			onmouseover : 이미지, text => 마우스 커서로 갔다 댔을 때
 			onmouseout
 			onkeyup / onkeydown
 */
let bCheck=false
function boardDelete(){
	if(bCheck===false)
	{
		let btn=document.querySelector("#delBtn")
		btn.value='취소'
		let tr=document.querySelector("#delTr")
		tr.style.display=''
		bCheck=true
	}
	else
	{
		let btn=document.querySelector("#delBtn")
		btn.value='삭제'
		let tr=document.querySelector("#delTr")
		tr.style.display='none'
		bCheck=false
	}
}

let boardRealDelete=(no)=>{
	let pwd=document.querySelector("#pwd")
	if(pwd.value.trim()==="")
	{
		alert("비밀 번호를 입력하세요")
		pwd.focus()
		return
	}
	// 서버로 삭제 요청
	// delete.do?no=1&pwd=1234
	axios.get('delete.do',{
		params:{
			no:no,
			pwd:pwd.value
		}
	}).then(function(response){
		// 서버에서 결과값을 받을 수 있다 => response : 결과값
		// yes/no
		if(response.data==='no')
		{
			alert("비밀 번호 틀렸어요\n다시 쓰세요")
			pwd.value=''
			pwd.focus()
		}
		else
		{
			// 삭제가 된 상태
			location.href="list.do" // 자바스크립트에서 이동
		}
	})
}
</script>
</head>
<body>
		<div class="container clear">
			<div class="row">
				<h3 class="text-center">내용 보기</h3>
				<table class="table">
					<tr>
						<th width="20%" class="text-center">번호</th>
						<td width="30%" class="text-center">${vo.no }</td>
						<th width="20%" class="text-center">작성일</th>
						<td width="30%" class="text-center">${vo.dbday }</td>
					</tr>
					<tr>
						<th width="20%" class="text-center">이름</th>
						<td width="30%" class="text-center">${vo.name }</td>
						<th width="20%" class="text-center">조회수</th>
						<td width="30%" class="text-center">${vo.hit }</td>
					</tr>
					<tr>
						<th width="20%" class="text-center">제목</th>
						<td colspan="3">${vo.subject }</td>
					</tr>
					<tr>
						<td colspan="4" class="text-left" valign="top" height="200">
<pre style="white-space:pre-wrap;background-color:white;border:none">
${vo.content }
</pre>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="text-right">
							<a href="update.do?no=${vo.no }" class="btn btn-xs btn-info">수정</a>
							<input type="button" class="btn btn-xs btn-success" value="삭제"
								onclick="boardDelete()" id="delBtn">
							<a href="../board/list.do" class="btn btn-xs btn-danger">목록</a>
						</td>
					</tr>
					<tr id="delTr" style="display:none">
						<td colspan="4" class="text-right">
							비밀 번호 : <input type="password" id="pwd" size="15" class="input-sm">
							<input type="button" value="삭제" class="btn btn-sm btn-warning"
								onclick="boardRealDelete(${vo.no})">
						</td>
					</tr>					
				</table>
			</div>
		</div>
	
</body>
</html>