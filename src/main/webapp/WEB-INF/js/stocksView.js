/**
 * 자산 +/- 별 css 분리하기 위함
 * 속성 추가 삭제 용
 */

const stocks = document.getElementsByClassName('assetTable table')
const btns = document.querySelectorAll('.edit-buttons')

for (var i = 0; i < stocks.length; i++) {
	stocks[i].setAttribute('class', 'table table-hover assetTable index' + i)
	btns[i].setAttribute('class', 'pull-right edit-buttons index' + i);
	let ratio = stocks[i].querySelector(' span').textContent;
// 수익률 - 인 종목 골라서 클래스 속성 추가
	if(parseInt(ratio) < 0){
		stocks[i].querySelector('.ratio').setAttribute('class', 'ratio minus');
	}
	
	
}

function deleteFuntion(obj) {
	const name = obj;
	location.href = '../jsp/stock.jsp?job=delete&name='+encodeURIComponent(name);
}

function updateFunction(obj) {
//	console.log(obj);
	location.href = '../jsp/stock.jsp?job=show&name='+obj;
}
