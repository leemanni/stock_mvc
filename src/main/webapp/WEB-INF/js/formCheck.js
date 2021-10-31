$(()=>{
	$('.login-form').submit(function(e) {
		const id = $.trim($('#id').val()).length;
		const pw = $.trim($('#pw').val()).length;
		if(id==0 || pw ===0){
			alert('아이디와 패스워드를 입력하세요')
			e.preventDefault();
			$('.login-form')[0].reset();
			$('#id').focus();
		}
	})
	
	$('.writeMemo-form').submit(function(e) {
		const memo = $.trim($('.memo-textArea:eq(0)').val()).length;
		alert(memo);
		e.preventDefault();
	})
	
	
} )

function clickClose() {
	$('.addAsset-form')[0].reset();
	$('.writeMemo-form textarea').val('');
}


