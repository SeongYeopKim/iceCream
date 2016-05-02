<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="http://www.amcharts.com/lib/3/amcharts.js"></script>
	<script src="http://www.amcharts.com/lib/3/serial.js"></script>
	<script src="http://www.amcharts.com/lib/3/themes/light.js"></script>
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

	<script src="http://www.amcharts.com/lib/3/pie.js"></script>
	<script src="http://www.amcharts.com/lib/3/themes/light.js"></script>

	<link href="/cream/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="/cream/resources/css/font-awesome.min.css" rel="stylesheet">
	<link href="/cream/resources/css/prettyPhoto.css" rel="stylesheet">
	<link href="/cream/resources/css/price-range.css" rel="stylesheet">
	<link href="/cream/resources/css/animate.css" rel="stylesheet">
	<link href="/cream/resources/css/main.css" rel="stylesheet">
	<link href="/cream/resources/css/responsive.css" rel="stylesheet">

	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>


	<link href="/cream/resources/css/admin/main.css" rel="stylesheet">




	<title>Insert title here</title>

</head>
<body>
<script type="text/javascript">
	var firstList;
	var lastList;



	function firstgetting(){
		$.ajax({
			url: "/cream/store/test",
			method: "get",
			dataType: "json",
			success: function (data) {
				firstList=data;
				$("#cartView").append("<tr class='cart_menu'><td align='center'  width='20%'>주문한 사람</td><td align='center'  width='45%'>주문 내용</td><td align='center'  width='20%'>금액</td><td align='center'  width='15%'>주문 확인</td></tr>");
				for (i = 0; i < data.length; i++) {
					var item = data[i].orderItemlist[0];
					$("#cartView").append("<tr><td align='center'  rowspan='" + data[i].orderItemlist.length + "'>"+data[i].orders.title + "</td><td align='center' >" +"<img src='" + item.photo + "' width='100px' height='100px' alt=''>"+ item.title + "\t" + item.amount + "개"
					+ "</td><td align='center'  rowspan='" + data[i].orderItemlist.length + "'>" + data[i].orders.price + "원\t</td><td align='center'  rowspan='" + data[i].orderItemlist.length + "'>" + "<button onclick='javascript:button_complete("+data[i].orders.srl+")'>계산완료</button>" + "</td></tr>");
					for (k = 1; k < data[i].orderItemlist.length; k++) {
						$("#cartView").append("<tr><td align='center' >"+"<img src='" + data[i].orderItemlist[k].photo + "' width='100px' height='100px' alt=''>" + data[i].orderItemlist[k].title + "\t" + data[i].orderItemlist[k].amount + "개" + "</td></tr>");
					}
				}
			}
		});
	}

	function button_complete(e){
		var $form = $('<form></form>');
		$form.attr('action', '/cream/store/alterPhase');
		$form.attr('method', 'post');
		$form.appendTo('body');
		$form.append('<input type="hidden" value="' + e + '" name="srl">');
		$form.submit();
	}

	function lastgetting(){
		$.ajax({
			url: "/cream/store/test",
			method: "get",
			dataType: "json",
			success: function (data) {
				lastList=data;
			}
		})
	}

	$(function () {
		firstgetting();
		setInterval(function (e) {
			lastgetting();
			if(firstList.length<lastList.length) {
				for (p = firstList.length; p < lastList.length; p++) {
					var item = lastList[p].orderItemlist[0];
					$("#cartView").append("<tr><td align='center' rowspan='" + lastList[p].orderItemlist.length + "'>"+ lastList[p].orders.title + "</td><td align='center'>" +"<img src='" + item.photo + "' width='100px' height='100px' alt=''>"+ item.title + "\t" + item.amount + "개"
					+ "</td><td align='center'  rowspan='" + lastList[p].orderItemlist.length + "'>" + lastList[p].orders.price + "원\t</td><td align='center'  rowspan='" + lastList[p].orderItemlist.length + "'>" + "<button onclick='javascript:button_complete("+lastList[p].orders.srl+")'>계산완료</button>" + "</td></tr>");
					for (t = 1; t < lastList[p].orderItemlist.length; t++) {
						$("#cartView").append("<tr><td align='center'>" +"<img src='" + lastList[p].orderItemlist[t].photo + "' width='100px' height='100px' alt=''>"+ lastList[p].orderItemlist[t].title + "\t" + lastList[p].orderItemlist[t].amount + "개" + "</td><td></td></tr>");
					}
				}
			}
			firstList=lastList;
		},3000)
	});
</script>

<table  align="right">
	<tr>
		<td><form action="/cream/admin/logout">
			<input type=submit value='logout'></form></td>
	</tr>
</table>
<section>
	<div class="container">
		<div class="row">

			<div class="category-tab">
				<!--category-tab-->
				<div class="col-sm-12">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#aaa" class="ggg"
											  data-toggle="tab">주문받기</a></li>
						<li><a href="#a" class="ggg" data-toggle="tab">매출현황</a></li>
						<li><a href="#b" class="ggg" data-toggle="tab">선호메뉴</a></li>
						<li><a href="#c" class="ggg" data-toggle="tab">비선호메뉴</a></li>
						<li><a href="#d" class="ggg" data-toggle="tab">매장혼잡도</a></li>
						<li><a href="#e" class="ggg" data-toggle="tab">연령분포</a></li>
						<li><a href="#f" class="ggg" data-toggle="tab">연령별입맛</a></li>
					</ul>
				</div>
				<div class="tab-content">
					<div class="tab-pane fade active in" id="aaa">
						<section id="cart_items">
							<div class="container">
								<div class="table-responsive cart_info">
									<table class="table table-condensed" id="cartView">
										<div></div>
										</tbody>
									</table>
								</div>
							</div>
						</section>

					</div>
					<div class="tab-pane fade" id="a">
						<div id="chartdiv" class="chartdiv chart"></div>
					</div>
					<div class="tab-pane fade" id="b">
						<div id="chartdiv2" class="chartdiv chart"></div>
					</div>
					<div class="tab-pane fade" id="c">
						<div id="chartdiv3" class="least chart"></div>
					</div>
					<div class="tab-pane fade" id="d">
						<div id="chartdiv4" class="chartdiv chart"></div>
					</div>
					<div class="tab-pane fade" id="e" style="width:'100%';" >
						<div style="width:'100%';" id="chartdiv5" class="ageChart chart"><br></div><br>zzz
					</div>
					<div class="tab-pane fade" id="f">
						<div>
							<div id="chartdiv61" class="chartdiv2 chart">
								<br> 20대
							</div>
							<div id="chartdiv62" class="chartdiv2 chart">2대</div>
							<div id="chartdiv63" class="chartdiv2 chart"></div>
							<div id="chartdiv64" class="chartdiv2 chart"></div>
							<div id="chartdiv65" class="chartdiv2 chart"></div>
						</div>
					</div>


				</div>
				<!--/category-tab-->


			</div>
		</div>
	</div>
</section>
<div align="center"><a href="/cream/store/order_first_list">주문 리스트</a></div>


<script src="/cream/resources/js/jquery.js"></script>
<script src="/cream/resources/js/bootstrap.min.js"></script>
<script src="/cream/resources/js/jquery.scrollUp.min.js"></script>
<script src="/cream/resources/js/price-range.js"></script>
<script src="/cream/resources/js/jquery.prettyPhoto.js"></script>
<script src="/cream/resources/js/main.js"></script>




<script type="text/javascript">

	window.onload = function(){
		var contentData = window.document.getElementsByClassName("amcharts-chart-div");
		var i=0;
		for(i=0;i<contentData.length;i++){
			var data2 = contentData[i].removeChild(contentData[i].getElementsByTagName("a")[0]);
		}
	}
	var chart = AmCharts
			.makeChart(
			"chartdiv",
			{
				"type" : "serial",
				"theme" : "light",
				"marginRight" : 80,
				"autoMarginOffset" : 20,
				"dataDateFormat" : "YYYY-MM-DD",
				"valueAxes" : [ {
					"id" : "v1",
					"axisAlpha" : 0,
					"position" : "left"
				} ],
				"balloon" : {
					"borderThickness" : 1,
					"shadowAlpha" : 0
				},
				"graphs" : [ {
					"id" : "g1",
					"bullet" : "round",
					"bulletBorderAlpha" : 1,
					"bulletColor" : "#FFFFFF",
					"bulletSize" : 5,
					"hideBulletsCount" : 50,
					"lineThickness" : 2,
					"title" : "red line",
					"useLineColorForBulletBorder" : true,
					"valueField" : "value",
					"balloonText" : "<div style='margin:5px; font-size:19px;'><span style='font-size:13px;'>[[category]]</span><br>[[value]]</div>"
				} ],
				"chartScrollbar" : {
					"graph" : "g1",
					"oppositeAxis" : false,
					"offset" : 30,
					"scrollbarHeight" : 80,
					"backgroundAlpha" : 0,
					"selectedBackgroundAlpha" : 0.1,
					"selectedBackgroundColor" : "#888888",
					"graphFillAlpha" : 0,
					"graphLineAlpha" : 0.5,
					"selectedGraphFillAlpha" : 0,
					"selectedGraphLineAlpha" : 1,
					"autoGridCount" : true,
					"color" : "#AAAAAA"
				},
				"chartCursor" : {
					"pan" : true,
					"valueLineEnabled" : true,
					"valueLineBalloonEnabled" : true,
					"cursorAlpha" : 0,
					"valueLineAlpha" : 0.2
				},
				"categoryField" : "date",
				"categoryAxis" : {
					"parseDates" : true,
					"dashLength" : 1,
					"minorGridEnabled" : true
				},
				"export" : {
					"enabled" : true
				},
				"dataProvider" : [

					<%//@SuppressWarnings('')
    ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request
            .getAttribute("amountMoney");

    for (int i = 0; i < list.size(); i++) {%>
					{
						"date" : "<%=list.get(i).get("dayamount")%>",
						"value" :<%=list.get(i).get("value")%>

					}
					<%if (list.size() != 0) {%>
					,
					<%}%>
					<%} //end ofrs%>
				]
			});

	chart.addListener("rendered", zoomChart);

	zoomChart();

	function zoomChart() {
		chart.zoomToIndexes(chart.dataProvider.length - 40,
				chart.dataProvider.length - 1);
	}


	var chart2 = AmCharts.makeChart("chartdiv2", {
		"type": "pie",
		"startDuration": 0,
		"theme": "light",
		"addClassNames": true,
		"legend":{
			"position":"right",
			"marginRight":100,
			"autoMargins":false
		},
		"innerRadius": "30%",
		"defs": {
			"filter": [{
				"id": "shadow",
				"width": "200%",
				"height": "200%",
				"feOffset": {
					"result": "offOut",
					"in": "SourceAlpha",
					"dx": 0,
					"dy": 0
				},
				"feGaussianBlur": {
					"result": "blurOut",
					"in": "offOut",
					"stdDeviation": 5
				},
				"feBlend": {
					"in": "SourceGraphic",
					"in2": "blurOut",
					"mode": "normal"
				}
			}]
		},
		"dataProvider": [
			<%//@SuppressWarnings('')
            ArrayList<HashMap<String, Object>> list2 = (ArrayList<HashMap<String, Object>>) request
                    .getAttribute("bestMenu");

            for (int i = 0; i < list2.size(); i++) {%>
			{
				"country" : "<%=list2.get(i).get("menu")%>",
				"litres" :<%=list2.get(i).get("amount")%>

			}
			<%if (list2.size() != 0) {%>
			,
			<%}%>
			<%} //end for%>],
		"valueField": "litres",
		"titleField": "country",
		"export": {
			"enabled": true
		}
	});

	chart2.addListener("init", handleInit);

	chart2.addListener("rollOverSlice", function(e) {
		handleRollOver(e);
	});

	function handleInit(){
		chart2.legend.addListener("rollOverItem", handleRollOver);
	}

	function handleRollOver(e){
		var wedge = e.dataItem.wedge.node;
		wedge.parentNode.appendChild(wedge);
	}


	var chart3 = AmCharts.makeChart( "chartdiv3", {
		"type": "serial",
		"theme": "light",
		"dataProvider": [
			<%//@SuppressWarnings('')
                        ArrayList<HashMap<String, Object>> list3 = (ArrayList<HashMap<String, Object>>) request
                                .getAttribute("leastMenu");

                        for (int i = 0; i < list3.size(); i++) {%>
			{
				"country" : "<%=list3.get(i).get("title")%>",
				"visits" :<%=list3.get(i).get("amount")%>

			}
			<%if (list3.size() != 0) {%>
			,
			<%}%>
			<%} //end ofrs%>

		],
		"valueAxes": [ {
			"gridColor": "#FFFFFF",
			"gridAlpha": 0.2,
			"dashLength": 0
		} ],
		"gridAboveGraphs": true,
		"startDuration": 1,
		"graphs": [ {
			"balloonText": "[[category]]: <b>[[value]]</b>",
			"fillAlphas": 0.8,
			"lineAlpha": 0.2,
			"type": "column",
			"valueField": "visits"
		} ],
		"chartCursor": {
			"categoryBalloonEnabled": false,
			"cursorAlpha": 0,
			"zoomable": false
		},
		"categoryField": "country",
		"categoryAxis": {
			"gridPosition": "start",
			"gridAlpha": 0,
			"tickPosition": "start",
			"tickLength": 20
		},
		"export": {
			"enabled": true
		}

	} );



	var chart5 = AmCharts.makeChart("chartdiv5", {
		"type": "serial",
		"theme": "light",
		"rotate": true,
		"marginBottom": 50,
		"dataProvider": [


			<%
			ArrayList<HashMap<String, Object>> list5 = (ArrayList<HashMap<String, Object>>) request
					.getAttribute("ageChart");

			for (int i = 0; i < list5.size(); i++) {%>
			{
				"age" : "<%=list5.get(i).get("age")%>0대",
				"male" :-<%=list5.get(i).get("malecnt")%>,
				"female" :<%=list5.get(i).get("femalecnt")%>
			}
			<%if (list5.size() != 0) {%>
			,
			<%}%>
			<%} //end for%>

		],
		"startDuration": 1,
		"graphs": [{
			"fillAlphas": 0.8,
			"lineAlpha": 0.2,
			"type": "column",
			"valueField": "male",
			"title": "Male",
			"labelText": "[[value]]",
			"clustered": false,
			"labelFunction": function(item) {
				return Math.abs(item.values.value);
			},
			"balloonFunction": function(item) {
				return item.category + ": " + Math.abs(item.values.value) + "%";
			}
		}, {
			"fillAlphas": 0.8,
			"lineAlpha": 0.2,
			"type": "column",
			"valueField": "female",
			"title": "Female",
			"labelText": "[[value]]",
			"clustered": false,
			"labelFunction": function(item) {
				return Math.abs(item.values.value);
			},
			"balloonFunction": function(item) {
				return item.category + ": " + Math.abs(item.values.value) + "%";
			}
		}],
		"categoryField": "age",
		"categoryAxis": {
			"gridPosition": "start",
			"gridAlpha": 0.2,
			"axisAlpha": 0
		},
		"valueAxes": [{
			"gridAlpha": 0,
			"ignoreAxisWidth": true,
			"labelFunction": function(value) {
				return Math.abs(value) + '%';
			},
			"guides": [{
				"value": 0,
				"lineAlpha": 0.2
			}]
		}],
		"balloon": {
			"fixedPosition": true
		},
		"chartCursor": {
			"valueBalloonsEnabled": false,
			"cursorAlpha": 0.05,
			"fullWidth": true
		},
		"allLabels": [{
			"text": "Male",
			"x": "28%",
			"y": "97%",
			"bold": true,
			"align": "middle"
		}, {
			"text": "Female",
			"x": "75%",
			"y": "97%",
			"bold": true,
			"align": "middle"
		}],
		"export": {
			"enabled": true
		}

	});

	<%ArrayList<HashMap<String, Object>> list61 = (ArrayList<HashMap<String, Object>>) request
                .getAttribute("taste1");%>
	var chart61 = AmCharts.makeChart("chartdiv61", {
		"type" : "pie",
		"theme" : "light",
		"dataProvider" : [ {
			"title" : "신맛",
			"value" : <%=list61.get(0).get("sr")%>
		}, {
			"title" : "단맛",
			"value" : <%=list61.get(0).get("swt")%>
		}, {
			"title" : "신선한",
			"value" : <%=list61.get(0).get("sft")%>
		}  ],
		"titleField" : "title",
		"valueField" : "value",
		"labelRadius" : 5,

		"radius" : "42%",
		"innerRadius" : "60%",
		"labelText" : "[[title]]",
		"export" : {
			"enabled" : true
		}
	});

	<%ArrayList<HashMap<String, Object>> list62 = (ArrayList<HashMap<String, Object>>) request
            .getAttribute("taste2");%>
	var chart62 = AmCharts.makeChart("chartdiv62", {
		"type" : "pie",
		"theme" : "light",
		"dataProvider" : [ {
			"title" : "신맛",
			"value" : <%=list62.get(0).get("sr")%>
		}, {
			"title" : "단맛",
			"value" : <%=list62.get(0).get("swt")%>
		}, {
			"title" : "신선한",
			"value" : <%=list62.get(0).get("sft")%>
		}  ],
		"titleField" : "title",
		"valueField" : "value",
		"labelRadius" : 5,

		"radius" : "42%",
		"innerRadius" : "60%",
		"labelText" : "[[title]]",
		"export" : {
			"enabled" : true
		}
	});

	<%ArrayList<HashMap<String, Object>> list63 = (ArrayList<HashMap<String, Object>>) request
            .getAttribute("taste3");%>
	var chart63 = AmCharts.makeChart("chartdiv63", {
		"type" : "pie",
		"theme" : "light",
		"dataProvider" : [ {
			"title" : "신맛",
			"value" : <%=list63.get(0).get("sr")%>
		}, {
			"title" : "단맛",
			"value" : <%=list63.get(0).get("swt")%>
		}, {
			"title" : "신선한",
			"value" : <%=list63.get(0).get("sft")%>
		}  ],
		"titleField" : "title",
		"valueField" : "value",
		"labelRadius" : 5,

		"radius" : "42%",
		"innerRadius" : "60%",
		"labelText" : "[[title]]",
		"export" : {
			"enabled" : true
		}
	});


	<%ArrayList<HashMap<String, Object>> list64 = (ArrayList<HashMap<String, Object>>) request
            .getAttribute("taste4");%>
	var chart64 = AmCharts.makeChart("chartdiv64", {
		"type" : "pie",
		"theme" : "light",
		"dataProvider" : [ {
			"title" : "신맛",
			"value" : <%=list64.get(0).get("sr")%>
		}, {
			"title" : "단맛",
			"value" : <%=list64.get(0).get("swt")%>
		}, {
			"title" : "신선한",
			"value" : <%=list64.get(0).get("sft")%>
		}  ],
		"titleField" : "title",
		"valueField" : "value",
		"labelRadius" : 5,

		"radius" : "42%",
		"innerRadius" : "60%",
		"labelText" : "[[title]]",
		"export" : {
			"enabled" : true
		}
	});


	<%ArrayList<HashMap<String, Object>> list65 = (ArrayList<HashMap<String, Object>>) request
            .getAttribute("taste5");%>
	var chart65 = AmCharts.makeChart("chartdiv65", {
		"type" : "pie",
		"theme" : "light",
		"dataProvider" : [ {
			"title" : "신맛",
			"value" : <%=list65.get(0).get("sr")%>
		}, {
			"title" : "단맛",
			"value" : <%=list65.get(0).get("swt")%>
		}, {
			"title" : "신선한",
			"value" : <%=list65.get(0).get("sft")%>
		}  ],
		"titleField" : "title",
		"valueField" : "value",
		"labelRadius" : 5,

		"radius" : "42%",
		"innerRadius" : "60%",
		"labelText" : "[[title]]",
		"export" : {
			"enabled" : true
		}
	});


	var chart4 = AmCharts.makeChart("chartdiv4", {
		"theme": "light",
		"type": "serial",
		"startDuration": 2,
		"dataProvider": [


			<%
            ArrayList<HashMap<String, Object>> list4 = (ArrayList<HashMap<String, Object>>) request
                    .getAttribute("timeCnt");

            for (int i = 0; i < list4.size(); i++) {
            %>
			{
				"country" : "<%=list4.get(i).get("mytime")%>시 ~<%=(Integer)(list4.get(i).get("mytime"))+1%>시",
				"visits" :<%=list4.get(i).get("cnt")%>,
				"color" : "#878787"
			}
			<%if (list4.size() != 0) {%>
			,
			<%}%>
			<%} //end for%>



		],
		"graphs": [{
			"balloonText": "[[category]]: <b>[[value]]</b>",
			"colorField": "color",
			"fillAlphas": 0.85,
			"lineAlpha": 0.1,
			"type": "column",
			"topRadius":1,
			"valueField": "visits"
		}],

		"categoryField": "country",
		"categoryAxis": {
			"gridPosition": "start",
			"axisAlpha":0,
			"gridAlpha":0

		},
		"export": {
			"enabled": true
		}

	},0);

</script>
</body>
</html>