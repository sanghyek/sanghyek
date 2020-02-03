	//스크롤로 메뉴위치확인
$(document).ready(function() {
	history.replaceState({}, null, location.pathname);//주소창에 넘어온 파라미터 제거
	if($("#test").val()!=null){
		
		var citytest=$("#test").val();//파라미터로 넘겨온 도시이름을 변수지정
		
		var regex= /[^a-z]/gi;
		city = citytest.replace(regex,"");//도시이름을 영어만 가져오기
			
		var img ="img/"+city+".jpg";
		
		$("#mainimg").attr("src",img);
						
		var key = 'd70cd7fec99558cde8ada8d746de18ae';

		$.ajax({/* ajax는 새로고침할 필요없이 버튼을 클릭하면 자동으로 새로 기능이 수행하게끔 해준다. */

		url: 'http://api.openweathermap.org/data/2.5/weather',//이미지

		dataType: 'json',

		type: 'GET',

		data: {q:city, appid:key, units:'metric'},//도시 API키 단위법:섭씨, 키, 기간

		success: function(data){//출력부

		var wf = '';

		$.each(data.weather, function(index, val){

			var wea =wDescEngToKor(val.id);
			
			wf +="현지날씨 " + data.main.temp + ' ºC' + ' | '  +	wea + "<br>";
		
		});

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

function wDescEngToKor(w_id) {
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
