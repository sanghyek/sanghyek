
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
var city_time1=((city_hours>12)?city_hours -12:city_hours)+((city_minutes<10)?":0":":")+city_minutes+((city_seconds<10)?":0":":")+city_seconds
var city_time2=(city_hours>=12)?" PM ":" AM "
var city_time3=((city_month<10)?"0":"")+city_month+ "월" + ((city_day<10)?"0":"")+city_day+ "일";

var time ="현지시간"+city_time2+city_time1+"   "+city_time3;

setTimeout("city_time()", 1000);

var regex= /[^a-z]/gi;
var regek= /[^ㄱ-힣]/gi;
str = city_zone.replace(regex,"");
ktr = city_zone.replace(regek,"");

var cityname = city_zone;
var Engcity = str;

changeView(Engcity,cityname,time);

}




function changeView(Engcity,cityname,time) { 

	 location.href = "?pageChange=tourcity.jsp?city="+Engcity+"&cityname="+cityname+"&time="+time;
} 