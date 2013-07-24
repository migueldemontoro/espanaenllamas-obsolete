/*
 * Copyright (C) 2012 Juan Elosua Tomé <juan.elosua@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
 
/*****************************MAIN FUNCTIONS**************************************/
/*Starting point of the visualization script*/
function start() {
  showVis(!1);  
  defaultValues();
  loadFires();
}

/*Update the elements of the vis*/
function update() {
  updateMap();
  updatePlayBtn();
  updateNavigationBar();
}
/*Controls the end of the loading data process*/
function showVis(a) {
  var b = d3.select("div#main");
  b.style("visibility", a == !0 ? "visible" : "hidden");
  var b = d3.select("div#loading");
  b.style("display", a == !1 ? "" : "none")
}

function defaultValues() {
  currentYear = 0;
  $("select#cau").val("0");
  $("select#sin").val("0");
  $("select#loc").val("0;0");
  $("div#slider").slider( "option", "values", [100,30000] );
}

function resetVis() {
  //Reset filters
  curFCau = 0;
  $("select#cau").val("0");
  curFSini = 0;
  $("select#sin").val("0");
  currentYear = 0;
  $("select#loc").val("0;0");
  curFCCAA = 0;
  curFProv = 0;
  $("div#slider").slider( "option", "values", [100,30000] );
  supQinf=100.0;
  supQsup=30000.0;
  map.setCenter(MCenter);
  map.setZoom(MZoom);
  $("input#busqueda").val("");
  if (mPlace) {
    mPlace.setVisible(false);
  }
  place = null;
  update();
}

/********************************FILTERS**************************************************/
function resetFilters() {
  //Reset filters
  curFCau = 0;
  curFSini = 0;
  currentYear = 0;
  curFCCAA = 0;
  curFProv = 0;
  supQinf=100.0;
  supQsup=30000.0;
}

function filterCause(a) {
  curFCau = a; 
  update();
}

function filterSini(a) {
  curFSini = a; 
  update();
}

function filterGeo(a,b) {
  curFCCAA = a;
  curFProv = b;
  update();
}

function filterSup(i,s) {
  supQinf = parseFloat(i);
  supQsup = parseFloat(s);
  update();
}

/*Zoom to the Canary Islands*/
function zoomCanarias() {
  map.setCenter(MCenterCanarias);
  map.setZoom(MZoomCanarias);
}

/*Once the HTML has completely loaded. 
From here we start the visualization script*/
$(document).ready(function(){
  /******************Initial appearance******************/
  $("div.cuadro .titf").text("Incendios en detalle a un nivel nunca visto");
  $("div.cuadro .txtf").html($("div#explicacion").clone());
  
  /*******************Behavior news control*******************/
  $("div.titular-his").click(function() {
    if (!$(this).hasClass('active')) {
      $("div.titular-his").removeClass("active");
      $(this).addClass("active");
      var id = $(this).attr("id");
      var tit = $(this).text();
      $("div.cuadro .titf").text(tit);
      $("div.cuadro .txtf").html($("div#t"+id).clone());
      switchNews(id);
    }
    else {
      //If already selected show to the introductory text
      $(this).removeClass("active");
      $("div.cuadro .titf").text("Incendios en detalle a un nivel nunca visto");
      $("div.cuadro .txtf").html($("div#explicacion").clone());
      switchNews(0);
    }
  });
  
  /*******************Time animation control*******************/
  $("div#playBtn").click(function () {
    toggleAnim()
  });
  
  /*******************filters control*******************/
  $("select#cau").change(function () {
    var sel = $(this).val();
    var i=parseInt(sel);
    filterCause(i);
  });
  
  $("select#sin").change(function () {
    var sel = $(this).val();
    var i=parseInt(sel);
    filterSini(i);
  });

  $("select#loc").change(function () {
    var sel = $(this).val();
    var n=sel.split(";");
    var selCCAA = parseInt(n[0]);
    var selProv = parseInt(n[1]);
    filterGeo(selCCAA,selProv);
  });
  
  $("div#slider").slider({
    range: true,
    min: 100,
    max: 30000,
    step: 100,
    values: [ 100, 30000 ],
    slide: function( event, ui ) {
      $("input#range").val(ui.values[ 0 ] + " - " + ui.values[ 1 ] );
    },
    change: function( event, ui ) {
      if (event.originalEvent) {
        filterSup(ui.values[0],ui.values[1]);
      }
      else {
      $("input#range").val(ui.values[ 0 ] + " - " + ui.values[ 1 ] );
      }
    }
  }); 
  
  $("div.reestab").click(function () {
    resetVis();
  });
  
  $("div#ir").click(function() {
    if (place) {
      map.setCenter(place.geometry.location);
            map.setZoom(10);
    }
  });
  
  /*************zoom canary islands control****************/
  $("div.mapa-canarias").click(function () {
    zoomCanarias();
  });
  
  /************Move the map to the selected fire id********************/
  $(document).on('click', '.butFire', function(e){
    var id = $(this).attr("id")
    var f = fires[id]
    map.setCenter(f.gLatLng);
    map.setZoom(10);
  });
  
  /********************Utils************************/
  //Retrieve the color to show on each class of fire
  var c1 = $(".fuego-int").css("background-color");
  colorInt = d3.rgb(c1).toString();
  var c2 = $(".fuego-noint").css("background-color");
  colorNint = d3.rgb(c2).toString();
    
  /***************************************************
  **********LAUNCH THE VISUALIZATION SCRIPT***********
  ****************************************************/
  start();
});

/********************************LOADING DATA FUNCTIONS******************************/
/*Load Fire Data*/
function loadFires() {
  var a = "../wp-content/themes/viewport/app/data/Fires100Ha.csv";
  d3.csv(a, function (a) {
    fires = d3.nest()
            .key(function (d) {return d.IDPIF})
            .rollup(function (d) {return formatFireData(d)})
            .map(a);
      
    loadBounds();
  });
}

/*Load Region Bounds Data*/
function loadBounds() {
  var a = "../wp-content/themes/viewport/app/data/ccaa_bounds.json";
  d3.json(a, function (a) {
    var b = a.ccaas;
    bounds = d3.nest()
            .key(function (b) {return b.id})
            .rollup(function (b) {return formatBoundsData(b)})
            .map(b);    
    
    loadMap();
  });

}

/*Load Map*/
function loadMap() {
  map = new google.maps.Map(document.getElementById("mapa"),MOptions);
  popup = new InfoBox(ibPopOpts);
  tooltip = new InfoBox(ibToolOpts);
  initSearch();
  createNavigationBar();
  createLayer();
  showVis(!0);
}

/*Initiliaze locality search functionality*/
function initSearch() {
  var searchBox = document.getElementById('busqueda');
  if ( searchBox == null )
    return;

  var autocomplete = new google.maps.places.Autocomplete(searchBox, pOpts);
  mPlace = new google.maps.Marker({
    flat: true
    ,clickable: false
    ,visible: false
    ,icon: "../wp-content/themes/viewport/app/img/mm_20_blue.png"
  });
  mPlace.setMap(map);
  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    if (popup) popup.close();
    if (tooltip) tooltip.close();
    place = autocomplete.getPlace();
    if (place.geometry) {
      mPlace.setPosition(place.geometry.location);
      mPlace.setVisible(true);
    }
  });
}

/************************************FORMAT INPUT DATA FUNCTIONS*******************************************/
/*Format fire data*/
function formatFireData(d) {
  var b = {};
  b.id = parseInt(d[0].IDPIF);
  b.gRadio = parseFloat(d[0].RADIO_M);
  b.idcomu = parseInt(d[0].IDCOMUNIDAD);
  b.comu = d[0].COMUNIDAD;
  b.idprov = parseInt(d[0].IDPROVINCIA);
  b.prov = d[0].PROVINCIA;
  b.muni = d[0].MUNICIPIO;
  b.comarca = d[0].COMARCA;
  b.lat = parseFloat(d[0].LATITUD);
  b.lng = parseFloat(d[0].LONGITUD);
  b.date = d[0].FECHA;
  b.year = parseInt(b.date.split("-")[0],10);
  b.month = parseInt(b.date.split("-")[1],10);
  b.day = parseInt(b.date.split("-")[2],10);
  b.date = b.day+"-"+b.month+"-"+b.year;
  b.tCtrl = parseInt(d[0].TIME_CTRL);
  b.tExt = parseInt(d[0].TIME_EXT);
  b.resGrpCausa = parseInt(d[0].RES_GRP_CAUSA);
  b.idGrpCausa = parseInt(d[0].IDGRUPOCAUSA);
  b.supQ = parseFloat(d[0].SUPQUEMADA);
  b.muertos = parseInt(d[0].MUERTOS);
  b.heridos = parseInt(d[0].HERIDOS);
  b.personal = parseInt(d[0].PERSONAL);
  b.pesados = parseInt(d[0].PESADOS);
  b.aereos = parseInt(d[0].AEREOS);
  b.gExt = parseInt(d[0].GASTOS_EXT);
  b.perdidas = parseInt(d[0].PERDIDAS);
  //Map Vars
  b.gLatLng = new google.maps.LatLng(b.lat, b.lng);
  b.visible = true;
  b.html = createCartela(b);
  b.mini = createTooltip(b);
  return b;
}

/*Function to create the HTML that will be shown on a fire click*/
function createCartela(b) {
  var html = "<div id=\"cartela\">";
  html += "<div class=\"pieza-cartela\">";
  html += "<div class=\"muni\">"+b.muni+"</div>";
  html += "<div>"+b.comarca+", "+b.prov+"</div>";
  html += "</div>";
  html += "<div class=\"pieza-cartela\">";
  if (b.resGrpCausa == 1)  {
    b.color = colorInt;
    html += "<div class=\"int\">Fuego intencionado</div>";
  }
  else {
    b.color = colorNint;
    html += "<div class=\"noint\">Fuego no intencionado</div>";
  }
  html += "</div>";
  html += "<div class=\"pieza-cartela\">";
  html += "<div class=\"cifra-cartela\">"+formatValue(b.supQ)+" <span>Ha quemadas</span>  <span class=\"fecha\">"+b.date+"<span></div>";
  html += "</div>";
  html += "<div class=\"pieza-cartela\">";
  html += "<div class=\"cifra-cartela\">"+formatValueTime(b.tExt)+"</div>";
  html += "</div>";
  html += "<div class=\"pieza-cartela\">";
  html += "<div class=\"tit-medios\">Siniestralidad</div>";
  html += "<div class=\"cifra-cartela\">"+formatValue(b.muertos)+" muertos y "+formatValue(b.heridos)+" heridos</div>";
  html += "</div>";
  html += "<div class=\"pieza-cartela\">";
  html += "<div class=\"tit-medios\">Medios empleados</div>";
  html += "<div>";
  html += "<div class=\"cifra-cartela\">"+formatValue(b.personal)+" <span>personas y </span>"+formatValue(b.pesados+b.aereos)+" <span>vehículos/aviones</span></div>";
  html += "</div></div>";
  html += "<div class=\"pieza-cartela\">";
  html += "<div class=\"tit-medios\">Gastos de extinción</div>";
  if (b.gExt != 0) 
    html += "<div class=\"cifra-cartela\">"+formatValue(b.gExt)+" <span>euros</span></div>";
  else
    html += "<div class=\"cifra-cartela\">No Disponible</div>";
  html += "</div>";
  html += "<div class=\"pieza-cartela\">";
  html += "<div class=\"tit-medios\">Pérdidas económicas</div>";
  if (b.perdidas != 0) 
    html += "<div class=\"cifra-cartela\">"+formatValue(b.perdidas)+" <span>euros</span></div>";
  else
    html += "<div class=\"cifra-cartela\">No Disponible</div>";
  html += "</div>";
  html += "</div>";
  return html;
}

/*Function to create the HTML that will be shown on a fire mouseover*/
function createTooltip(b) {
  var mini = "<div id=\"mini-cartela\">";
  mini += "<div class=\"pieza-cartela\">";
  mini += "<div class=\"pob\">"+b.muni+", "+b.prov+"</div>";
  mini += "</div>";
  mini += "<div class=\"pieza-cartela\">";
  mini += "<div class=\"cifra-cartela\">"+formatValue(b.supQ)+" <span>Ha quemadas</span>  <span class=\"fecha\">"+b.date+"<span></div>";
  mini += "</div>";
  mini += "<div class=\"pieza-cartela\">";
  mini += "<div class=\"detalles\">Haga click para más info</div>";
  mini += "</div>";
  mini += "</div>";
  return mini;
}

/*Format region bounds data*/
function formatBoundsData(a) {
  var aux = a[0].geometry.bounds;
  var southWest = new google.maps.LatLng(aux.southwest.lat,aux.southwest.lng);
  var northEast = new google.maps.LatLng(aux.northeast.lat,aux.northeast.lng);
  bounds = new google.maps.LatLngBounds(southWest, northEast);
  return bounds;
}

/************************************FORMAT OUTPUT DATA FUNCTIONS******************************************/
function formatValue(a) {
  var s = a.toString(),
      i = a.toString().indexOf(".");

  i > -1 && (s = Math.round(a).toString());
  if (s.length > 6) {
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

function formatValueTime(a) {
  var d = ~~(a/1440);
  var mr = a%1440
  var h = ~~(mr/60);
  if (d > 0) 
    return d+" días y "+h+" horas de duración";
  else if (h > 0) 
    return h+" horas de duración";
  else 
    return "duración no disponible";
}

/********************************MAP FUNCTIONS****************************************************************/
function createLayer() {
  /*Auxiliary marker to position the tooltip infobox*/
  mAux = new google.maps.Marker({
    map: map,
    position: MCenter,
    visible: false
  });
  /*Remove the infoboxes if the map has zoomed or being dragged*/
  google.maps.event.addListener(map, 'idle', function() {
    if (popup) popup.close();
    if (tooltip) tooltip.close();
  });
  /*Create the Fire Custom Overlay*/
  curLayer = new FireOverlay();
}

function updateMap() {
  if (popup) popup.close();
  if (tooltip) tooltip.close();
  applyFilters();
  curLayer.draw();
  setView();
}

function applyFilters() {
  var count = 0;
  var heri = 0;
  var muer = 0;
  var supQ = 0.0;
  var perd = 0.0;
  for (var fire in fires) {
    var f = fires[fire];
    f.visible = true;
    /*CAUSE*/
    if (curFCau == 1 && f.resGrpCausa != 1) f.visible = false;
    else if (curFCau == 2 && f.resGrpCausa != 0) f.visible = false;
    /*CASUALTIES*/
    if (curFSini == 2 && f.heridos <= 0) f.visible = false;
    else if (curFSini == 1 && f.muertos <= 0) f.visible = false;
    /*AREA*/
    if (supQinf > f.supQ || f.supQ > supQsup) f.visible = false;
    /*GEO*/
    if (curFProv != 0 && curFProv != f.idprov) f.visible = false;
    else if (curFCCAA != 0 && curFCCAA != f.idcomu) f.visible = false;
    /*YEAR*/
    if (currentYear >= 2001 && currentYear != f.year) f.visible = false;
    if (f.visible) {
      count +=1;
      heri +=f.heridos;
      muer +=f.muertos;
      supQ +=f.supQ;
      perd +=f.perdidas;
    }
  }
  showFilteredData(count,heri,muer,supQ,perd);
}

function noFilter() {
  if (curFCau == 0 && curFSini == 0 && curFProv == 0 && curFCCAA == 0 && 
    currentYear == 0 && supQinf == 100 && supQsup == 19000) return true;
  return false;  
}

function showFilteredData(count,heri,muer,supQ,perd) {
  $("div#count").text(formatValue(count));
  $("div#supQ").text(formatValue(supQ));
  $("div#muer").text(muer);
  $("div#heri").text(heri);
  $("div#perd").text(formatValue(perd)+" €");
}

function setView() {
  if (curFCCAA != 0) {
    map.fitBounds(bounds[curFCCAA]);
  }
  else {
    map.setCenter(MCenter);
    map.setZoom(MZoom);
  }
}

function updateMapDate(year,month,day) {
  var selBounds = new google.maps.LatLngBounds();
  var fBig = null;
  for (var fire in fires) {
    var f = fires[fire];
    f.visible = false;
    /*DATE*/
    if (year == 0) {
      if (month == f.month && day == f.day) {
        f.visible = true;
        selBounds.extend(f.gLatLng);
      }
    }
    else {
      if (year == f.year && month == f.month && day == f.day) f.visible = true;
    }
    if (f.visible) {
      if (fBig) {
        if (f.supQ > fBig.supQ) {
          fBig = f;
        }
      }
      else fBig = f;
    }
  }
  curLayer.draw();
  map.setCenter(fBig.gLatLng);
  map.setZoom(10);
}

/*Controls the movement of the visualization in the guided mode*/
function switchNews(id) {
  switch (id) {
    //Incendios intencionados
    case "1":
      resetFilters();
      curFCau = 1;
      update();
      break;
    //Grandes incendios
    case "2":
      resetFilters();
      supQinf=500.0;
      supQsup=30000.0;
      update();
      break;
    //El día maldito
    case "3":
      resetFilters();
      updateMapDate(0,7,27)
      break;
    //2003: Arde extremadura
    case "4":
      resetFilters();
      currentYear=2003;
      curFCCAA = 14;
      update();
      break;
    //2005: El peor año de la década
    case "5":
      resetFilters();
      currentYear=2005;
      update();
      break;
    //2006: Galicia - Año Negro
    case "6":
      resetFilters();
      currentYear=2006;
      curFCCAA = 3;
      update();
      break;
    //2007: Canarias
    case "7":
      resetFilters();
      currentYear=2007;
      curFCCAA = 12;
      update();
      break;
    //Espacios naturales protegidos
    case "8":
      resetVis();
      map.setCenter(MCenterSanabria);
      map.setZoom(10);
      break;
    //2011: Octubre Rojo
    case "9":
      resetFilters();
      currentYear=2011;
      curFCCAA = 3;
      update();
      break;
    default:
      resetVis();
      break;
  }
}

/***********************************INFOBOXES FUNCTIONS*********************************************/
function showCartela(d) {
  _selectedFire = d;
  if (popup) popup.close();
  if (tooltip) tooltip.close();
  var html = d.value.html;
  var sLat = map.getBounds().getSouthWest().lat();
  var eLng = map.getBounds().getNorthEast().lng();
  var SE =  new google.maps.LatLng(sLat, eLng);
  popup.setContent(html);
  popup.setPosition(SE);
  popup.open(map);
}

function showTooltip(d) {
  if (popup) popup.close();
  var html = d.value.mini;

  mAux.setPosition(d.value.gLatLng);
  tooltip.setContent(html);
  tooltip.open(map,mAux);
}

function hideTooltip(f,e) {
  if (tooltip) tooltip.close();
}

/**************************************TIME NAVBAR FUNCTIONS**************************************************/
function createNavigationBar() {
  var a = availableYears.length;
      b = d3.entries(availableYears);
      c = d3.select("div#yearnavbar");
  d = 0;
  
  c.text("");
  b.forEach(function (b) {
    var e = "year_" + b.value;
    c.append("span")
    .attr("class", "year")
    .attr("id", e)
    .text(b.value)
    .on("click", function () {return changeYear(this.innerHTML)});
    ++d != a && c.append("span").attr("class", "sep").text(" | ");
  })
}
function changeYear(a) {
  if (currentYear == parseInt(a)) {
    currentYear = 0;
  }
  else {
    currentYear = parseInt(a);
  }
  update()
}

function updateNavigationBar() {
  d3.select("span.yearselect")
  .attr("class","year");
  d3.select("span#year_"+currentYear)
  .attr("class", "yearselect");
}

function updatePlayBtn() {
  var a = intervalID == null ? "play" : "pause";
  $("div#playBtn").removeClass();
  $("div#playBtn").addClass(a);
}

function toggleAnim() {
  intervalID != null ? stopUpdate() : startUpdate();
}

/******************************************MAP GLOBAL VARS*******************************************/
var map = null;
var _selectedFire = null;

var MZoom = 6;
var MCenter =  new google.maps.LatLng(40, -7);
var MZoomCanarias = 7;
var MCenterCanarias = new google.maps.LatLng(28.292213, -16.627893);
var MCenterSanabria= new google.maps.LatLng(42.1224, -6.7196);

var stylesMap = [
  {
    featureType: "road",
    stylers: [
      { visibility: "off" }
    ]
  },
  {
    featureType: "administrative",
    elementType: "labels.icon",
    stylers: [
      { visibility: "off" }
    ]
  },
  {
    featureType: "poi",
    stylers: [
      { visibility: "off" }
    ]
  },
  {
    featureType: "administrative.country",
    elementType: "labels",
    stylers: [
      { visibility: "off" }
    ]
  },
  {
    featureType: "poi.park",
    stylers: [
      { visibility: "on" }
    ]
  },
  {
    featureType: "water",
    elementType: "labels.text",
    stylers: [
      { visibility: "off" }
    ]
  }
];

var MOptions = {
  zoom: MZoom,
  center: MCenter,
  mapTypeId: google.maps.MapTypeId.ROADMAP,
  panControl: false,
  zoomControl: true,
  zoomControlOptions: {
    style: google.maps.ZoomControlStyle.SMALL
  },
  mapTypeControl: true,
  scaleControl: false,
  streetViewControl: false,
  overviewMapControl: false,
  styles: stylesMap
};

var ibPopOpts = {
  boxClass: "Popup"
  ,alignBottom: true
  ,pixelOffset: new google.maps.Size(-238, -30)
  ,infoBoxClearance: new google.maps.Size(0, 0)
  ,closeBoxURL: "../wp-content/themes/viewport/app/img/close.gif"
};
    
var ibToolOpts = {
  boxClass: "ToolTip"
  ,pixelOffset: new google.maps.Size(20, -30)
  ,closeBoxURL: ""
};
    
var pOpts = {
  types: ['(cities)']
  ,componentRestrictions: {country: "es"}
};

var curLayer = null;
var popup = null;
var tooltip = null;
var mAux = null;
var mPlace = null;
var autocomplete = null;
var place = null;
var map_x = 0;
var map_y = 0;
var x_offset = 10;
var y_offset = -40;

/******************************************VIS GLOBAL VARS*******************************************************/
var fires = [];
var overlay;
var bounds = [];
var curFCau = 0;
var curFSini = 0;
var curFCCAA = 0;
var curFProv = 0;
var supQinf = 100.0;
var supQsup = 30000.0;
var colorInt = null;
var colorNint = null;
var availableYears = d3.range(2001,2012);
/******************************************TIME ANIMATION FUNCTIONS***********************************************/
var intervalID = null;
var counter = 0;
updateYear = function () {
  counter >= availableYears.length && stopUpdate();
  if (counter < availableYears.length) {
    changeYear(availableYears[counter]);
    counter++
  }
};
startUpdate = function () {
  stopUpdate();
  counter = 0;
  intervalID = setInterval(updateYear, 1e3);
  updatePlayBtn();
}; 
stopUpdate = function () {
  changeYear(0);
  clearInterval(intervalID); 
  intervalID = null;
  updatePlayBtn();
};