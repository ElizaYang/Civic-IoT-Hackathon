<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <script type="text/javascript">
  window.onload = function () {
    var chart = new CanvasJS.Chart("chartContainer",
    {
      title: {
        text: "Monthly Harrasments",
        fontSize: 25
      },
      axisX:{
        valueFormatString: "MMM" ,
        interval: 1,
        intervalType: "month"

      },
      axisY: {
        title: "Number of cases"
      },

      data: [
      {
        indexLabelFontColor: "green",
        type: "area",
        dataPoints: [//array

        { x: new Date(2012, 00, 1), y: 2600},
        { x: new Date(2012, 01, 1), y: 3800 },
        { x: new Date(2012, 02, 1), y: 4300 },
        { x: new Date(2012, 03, 1), y: 2900 },
        { x: new Date(2012, 04, 1), y: 4100 },
        { x: new Date(2012, 05, 1), y: 4500 },
        { x: new Date(2012, 06, 1), y: 8600,  indexLabel: "Covered on Forbes" },
        { x: new Date(2012, 07, 1), y: 6400 },
        { x: new Date(2012, 08, 1), y: 5300 },
        { x: new Date(2012, 09, 1), y: 6000}
        ]
      }
      ]
    });

    chart.render();
  }
  </script>
  <script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</head>
<body>
  <div id="chartContainer" style="height: 300px; width: 100%;">
  </div>
</body>
</html>