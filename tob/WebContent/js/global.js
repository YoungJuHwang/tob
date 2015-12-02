var Global = {
		init : function() {
			//함수내부는 절차지향임.
			var wrap = document.createElement('div');
			wrap.id = 'wrap';
			document.body.appendChild(wrap);
			
			var header = document.createElement('div');
			header.id = 'header'; //<div id='header'> </div> 만든거랑 같음. body는 안보이지 존재함.
			document.body.appendChild(header); //document는 가상의 최상위 객체. html에서 body를 제외한 header부분을 추가함.
			
			var outbox = document.createElement('div');
			outbox.id = 'outbox';
			document.body.appendChild(outbox);
			
			var footer = document.createElement('div');
			footer.id = 'footer';
			document.body.appendChild(footer); //dom객체의 1뎁스 : header, outbox, footer.
			$('<div id="box"></div>').appendTo($('#outbox').empty()); // jquery의 attr에 있음.=> ★★ outbox를 비우고 안에다 box를 추가함,
		} // 함수만 있음. 속성이 존재 x
};

