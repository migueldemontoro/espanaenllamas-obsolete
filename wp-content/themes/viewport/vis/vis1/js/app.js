var formatNumber = d3.format(",.0f"),
    formatPercentage = d3.format(".2%")
    format = function(d) { aux = formatNumber(d); return aux.replace(/,/g,"."); };
    formatPerc = function(d) { aux = formatPercentage(d); return aux.replace(/\./g,",")};

var margin = {top: 20, right: 0, bottom: 0, left: 0},
    width = 920,
    height = 500 - margin.top - margin.bottom,
    transitioning = false;
    
var nodes = [];

var x = d3.scale.linear()
    .domain([0, width])
    .range([0, width]);

var y = d3.scale.linear()
    .domain([0, height])
    .range([0, height]);

var treemap,svg,grandparent;

    
/*Once the HTML has completely loaded.*/
$(document).ready(function(){
  init();
});


function init() { 
  treemap = d3.layout.treemap()
     .children(function(d, depth) { return depth ? null : d.children; })
     .sort(function(a, b) { return a.value - b.value; })
     .ratio(height / width * 0.5 * (1 + Math.sqrt(5)))
     .round(false)
     .sticky(false);
  
  svg = d3.select("#chart").append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.bottom + margin.top)
      .style("margin-left", -margin.left + "px")
      .style("margin.right", -margin.right + "px")
      .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
      .style("shape-rendering", "crispEdges");

  grandparent = svg.append("g")
    .attr("class", "grandparent");

  grandparent.append("rect")
      .attr("y", -margin.top)
      .attr("width", width)
      .attr("height", margin.top);

  grandparent.append("text")
      .attr("x", 6)
      .attr("y", 6 - margin.top)
      .attr("dy", ".75em");

  d3.json("../wp-content/themes/viewport/vis/vis1/data/breakdownDetectado.json", function(data) {
    initialize(data);
    accumulate(data);
    layout(data);
    display(data);
  });
}

function initialize(d) {
  d.x = d.y = 0;
  d.dx = width;
  d.dy = height;
  d.depth = 0;
}

// Aggregate the values for internal nodes. This is normally done by the
// treemap layout, but not here because of our custom implementation.
function accumulate(d) {
  nodes.push(d);
  return d.children
    ? d.value = d.children.reduce(function(p, v) { return p + accumulate(v); }, 0)
    : d.value;
}

// Compute the treemap layout recursively such that each group of siblings
// uses the same size (1×1) rather than the dimensions of the parent cell.
// This optimizes the layout for the current zoom state. Note that a wrapper
// object is created for the parent node for each group of siblings so that
// the parent’s dimensions are not discarded as we recurse. Since each group
// of sibling was laid out in 1×1, we must rescale to fit using absolute
// coordinates. This lets us use a viewport to zoom.
function layout(d) {
  if (d.children) {
    treemap.nodes({children: d.children});
    d.children.forEach(function(c) {
      c.x = d.x + c.x * d.dx;
      c.y = d.y + c.y * d.dy;
      c.dx *= d.dx;
      c.dy *= d.dy;
      c.parent = d;
      layout(c);
    });
  }
}

function display(d) {
  grandparent
      .datum(d.parent)
      .on("click", transition)
      .select("text")
      .text(name(d));

  //Added colorbrewer class to scale colors
  var g1 = svg.insert("g", ".grandparent")
      .datum(d)
      .attr("class", "depth");

  var g = g1.selectAll("g")
      .data(d.children)
      .enter().append("g");

  g.filter(function(d) { return d.children; })
    .classed("children", true)
    .on("click", transition)
    .on("mouseover", onMouseOver)
    .on("mouseout", onMouseOut)

  //Added color to the shape  
  g.selectAll(".child")
    .data(function(d) { return d.children || [d]; })
    .enter().append("rect")
    .attr("class", "child")
    .call(rect);
  
  g.append("rect")
    .attr("class", "parent")
    .attr("rx", '4')
    .attr("ry", '4')
    .on("mouseover", onMouseOver)
    .on("mouseout", onMouseOut)
    .call(rect);

  //Truncate text if it exceeds the width of the shape, if we are transitioning we truncate on the end event of the transition
  if (!transitioning) {
    g.append("text")
      .attr("dy", ".75em")
      .text(truncateText(function(d) { return d.name; }, function(d) { return d.dx -5; }))
      .call(text);
  }
  else { 
    g.append("text")
      .attr("dy", ".75em")
      .text(function(d) { return d.name; })
      .call(text);
  }
  return g;
}

function transition(d) {
  if (transitioning || !d) return;
  transitioning = true;
  var g1 = d3.select("g.depth");
  var g2 = display(d),
      t1 = g1.transition().duration(750),
      t2 = g2.transition().duration(750);

  // Update the domain only after entering new elements.
  x.domain([d.x, d.x + d.dx]);
  y.domain([d.y, d.y + d.dy]);

  // Enable anti-aliasing during the transition.
  svg.style("shape-rendering", null);

  // Draw child nodes on top of parent nodes.
  svg.selectAll(".depth").sort(function(a, b) { return a.depth - b.depth; });

  // Fade-in entering text.
  g2.selectAll("text").style("fill-opacity", 0);

  // Transition to the new view.
  t1.selectAll("text").call(text).style("fill-opacity", 0);
  t2.selectAll("text").call(text).style("fill-opacity", 1);
  t1.selectAll("rect").call(rect);
  t2.selectAll("rect").call(rect);

  //Prueba
  t2.each("end", transTruncateText);

  // Remove the old node when the transition is finished.
  t1.remove().each("end", function() {
    svg.style("shape-rendering", "crispEdges");
    transitioning = false;
  });
}

function text(text) {
  text.attr("x", function(d) { return x(d.x) + 5; })
      .attr("y", function(d) { return y(d.y) + 5; });
}

function rect(rect) {
  rect.attr("x", function(d) { return x(d.x); })
      .attr("y", function(d) { return y(d.y); })
      .attr("width", function(d) { return x(d.x + d.dx) - x(d.x); })
      .attr("height", function(d) { return y(d.y + d.dy) - y(d.y); });
}

function name(d) {
  return d.parent 
        ? name(d.parent) + " → " + d.name
        : d.name;
}

function onMouseOver(d) {
  var percentage = d.value/d.parent.value;
  var supQ = 0;
  d.children ? d.children.forEach(function(a) {supQ += +a.SUPQUEMADA}) : supQ = d.SUPQUEMADA
  d3.select(this).selectAll("rect.child").style("stroke-width", 1);
  d3.select(this).classed("hovered",true);
  $("#pop-up-title").html(d.name + " &rarr; " + formatPerc(d.value/d.parent.value));
  $("#pop-up-content").html("Número de incendios: "+format(d.value)+
          "<br>Superficie quemada: "+format(d3.round(supQ))+" Ha.");
  var popLeft = d3.event.pageX - $("div#pop-up").width() / 2;
  var popTop = d3.event.pageY - $("div#pop-up").height() - 50;
  $("div#pop-up").css({ "left": popLeft, "top": popTop }).show();
}

function onMouseOut(d) {
  kk = d;
  d3.select(this).selectAll("rect.child").style("stroke-width", 0);
  d3.select(this).classed("hovered",false);
  $("div#pop-up").hide();
}

function transTruncateText() {
  var g = d3.select(this);
  g.select("text").text(truncateTextW(function(d) { return d.name; }, g.select("rect.parent").attr("width")));
}

// Given a text function and width function, truncates the text if necessary to
// fit within the given width.
function truncateText(text, width) {
  return function(d, i) {
    var t = this.textContent = text(d, i),
        w = width(d, i);
    if (this.getComputedTextLength() < w) return t;
    else if (w < 50) return "";
    this.textContent = "…" + t;
    var lo = 0,
        hi = t.length + 1,
        x;
    while (lo < hi) {
      var mid = lo + hi >> 1;
      if ((x = this.getSubStringLength(0, mid)) < w) lo = mid + 1;
      else hi = mid;
    }
    return lo > 1 ? t.substr(0, lo - 2) + "…" : "";
  };
}
  
// Given a text function the width of the rect.parent element inside the svg group, truncates the text if necessary to
// fit within the given width.
function truncateTextW(text, width) {
  return function(d, i) {
    var t = this.textContent = text(d, i),
        w = width - 5;
    if (this.getComputedTextLength() < w) return t;
    else if (w < 50) return "";
    this.textContent = "…" + t;
    var lo = 0,
        hi = t.length + 1,
        x;
    while (lo < hi) {
      var mid = lo + hi >> 1;
      if ((x = this.getSubStringLength(0, mid)) < w) lo = mid + 1;
      else hi = mid;
    }
    return lo > 1 ? t.substr(0, lo - 2) + "…" : "";
  };
}
