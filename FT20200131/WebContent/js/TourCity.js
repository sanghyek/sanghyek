	//스크롤로 메뉴위치확인
$(document).ready(function() {
	if($("#test").val()!=null){
        
		var citytest=$("#test").val();
		
		var regex= /[^a-z]/gi;
		city = citytest.replace(regex,"");//입력한 도시정보 가져옴
		
		var img ="img/"+city+".jpg";
		
		$("#mainimg").attr("src",img);
		
		var atmos;
				
		var key = 'd70cd7fec99558cde8ada8d746de18ae';

		$.ajax({/* ajax는 새로고침할 필요없이 버튼을 클릭하면 자동으로 새로 기능이 수행하게끔 해준다. */

		url: 'http://api.openweathermap.org/data/2.5/weather',//이미지

		dataType: 'json',

		type: 'GET',

		data: {q:city, appid:key, units:'metric'},//도시 API키 단위법:섭씨, 키, 기간

		success: function(data){//출력부

		var wf = '';

		var atmos = "";

		$.each(data.weather, function(index, val){

		wf += '<p><b><font size=6>' + data.name + '</p></b></font>' +

		data.main.temp + 'C ' + ' | ' + val.main + ", " +

		val.description

		atmos = val.main;//날씨를 변수로 지정



		});//선택한 요소의 속성src의 이미지 값을 weatherImg에 줌

		$("#showWeatherForcast").html(wf);

		}

		});
	}
	var jbOffset = $ ('nav').offset();
	$(window).scroll(function(){
		if($(document).scrollTop()>jbOffset.top) {
			$('nav').addClass('jbFixed');
			}
			else{
				$('nav').removeClass('jbFixed');
				}
	});
	//사이드메뉴
$(window).scroll(  
    function(){  
        //스크롤의 위치가 상단에서 800보다 크면  
        if($(window).scrollTop() > 738){  
            $('aside').addClass("sidefixed");  
            //위의 if문에 대한 조건 만족시 fixed라는 class를 부여함  
        }else{  
            $('aside').removeClass("sidefixed");  
            //위의 if문에 대한 조건 아닌경우 fixed라는 class를 삭제함  
        }  
    }  
);
});


//시간

function city_time() {
	
	var f = document.cnjform;

city_today = new Date();
city_year = city_today.getYear();
city_month = city_today.getMonth();
city_month = city_month + 1;
city_day = city_today.getDate();
city_hours = city_today.getHours();
city_minutes = city_today.getMinutes();
city_seconds = city_today.getSeconds();

zone = f.cityname.options[f.cityname.selectedIndex].value;
city_zone = f.cityname.options[f.cityname.selectedIndex].text
city_hours = parseInt(city_hours) + parseInt(zone);

if (city_hours < 0)
{
city_hours = city_hours + 24;
city_day = city_day - 1;
}

if (city_hours > 23)
{
city_hours = city_hours - 24;
city_day = city_day + 1;
}
var city_time1=((city_hours>12)?city_hours -12:city_hours)+((city_minutes<10)?":0":":")+city_minutes;
var city_time2=(city_hours>=12)?" PM ":" AM "
var city_time3=((city_month<10)?"0":"")+city_month+ " 월 " + ((city_day<10)?"0":"")+city_day+ " 일";

var time="현지시간 "+ city_time2 + city_time1 +"   "+city_time3;

$("#cityname").html(time);


f.citylabel.html =  city_zone;
alert(city_zone);
f.cityinfoname.value= city_zone;
ab.dosi.value=str;


setTimeout("city_time()", 1000);

var regex= /[^a-z]/gi;
var regek= /[^ㄱ-힣]/gi;
str = city_zone.replace(regex,"");
ktr = city_zone.replace(regek,"");


}

//날씨
$(document).ready(function(){

$("#getWeatherForcast").click(function(){

var atmos;

var city = $("#city").val();//입력한 도시정보 가져오는듯 - 단일 모드

var key = 'd70cd7fec99558cde8ada8d746de18ae';

$.ajax({/* ajax는 새로고침할 필요없이 버튼을 클릭하면 자동으로 새로 기능이 수행하게끔 해준다. */

url: 'http://api.openweathermap.org/data/2.5/weather',//이미지

dataType: 'json',

type: 'GET',

data: {q:city, appid:key, units:'metric'},//도시 API키 단위법:섭씨, 키, 기간

success: function(data){//출력부

var wf = '';

var atmos = "";

$.each(data.weather, function(index, val){

wf += '<p><b><font size=6>' + data.name + '</p></b></font>' +

data.main.temp + 'C ' + ' | ' + val.main + ", " +

val.description

atmos = val.main;//날씨를 변수로 지정



});//선택한 요소의 속성src의 이미지 값을 weatherImg에 줌

$("#showWeatherForcast").html(wf);

}

});

});

});

