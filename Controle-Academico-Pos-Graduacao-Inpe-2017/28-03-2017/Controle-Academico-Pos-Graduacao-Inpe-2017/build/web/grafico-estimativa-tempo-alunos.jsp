
<%@page import="java.util.Set"%>
<%@page import="java.util.TreeMap"%>
<%@page import="br.inpe.lac.Main" %>

<%@page import="java.io.File"%>
<%@page import="com.healthmarketscience.jackcess.DatabaseBuilder"%>
<%@page import="com.healthmarketscience.jackcess.Database"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"
    <title></title>
    
    <link href="css/bootstrap.min.css" rel="stylesheet"><!-- -->
    <link href="css/dataTables.bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <link href="css/portfolio-item.css" rel="stylesheet">
    
    <script src="http://d3js.org/d3.v3.min.js"></script>
    <script src="js/jquery.js"></script><!-- -->
    <script src="js/bootstrap.min.js"></script><!-- -->
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap.min.js"></script>
<style>
    body {
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        margin: 0 auto;
        text-align: center;
        margin-left: auto;
        margin-right: auto;
        margin-top: 20px;
    }

    svg {
        
        width:100%;
       
        
    }
    .toolTip {
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        position: absolute;
        display: none;
        width: auto;
        height: auto;
        background: none repeat scroll 0 0 white;
        border: 0 none;
        border-radius: 8px 8px 8px 8px;
        box-shadow: -3px 3px 15px #888888;
        color: black;
        font: 12px sans-serif;
        padding: 5px;
        text-align: center;
       
    }
    .legend {
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        font-size: 60%;
    }
    text {
        font: 10px sans-serif;
    }
    .axis text {
        font: 10px sans-serif;
    }
    .axis path{
        fill: none;
        stroke: #000;
    }
    .axis line {
        fill: none;
        stroke: #000;
        shape-rendering: crispEdges;
    }
    .axis .tick line {
        stroke-width: 1;
        stroke: rgba(0, 0, 0, 0.2);
    }
    .x.axis path {
        display: none;
    }
</style>
</head>
<body>

<%@include file="menu.jsp" %>
<!-- 
******************************************************************************************************
******************************************************************************************************
******************************************************************************************************
-->
<div class="container">

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Estimativa (<span style="color: red">em meses</span>) do tempo em que o aluno ficará associado ao docente 
                <small></small>
            </h1>
        </div>
    </div>
    
    <div class="row">
        <div class="col-md-12">
            <div id="chupa">
                
            </div>
        </div>
        
<!--        <div class="col-md-4">
            <div id="chupa2">
                
            </div>
        </div>-->
    </div>
 
    
 </div>   
 
 <%@include file="rodape.jsp" %>
 
<script>
<%
    Database academxp = DatabaseBuilder.open(new File(request.getServletContext().getRealPath("/")+"Data/Academxp.mdb"));
%>
dataset = [
        //{label:"", "78":36, "Vf":66, "U":56, "A":26, "B":26, "C":10, "D": 38, "E":20, "Katia Pereira da Silva Fagundes Otavina Batista Gorge": 39, "F": 23, "G": 13, "H": 38, "I": 34, "J Vacila da Silva Cara de Perereca": 12},
        <%=Main.montaGráficoComAEstimativaDeTempoParaCadaAlunoAssociadoAoDocente(request.getParameter("codigoDocente"), Main.obterAlunosAtivosDoCAPAPartirDoCodigoDocente(request.getParameter("codigoDocente"), academxp.getTable("CURSO_AL"), academxp.getTable("GDRPESS"))) %>
    ];

    function verticalWrap(text, width) {
        text.each(function() {
            var text = d3.select(this),
                    words = text.text().split(/\s+/).reverse(),
                    word,
                    line = [],
                    lineNumber = 0,
                    lineHeight = 1.1, // ems
                    y = text.attr("y"),
                    x = text.attr("x"),
                    dy = parseFloat(text.attr("dy")),
                    tspan = text.text(null).append("tspan").attr("x", x).attr("y", y).attr("dy", dy + "em");
            while (word = words.pop()) {
                line.push(word);
                tspan.text(line.join(" "));
                if (tspan.node().getComputedTextLength() > width) {
                    line.pop();
                    tspan.text(line.join(" "));
                    line = [word];
                    tspan = text.append("tspan").attr("x", x).attr("y", y).attr("dy", ++lineNumber * lineHeight + dy + "em").text(word);
                }
            }
        });
    }


    var margin = {top: 100, right: 100, bottom: 100, left: 100},
            width = 600,
            height = 400;

    var y0 = d3.scale.ordinal()
            .rangeRoundBands([height, 0], .2, 0.5);

    var y1 = d3.scale.ordinal();

    var x = d3.scale.linear()
            .range([0, width]);

    var colorRange = d3.scale.category20();
    var color = d3.scale.ordinal()
            .range(colorRange.range());

    var xAxis = d3.svg.axis()
            .scale(x)
            .tickSize(-height)
            .orient("bottom");

    var yAxis = d3.svg.axis()
            .scale(y0)
            .orient("left");
    //.tickFormat(d3.format(".2s"));

    var divTooltip = d3.select("body").append("div").attr("class", "toolTip");


    var svg = d3.select("#chupa").append("svg")
            .attr("width", width + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom)
            .append("g")
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")");


    var options = d3.keys(dataset[0]).filter(function(key) { return key !== "label"; });

    dataset.forEach(function(d) {
        d.valores = options.map(function(name) { return {name: name, value: +d[name]}; });
    });

    y0.domain(dataset.map(function(d) { return d.label; }));
    y1.domain(options).rangeRoundBands([0, y0.rangeBand()]);
    x.domain([0, d3.max(dataset, function(d) { return d3.max(d.valores, function(d) { return d.value; }); })]);


    svg.append("g")
            .attr("class", "x axis")
            .attr("transform", "translate(0," + height + ")")
            .call(xAxis);

    svg.append("g")
            .attr("class", "y axis")
            .call(yAxis);
    /*
     .append("text")
     .attr("transform", "rotate(0)")
     .attr("x", 60)
     .attr("dx", ".71em")
     .style("text-anchor", "end")
     .text("Satisfaction %");
     */

    svg.selectAll(".y.axis .tick text")
            .call(verticalWrap, y0.rangeBand());

    var bar = svg.selectAll(".bar")
            .data(dataset)
            .enter().append("g")
            .attr("class", "rect")
            .attr("transform", function(d) { return "translate( 0,"+ y0(d.label) +")"; });

    var bar_enter = bar.selectAll("rect")
            .data(function(d) { return d.valores; })
            .enter()


    bar_enter.append("rect")
            .attr("height", y1.rangeBand())
            .attr("y", function(d) { return y1(d.name); })//Eixo y dos dados
            .attr("x", function(d) { return 0; })//Eixo x dos dados
            .attr("value", function(d){return d.name;})
            .attr("width", function(d) { return x(d.value); })
            .style("fill", function(d) { return color(d.name); });

    bar_enter.append("text")
            .attr("x", function(d) { return x(d.value) +5;  })//Eixo x do "número" dos dados
            .attr("y", function(d) { return y1(d.name) +(y1.rangeBand()/2); })//Eixo y do "número" dos dados
            .attr("dy", ".35em")
            .text(function(d) { return d.value; });

    bar
            .on("mousemove", function(d){
                divTooltip.style("left", d3.event.pageX+10+"px");
                divTooltip.style("top", d3.event.pageY-25+"px");
                divTooltip.style("display", "inline-block");
                var x = d3.event.pageX, y = d3.event.pageY
                var elements = document.querySelectorAll(':hover');
                l = elements.length
                l = l-1
                elementData = elements[l].__data__
                divTooltip.html((d.label)+"<br>"+elementData.name+"<br>"+elementData.value+" mes(es)");
            });
    bar
            .on("mouseout", function(d){
                divTooltip.style("display", "none");
            });

    var legend = svg.selectAll(".legend")
            .data(options.slice())
            .enter().append("g")
            .attr("class", "legend")
            .attr("transform", function(d, i) { return "translate(0," + i * 20 + ")"; });

    legend.append("rect")
            .attr("x", width + 250) //eixo x da legenda
            .attr("width", 18)
            .attr("height", 18)
            .style("fill", color);

    legend.append("text")
            .attr("x", width + 245)//eixo x do texto da legenda
            .attr("y", 9)
            .attr("dy", ".35em")
            .style("text-anchor", "end")
            .text(function(d) { return d; });
    
</script>





</body>
</html>