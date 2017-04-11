var days=new  Array ("日", "一", "二", "三", "四", "五", "六");
function showDT() {
	var currentDT = new Date();
	var y,m,date,day,hs,ms,ss,theDateStr;
	y = currentDT.getFullYear(); //四位整数表示的年份
	if(y<1900) y = y+1900;
	m = currentDT.getMonth()+1; //月
	if(m<10) m = '0' + m;
	date = currentDT.getDate(); //日
	if(date<10) date = '0' + date;
	day = currentDT.getDay(); //星期  
	hs = currentDT.getHours(); //时
	if(hs<10) hs = '0' + hs;
	ms = currentDT.getMinutes(); //分
	if(ms<10) ms = '0' + ms;
	ss = currentDT.getSeconds(); //秒
	if(ss<10) ss = '0' + ss;
	theDateStr = y+"年"+  m +"月"+date+"日"+" "+" "+" "+hs+":"+ms+":"+ss +" "+" "+" "+"星期"+days[day] ;
	$(".timeclick").text(theDateStr)
	// setTimeout 在执行时,是在载入后延迟指定时间后,去执行一次表达式,仅执行一次
	window.setTimeout( showDT, 1000);
}
 
