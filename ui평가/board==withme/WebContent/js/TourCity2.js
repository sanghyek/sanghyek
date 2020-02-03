/**
 * 
 */
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
    
	setTimeout("city_time()", 1000);

	var regex= /[^a-z]/gi;
	Engcity = city_zone.replace(regex,"");//도시이름을 영어로 뽑는다
	
	$("#cityval").html(city_zone);
	$("#cityval2").html(city_zone);
	$("#clock").html(time);
	
	//메인박스 이미지 바꾸기	
	var img ="img/"+Engcity+".jpg"; 
	$("#mainimg").attr("src",img);
	
	weather(Engcity);//도시이름을 날씨 클래스로 변수로 보내 날씨를 가져온다

}
//날씨
function weather(city){

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
var wea =wDescEngToKor(val.id);

wf +="현지날씨 " + data.main.temp + ' ºC' + ' | '  +	wea+"<br>";


});//선택한 요소의 속성src의 이미지 값을 weatherImg에 줌

$("#showWeatherForcast").html(wf);

}

});

}

function wDescEngToKor(w_id) {// 날씨 id값으로 한글번역
	var w_id_arr = [201,200,202,210,211,212,221,230,231,232,
	300,301,302,310,311,312,313,314,321,500,
	501,502,503,504,511,520,521,522,531,600,
	601,602,611,612,615,616,620,621,622,701,
	711,721,731,741,751,761,762,771,781,800,
	801,802,803,804,900,901,902,903,904,905,
	906,951,952,953,954,955,956,957,958,959,
	960,961,962];
	var w_kor_arr = ["가벼운 비를 동반한 천둥구름","비를 동반한 천둥구름","폭우를 동반한 천둥구름","약한 천둥구름",
	"천둥구름","강한 천둥구름","불규칙적 천둥구름","약한 연무를 동반한 천둥구름","연무를 동반한 천둥구름",
	"강한 안개비를 동반한 천둥구름","가벼운 안개비","안개비","강한 안개비","가벼운 적은비","적은비",
	"강한 적은비","소나기와 안개비","강한 소나기와 안개비","소나기","약한 비","중간 비","강한 비",
	"매우 강한 비","극심한 비","우박","약한 소나기 비","소나기 비","강한 소나기 비","불규칙적 소나기 비",
	"가벼운 눈","눈","강한 눈","진눈깨비","소나기 진눈깨비","약한 비와 눈","비와 눈","약한 소나기 눈",
	"소나기 눈","강한 소나기 눈","박무","연기","연무","모래 먼지","안개","모래","먼지","화산재","돌풍",
	"토네이도","구름 한 점 없는 맑은 하늘","약간의 구름이 낀 하늘","드문드문 구름이 낀 하늘","구름이 거의 없는 하늘",
	"구름으로 뒤덮인 흐린 하늘","토네이도","태풍","허리케인","한랭","고온","바람부는","우박","바람이 거의 없는",
	"약한 바람","부드러운 바람","중간 세기 바람","신선한 바람","센 바람","돌풍에 가까운 센 바람","돌풍",
	"심각한 돌풍","폭풍","강한 폭풍","허리케인"];
	for(var i=0; i<w_id_arr.length; i++) {
	if(w_id_arr[i]==w_id) {
	return w_kor_arr[i];
	break;
	}
	}
	return "none";
	}

//새로고침 방지
function noRefresh()
{
    /* CTRL + N키 막음. */
    if ((event.keyCode == 78) && (event.ctrlKey == true))
    {
        event.keyCode = 0;
        return false;
    }
    /* F5 번키 막음. */
    if(event.keyCode == 116)
    {
        event.keyCode = 0;
        return false;
    }
}

document.onkeydown = noRefresh ;

// 새로고침 금지
function noRefresh()
{
    if (event.keyCode == 116) 
    {
        event.keyCode = 2;
        return false;
    } 
    else if(event.ctrlKey && (event.keyCode == 78 || event.keyCode == 82)) 
    {
        return false;
    }
}
document.onkeydown = noRefresh;