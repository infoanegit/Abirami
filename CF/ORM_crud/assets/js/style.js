$(document).ready(function(){
	$("form").on('submit', function() {  
		var Ename = $('#empname').val();
		var Eage = $('#empage').val();
		if(Ename==""){
			alert("please enter the employee name");
			return false;
		}
		else if(!/^[a-zA-Z]*$/.test(Ename)){
			alert("enter your valid username");
			return false;
		}
		else if(Eage==""){
			alert("please enter the employee age");
			return false;
		}
		else if(/[^0-9]|^0+(?!$)/g.test(Eage)){
			alert("enter your numeric age"); 
			return false;
		}
	});	
});
