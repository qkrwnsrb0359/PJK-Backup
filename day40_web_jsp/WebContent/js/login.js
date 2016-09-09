function sendData() {
   var f = document.form;

   if (f.id.value == "") {
      window.alert("ID를 반드시 입력하세요.");
      f.id.focus();
      return false;
   }

   if (f.id.value.length < 4 || f.id.value.length > 20) {
      window.alert("ID는 4자 이상 20자 이하 입니다.");
      f.id.select();
      return false;
   }

   if (f.pw.value == "") {
      window.alert("PassWord를 반드시 입력하세요.");
      f.pw.focus();
      return false;
   }
   
   if (f.pw.value.length < 4 || f.pw.value.length > 20) {
	      window.alert("Password는 4자 이상 20자 이하 입니다.");
	      f.pw.select();
	      return false;
	   }
   f.submit();
}