var width = 900;
var height = 500;
var BARWIDTH = 250;
var BARHEIGHT = 15;
var medianData = [];
var maxEXT = 0;
var formatNumber = d3.format(",.0f"),
    format = function(d) { aux = formatNumber(d); return aux.replace(/,/g,"."); };

/*Once the HTML has completely loaded.*/
$(document).ready(function(){
  init();
});

function init() {  
  d3.csv("../wp-content/themes/viewport/vis/vis2/data/MedianTimes_Region.csv", function(ccaas) {
    ccaas.forEach(function(d) {
      d.median_llegpmt = +d.median_llegpmt;
      d.median_ctrl = +d.median_ctrl;
      d.median_ext = +d.median_ext;
      maxEXT = d.median_ext > maxEXT ? d.median_ext : maxEXT;
    });
    var medians = d3.keys(ccaas[0]).filter(function(key) {
      return key != "idcomunidad" && key != "comunidad" && key != "num_incendios" && key != "supquemada";
    });

    d3.selectAll("thead td").data(medians).on("click", function(k) {
      tr.sort(function(a, b) { return b[k] - a[k]; });
    });
    ccaas.sort(function (a,b) {return d3.ascending(a.comunidad, b.comunidad);});

    var tr = d3.select("tbody").selectAll("tr")
        .data(ccaas)
        .enter()
        .append("tr")
        .attr("class",function(d) {return d.comunidad == "ESPAÑA" ? "nacional": null; })
        .on("mouseover", onMouseOver)
        .on("mouseout", onMouseOut);

    tr.append("th")
        .text(function(d) { return d.comunidad; });

    var td = tr.selectAll("td")
        .data(function(d) { return medians.map(function(k) { return d[k]; }); })
      .enter().append("td").append("svg")
        .attr("width", BARWIDTH)
        .attr("height", BARHEIGHT);
    
    td.append("rect")
        .attr("height", BARHEIGHT)
        .attr("width", calcWidth);
      
    td.append("text")
          .attr("class", "q3")
          .attr("x", calcWidth)
          .attr("y", 0)
          .attr("dx", -3) // padding-left
          .attr("dy", "0.95em") // vertical-align: middle
          .attr("text-anchor", "end") // text-align: right
          .text(function(d) { return d3.round(d); });
  });
}

function calcWidth(d) {
  var proportion = d / maxEXT;
  return proportion * BARWIDTH;
}

function onMouseOver(d) {
  d3.select(this).classed("hovered",true);
  $("#pop-up-title").html(d.comunidad+": Número de incendios: "+format(d.num_incendios));
  $("#pop-up-content").html("Superficie quemada total: "+format(d3.round(d.supquemada))+ " Ha."+
          "<br>LlegPMT: "+format(d3.round(d.median_llegpmt))+" min."+
          " &rarr; CTRL: "+format(d3.round(d.median_ctrl))+" min."+
          " &rarr; EXT: "+format(d3.round(d.median_ext))+" min."); 
  var popLeft = d3.event.pageX - $("div#pop-up").width() / 2;
  var popTop = d3.event.pageY - $("div#pop-up").height() - 50;
  $("div#pop-up").css({ "left": popLeft, "top": popTop }).show();
}

function onMouseOut(d) {
  d3.select(this).classed("hovered",false);
  $("div#pop-up").hide();
}

/***************Formatting functions**********************************************/
function formatValue(a) {
var s = a.toString(),
  i = a.toString().indexOf(".");

  i > -1 && (s = Math.round(a).toString());
  if (s.length > 9) {
    v = s.substring(0, s.length - 9) + "." + s.substring(s.length - 9, s.length - 6) + 
    "." + s.substring(s.length - 6, s.length - 3) + "." + s.substring(s.length - 3, s.length);
  }
  else if (s.length > 6) { 
    v = s.substring(0, s.length - 6) + "." + s.substring(s.length - 6, s.length - 3) + "." + s.substring(s.length - 3, s.length);
  }
  else if (s.length > 3) { 
    v = s.substring(0, s.length - 3) + "." + s.substring(s.length - 3, s.length);
  }
  else {
    i > -1 ? v = a.toString().substring(0, i) + "," + a.toString().substring(i + 1, i + 3): v = s;
  }
  return v
}