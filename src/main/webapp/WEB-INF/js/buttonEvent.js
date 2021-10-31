/**
 * stocksView 의 버틀들의 관한 모든 이벤트 사항 
 */

const searchRequest = new XMLHttpRequest();
const insertRequest = new XMLHttpRequest();


// 자산 추가
const add_form = document.getElementById('addAsset-form');
add_form.addEventListener('submit', function(e) {
	const name = document.querySelector(".addAsset-form input[name=name]").value;
	const ownStocks = document.querySelector(".addAsset-form input[name=ownStocks]").value;
	const pPrice = document.querySelector(".addAsset-form input[name=pPrice]").value;
	const cPrice = document.querySelector(".addAsset-form input[name=cPrice]").value;
	
	console.log(name, ownStocks, pPrice, cPrice, job);
	const url = 'insert?name=' + encodeURIComponent(name) +
				'&ownStocks='+ ownStocks +
				'&pPrice=' + pPrice +
				'&cPrice=' + cPrice +
	
	console.log(url);
	
	insertRequest.open('get', url, true);
	insertRequest.onreadystatechange = insertProcess;
	insertRequest.send(null);
	
	e.preventDefault();
});

function insert(obj) {
	const name = document.querySelector(".addAsset-form input[name=name]").value;
	const ownStocks = document.querySelector(".addAsset-form input[name=ownStocks]").value;
	const pPrice = document.querySelector(".addAsset-form input[name=pPrice]").value;
	const cPrice = document.querySelector(".addAsset-form input[name=cPrice]").value;
	
	console.log(name, ownStocks, pPrice, cPrice, job);
	const url = 'insert?name=' + encodeURIComponent(name) +
				'&ownStocks='+ ownStocks +
				'&pPrice=' + pPrice +
				'&cPrice=' + cPrice +
	
	console.log(url);
	
	insertRequest.open('get', url, true);
	insertRequest.onreadystatechange = insertProcess;
	insertRequest.send(null);
	
	e.preventDefault();
}

function insertProcess() {
	var result = insertRequest.responseText
	if(result == 1){
		// 저장이 잘 되면 테이블에 저장된 다음 데이터를 입력하기 위햐 입력 상자의 내용을 지운다.
		document.querySelector(".addAsset-form input[name=name]").value = "";
		document.querySelector(".addAsset-form input[name=ownStocks]").value = "";
		document.querySelector(".addAsset-form input[name=pPrice]").value = "";
		document.querySelector(".addAsset-form input[name=job]").value = "";
		// 입력된 데이터가 화면에 표시 되어야 하므로 데이터를 얻어오는 합수를 실행한다.
		serachFunction();
	}else{
		alert('등록 실패!!')
	}
}



function serachFunction() {
	const url = '../jsp/stock.jsp?job=search';
	searchRequest.open('post', url, true);
//	searchRequest.onreadystatechange = searchProcess;
	searchRequest.send(null);
}
























