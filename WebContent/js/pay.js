$(document).ready(function(){
	
	$('#minus1').click(function(){
		var stat = $('#expense_amount1').val();
		var num = stat * 1;
		num--;
		if(num <= -1){
			alert('0개 이하로 수량을 선택하실 수 없습니다');
			num=0;
		}
		var expense_price = parseInt($('#expense_price1').attr('value'));
		expense_price *=1;
		expense_price *=num;
		console.log('expense_price1' + expense_price);
		$('#expense_amount1').val(num);
		$('#expense_total1').val(expense_price);
		
		var expense_total1 = $('#expense_total1').val();
		var expense_total2 = $('#expense_total2').val();
		var expense_total3 = $('#expense_total3').val();
		var total_price = eval(expense_total1+'+'+expense_total2+'+'+expense_total3);
		$('#total_price').val(total_price);
	});
	$('#plus1').click(function(){
		var stat = $('#expense_amount1').val();
		var num = stat * 1;
		console.log(num);
		num +=1;
		if(num > 3){
			alert('펀딩 수량은 3개까지 구입가능합니다');
			num=3;
		}
		var expense_price = 0;
		expense_price = $('#expense_price1').attr('value');
		expense_price *=1;
		expense_price *=num;
		console.log('expense_price1' + expense_price);
		$('#expense_amount1').val(num);
		$('#expense_total1').val(expense_price);
		
		var expense_total1 = $('#expense_total1').val();
		var expense_total2 = $('#expense_total2').val();
		var expense_total3 = $('#expense_total3').val();
		var total_price = eval(expense_total1+'+'+expense_total2+'+'+expense_total3);
		$('#total_price').val(total_price);
	});
	/*  */
	
	$('#minus2').click(function(){
		var stat = $('#expense_amount2').val();
		var num = stat * 1;
		num--;
		if(num <= -1){
			alert('0개 이하로 수량을 선택하실 수 없습니다');
			num=0;
		}
		var expense_price = parseInt($('#expense_price2').attr('value'));
		expense_price *=1;
		expense_price *=num;
		console.log('expense_price2' + expense_price);
		$('#expense_amount2').val(num);
		$('#expense_total2').val(expense_price);
		
		var expense_total1 = $('#expense_total1').val();
		var expense_total2 = $('#expense_total2').val();
		var expense_total3 = $('#expense_total3').val();
		var total_price = eval(expense_total1+'+'+expense_total2+'+'+expense_total3);
		$('#total_price').val(total_price);
	});
	$('#plus2').click(function(){
		var stat = $('#expense_amount2').val();
		var num = stat * 1;
		console.log(num);
		num +=1;
		if(num > 3){
			alert('펀딩 수량은 3개까지 구입가능합니다');
			num=3;
		}
		var expense_price = 0;
		expense_price = $('#expense_price2').attr('value');
		expense_price *=1;
		expense_price *=num;
		console.log('expense_price2' + expense_price);
		$('#expense_amount2').val(num);
		$('#expense_total2').val(expense_price);
		
		var expense_total1 = $('#expense_total1').val();
		var expense_total2 = $('#expense_total2').val();
		var expense_total3 = $('#expense_total3').val();
		var total_price = eval(expense_total1+'+'+expense_total2+'+'+expense_total3);
		$('#total_price').val(total_price);
	});
	
	/*  */
	
	$('#minus3').click(function(){
		var stat = $('#expense_amount3').val();
		var num = stat * 1;
		num--;
		if(num <= -1){
			alert('0개 이하로 수량을 선택하실 수 없습니다');
			num=0;
		}
		var expense_price = parseInt($('#expense_price3').attr('value'));
		expense_price *=1;
		expense_price *=num;
		console.log('expense_price3' + expense_price);
		$('#expense_amount3').val(num);
		$('#expense_total3').val(expense_price);
		
		var expense_total1 = $('#expense_total1').val();
		var expense_total2 = $('#expense_total2').val();
		var expense_total3 = $('#expense_total3').val();
		var total_price = eval(expense_total1+'+'+expense_total2+'+'+expense_total3);
		$('#total_price').val(total_price);
	});
	$('#plus3').click(function(){
		var stat = $('#expense_amount3').val();
		var num = stat * 1;
		console.log(num);
		num +=1;
		if(num > 3){
			alert('펀딩 수량은 3개까지 구입가능합니다');
			num=3;
		}
		var expense_price = 0;
		expense_price = $('#expense_price3').attr('value');
		expense_price *=1;
		expense_price *=num;
		console.log('expense_price3' + expense_price);
		$('#expense_amount3').val(num);
		$('#expense_total3').val(expense_price);
		
		var expense_total1 = $('#expense_total1').val();
		var expense_total2 = $('#expense_total2').val();
		var expense_total3 = $('#expense_total3').val();
		var total_price = eval(expense_total1+'+'+expense_total2+'+'+expense_total3);
		$('#total_price').val(total_price);
	});
	
	$('#pd_opcontent1').click(function() {
		$('.option1_div').slideToggle();
		$('#expense_amount1').val('0');
		$('#expense_total1').val('0');
		var expense_total1 = $('#expense_total1').val();
		var expense_total2 = $('#expense_total2').val();
		var expense_total3 = $('#expense_total3').val();
		var total_price = eval(expense_total1+'+'+expense_total2+'+'+expense_total3);
		$('#total_price').val(total_price);
	});
	$('#pd_opcontent2').click(function() {
		$('.option2_div').slideToggle();
		$('#expense_amount2').val('0');
		$('#expense_total2').val('0');
		var expense_total1 = $('#expense_total1').val();
		var expense_total2 = $('#expense_total2').val();
		var expense_total3 = $('#expense_total3').val();
		var total_price = eval(expense_total1+'+'+expense_total2+'+'+expense_total3);
		$('#total_price').val(total_price);
	});
	$('#pd_opcontent3').click(function() {
		$('.option3_div').slideToggle();
		$('#expense_amount3').val('0');
		$('#expense_total3').val('0');
		var expense_total1 = $('#expense_total1').val();
		var expense_total2 = $('#expense_total2').val();
		var expense_total3 = $('#expense_total3').val();
		var total_price = eval(expense_total1+'+'+expense_total2+'+'+expense_total3);
		$('#total_price').val(total_price);
	});
	
});//$(document).ready 끝


