function CheckAddProduct() {
		
	var productId = document.getElementById("productId");
	var name = document.getElementById("name");
	var description = document.getElementById("description");
	var manufacturer = document.getElementById("manufacturer");
	var unitPrice = document.getElementById("unitPrice");
	var unitsInStock = document.getElementById("unitsInStock");
	var regExpId = /^[a-zA-Z0-9-_]{3,20}$/;
	var regExpMa = /^[가-힣a-zA-Z]+$/;
	
	// 상품코드 체크
	if (!regExpId.test(productId.value)) {
		alert("[상품코드]\n 영문자와 숫자 또는 -와 _만 입력하세요\n 3자 이상에서 최대 20자까지 입력하세요");
		productId.select();
		productId.focus();
		return false;
	}
	/*
	if (productId.value.length < 3 || productId.value.length > 20) {
		alert("[상품코드]\n 3자 이상에서 최대 20자까지 입력하세요");
		productId.select();
		productId.focus();
		return false;
	}
	*/
	// 상품명 체크
	if (name.value.length < 2 || name.value.length > 20) {
		alert("[상품명]\n최소 2자에서 최대 20자까지 입력하세요");
		name.select();
		name.focus();
		return false;
	}
	
	// 상품 가격 체크
	if (unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
		alert("[가격]\n숫자만 입력하세요");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	if (unitPrice.value < 0) {
		alert("[가격]\n음수를 입력할 수 없습니다");
		unitPrice.select();
		unitPrice.focus();
		return false;
	} else if (!check(/^\d+(?:[.]?[\d]?[\d])?$/, unitPrice,
			"[가격]\n소수점 둘째 자리까지만 입력하세요")) {
		return false;
	}

	// 상세설명 체크
	if (description.value.length == 0) {
		alert("[상세설명]\n 입력하세요");
		description.select();
		description.focus();
		return false;
	}

	// 제조사 체크
	if (!regExpMa.test(manufacturer.value)) {
		alert("[제조사]\n 영문자와 한글을 입력하세요");
		manufacturer.select();
		manufacturer.focus();
		return false;
	}	
	if (manufacturer.value.length < 2 || manufacturer.value.length > 20) {
		alert("[제조사]\n 2자 이상에서 최대 20자까지 입력하세요");
		manufacturer.select();
		manufacturer.focus();
		return false;
	}
		
	// 재고 수 체크
	if (isNaN(unitsInStock.value)) {
		alert("[재고 수]\n숫자만 입력하세요");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}
	if (unitsInStock.value < 1) {
		alert("[재고 수]\n 1 이상 입력할 수 없습니다");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}	

	
	function check(regExp, e, msg) {

		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}

	 document.newProduct.submit()
}