<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script>

/* count */
var intro_count = 1;
var countEl = document.form1.getElementById("intro_count");

function plus()
{
  alert('df');
  intro_count++;
  countEl.value = intro_count;
  //plus(document.form1); 
}
function minus(){
  if (count > 1) {
    intro_count--;
    countEl.value = intro_count;
  }  
}


 function my_calc(item, item_count, item_sum){ 

      if(item_count.value=="")    var count = 0; 
      else                        var count = item_count.value; 

      item_sum.value = eval(item.value) * eval(count) ; 

  my_total(document.form1); 
  
  } 

function my_total(f){ 
  f.total.value = eval(f.intro_sum.value)+ eval(f.main_sum.value) + eval(f.subpage_sum.value); 
} 

</script>

</head>
<body>
<form name="form1"> 

인트로(20만원)
<input type=hidden name="intro" value="200000">&nbsp;&nbsp; 
수량: <input type=text name="intro_count" size=3 onkeyup="my_calc(this.form.intro, this.form.intro_count, this.form.intro_sum)" value="1" id="intro_count"> 
<input type="button" value="-" id="minus" onclick="minus()">
<input type="button" value="+" id="plus" onclick="plus()">
합계: <input type=text name="intro_sum" size=6 readonly value="0"><br><br> 


메인(10만원)<input type=hidden name="main" value="100000">&nbsp;&nbsp; 
수량: <input type=text name="main_count"  size=3  onkeyup="my_calc(this.form.main, this.form.main_count, this.form.main_sum)"> 
합계: <input type=text name="main_sum" size=6 readonly value="0"><br><br> 


서브페이지(2만원)<input type=hidden name="subpage" value="20000">&nbsp;&nbsp; 
수량: <input type=text name="subpage_count"  size=3 onkeyup="my_calc(this.form.subpage, this.form.subpage_count, this.form.subpage_sum)"> 
합계: <input type=text name="subpage_sum" size=6 readonly value="0"><br><br> 





전체 합계: <input type=text name="total" size=9 value="0"> 




</form>
</body>
</html>