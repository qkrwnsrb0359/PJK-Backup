function check(){
		if(!f.subject.value){
			alert("제목 입력");
			f.subject.focus();
			return;
		}
		if(!f.content.value){
			alert("내용 입력");
			f.content.focus();
			return;
		}
		if(!f.writer.value){
			alert("이름 입력");
			f.writer.focus();
			return;
		}
		if(!f.email.value){
			alert("이메일 입력");
			f.email.focus();
			return;
		}
		if(!f.pwd.value){
			alert("비밀번호 입력");
			f.pwd.focus();
			return;
		}
		document.f.submit();
	} 