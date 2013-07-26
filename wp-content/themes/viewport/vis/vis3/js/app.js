var width = 900;
var height = 500;
var top100ByMuni = {};
var top100 = [];

/*Once the HTML has completely loaded.*/
$(document).ready(function(){
  init();
  /*******************Time animation control*******************/
  $("div#playBtn").click(function () {
    toggleAnim()
  });
  /*Slider initialization*/
  setSlider();
});

function init() {  
  loadTop100();
}

function setSlider() {
  $("input#amount").val(0);
  $("div#slider").slider({
    value: 0,
    min: 0,
    max: 100,
    step: 10,
    slide: function( event, ui ) {
      showMunicipalities(ui.value);
    },
    change: function( event, ui ) {
      if (!event.originalEvent) {
        $("input#amount").val(ui.value);
      }
    }
  });
}

/*load Top100 Municipalities*/
function loadTop100(a) {
  d3.csv("../wp-content/themes/viewport/vis/vis3/data/top100municipios.csv", function (d) {
    top100 = d;
    top100ByMuni = d3.nest()
              .key(function (a) {return a.idMunicipio;})
              .map(d)
    loadRegionsMap();
  })
}

/*load regions map (GeoJson)*/
function loadRegionsMap() {
  //Creamos un elemento svg con un grupo anidado
  d3.select("#map")
    .append("svg:svg")
    .attr("id", "svg")
    .append("svg:g")
    .attr("id", "regions");
          
  d3.json("../wp-content/themes/viewport/vis/vis3/data/map/ccaa_5km.geojson", function (a) {
    var b = d3.select("#regions")
              .selectAll("path")
              .data(a.features);
    
    b.enter().append("svg:path")
      .attr("d", path)
      .attr("class", "region")
      .attr("id", function (a, b) {return "region_" + a.properties.ID});
    
    loadMunicipalitiesMap();
  })
}

/*load municipalities map (GeoJson)*/
function loadMunicipalitiesMap() {
  //Creamos un elemento svg con un grupo anidado
  d3.select("#svg")
    .append("svg:g")
    .attr("id", "municipalities");
          
  d3.json("../wp-content/themes/viewport/vis/vis3/data/map/muni_geo.geojson", function (a) {
    var b = d3.select("#municipalities")
              .selectAll("path")
              .data(a.features);
    
    b.enter().append("svg:path")
      .attr("d", path)
      .attr("class", "dis")
      .attr("id", function (a, b) {return "muni_" + a.properties.idMunicipio})
      .on("mouseover", function (d, i) {return mouseOverMuni(d)})
      .on("mouseout", function (d, i) {return mouseOutMuni(d)});
      
    populateResultsTable(top100);
  })
}

function populateResultsTable(data) {
  $('#results tbody').empty();
  var fragments = [];
  $.each(data, function(i, mun) {
    fragments.push('<tr>');
    fragments.push('<td>'+mun['municipio']+'</td>');
    fragments.push('<td>'+mun['num_incendios']+'</td>');
    fragments.push('<td>'+mun['supquemada']+'</td>');
    fragments.push('<td>'+mun['ranking']+'</td>');
    fragments.push('<td>'+mun['comunidad']+'</td>');
    fragments.push('<td>'+mun['provincia']+'</td>');
    fragments.push('</tr>');
  });

  $(fragments.join('')).appendTo('#results tbody');
  $('#results-container').fadeIn(1000);
  $('.footable').footable();
}

/*************Slider Events********************************************************/
function showMunicipalities(val) {
  if (val > 0) {
    previous_val = $("#amount").val();
    for (var i = 0; i < top100.length; i++) {
        var m_data = top100[i];
        var kk = m_data.idMunicipio;
        var path_id = "path#muni_"+kk
        var mun_path = d3.select(path_id)
        i < val ? mun_path.attr("class","ena"): mun_path.attr("class","dis")
    }
  }
  else {
    d3.select("g#municipalities").selectAll("path").attr("class","dis");
  }
  
  $("#amount").val(val);
}

/*************Mouse Events*********************************************************/
function mouseOverMuni(d) {
  mun_data = top100ByMuni[d.properties.idMunicipio][0];
  $("#pop-up-title").html(mun_data.municipio+" &rarr; Ranking: "+mun_data.ranking);
  $("#pop-up-content").html("Número de incendios: "+formatValue(mun_data.num_incendios)+
                      "<br>Superficie quemada total: "+formatValue(d3.round(mun_data.supquemada, 2))+ " Ha.");
  var popLeft = d3.event.pageX - $("div#pop-up").width() / 2;
  var popTop = d3.event.pageY - $("div#pop-up").height() - 50;
  $("div#pop-up").css({ "left": popLeft, "top": popTop }).show();
}

function mouseOutMuni(d) {
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

/******************************************TIME ANIMATION FUNCTIONS***********************************************/
function toggleAnim() {
  intervalID != null ? pauseUpdate() : startUpdate();
}

function updatePlayBtn() {
  var a = intervalID == null ? "play" : "pause";
  $("div#playBtn").removeClass();
  $("div#playBtn").addClass(a);
}

function changeSelection(c) {
  $("div#slider").slider( "option", "value", c);
  showMunicipalities(c);
}

updateSelection = function () {
  counter > 100 && stopUpdate();
  if (counter <= 100) {
    changeSelection(counter);
    counter+= 10;
  }
};
startUpdate = function () {
  counter = parseInt($("input#amount").val(),10);
  intervalID = setInterval(updateSelection, 1e3);
  updatePlayBtn();
}; 
pauseUpdate = function () {
  clearInterval(intervalID); 
  intervalID = null;
  updatePlayBtn();
};

stopUpdate = function () {
  changeSelection(0);
  clearInterval(intervalID); 
  intervalID = null;
  updatePlayBtn();
};

/******************************************VARIABLES GLOBALES**********************************************/
var multiplier = 18,
    xy = d3.geo.mercator().translate([32 * multiplier, multiplier * 140]).scale(multiplier * 1e3);
    path = d3.geo.path();
    path.projection(xy);
    
var intervalID = null;
var counter = 0;