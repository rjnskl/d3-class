#Class 12: Mouse Interaction, Mobile, Node

Today we'll work with the same data as last time, in our same groups, adding polish and, in particular, adding a few new skills.

Our goals are:

1. Preprocess our data using Node.js
2. Get our chart rendering on mobile devices responsively
3. Improve mouse interaction with a Voronoi layout.
4. Position tooltip properly.
4. Add some buttons to toggle between meters behind and seconds (or seconds behind)

Also, if you have other projects you'd like some help with, feel free to ask Kevin in class.


For those who were not here last time, here is a decent starter kit:

```
<!DOCTYPE html>
<meta charset="utf-8">

<link rel="stylesheet" type="text/css" href="style.css">

<body>

  <h1 class="my-hed">Hello</h1>

  <div class="g-graphic-container">
    <div class="g-readin-container">
      <table></table>
    </div>
    <div class="g-chart"></div>

    <div class="g-tooltip g-hidden">
      <div class="g-tt-athlete-name">Kevin Quealy</div>
      <div class="g-tt-medal-type">Gold</div>
      <div class="g-tt-meters-back">0</div>
      <div class="g-tt-country-name">U.S.A.</div>
      <div class="g-tt-year">2016</div>
    </div>
  </div>

</body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.6/d3.min.js" charset="utf-8"></script>


<script>

var tooltip = d3.select(".g-tooltip"),
  ttAthlete = d3.select(".g-tt-athlete-name"),
  ttMedalType = d3.select(".g-tt-medal-type"),
  ttMetersback = d3.select(".g-tt-meters-back"),
  ttCountryName = d3.select(".g-tt-country-name"),
  ttYear = d3.select(".g-tt-year");

var countryMap = {
  "USA": "United States",
  "GBR": "Great Britain",
  "JAM": "Jamaica",
  "CAN": "Canada",
  "TRI": "Trinidad and Tobago",
  "AUS": "Australia",
  "GER": "Germany",
  "NAM": "Namibia",
  "CUB": "Cuba",
  "URS": "Soviet Union",
  "BAR": "Barbados",
  "EUA": "United Team of Germany",
  "HUN": "Hungary",
  "PAN": "Panama",
  "NED": "Netherlands",
  "POR": "Portugal",
  "NZL": "New Zealand",
  "RSA": "South Africa",
  "BUL": "Bulgaria" 
};


var margin = {top: 20, right: 60, bottom: 20, left: 10};

var width = 900 - margin.left - margin.right,
   height = 550 - margin.top - margin.bottom;

var yScale = d3.scale.linear()
    .range([height, 0]);

var xScale = d3.scale.linear()
    .range([width, 0]);

var xAxis = d3.svg.axis()
    .scale(xScale)
    .tickSize(-height)
    .tickPadding(8)
    .orient("bottom");

var yAxis = d3.svg.axis()
    .scale(yScale)
    .tickPadding(8)
    .orient("right")
    .tickFormat(d3.round);

var svg = d3.select(".g-chart").append("svg")
   .attr("width", width + margin.left + margin.right)
   .attr("height", height + margin.top + margin.bottom)
 .append("g")
   .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

// station 1
d3.csv("medalists-all.csv", ready); 

function ready(err, data) {

  if (err) console.warn(err);

  var winnnerTime = d3.min(data.map(function(d) { return +d.time; }));

  data.forEach(function(d) {
    d.time = +d.time;
    d.year = +d.year;
    d.idx = +d.idx;
    d.metersBehind = 100 - (100/d.time) * winnnerTime;
  });

  medalsByCountry = d3.nest()
      .key(function(d) { return d.countryCode; })
      .entries(data);

  medalsByCountry
    .sort(function(a,b) {
      return b.values.length - a.values.length;
    });

  var row = d3.select(".g-readin-container table").selectAll(".g-row")
      .data(medalsByCountry)
      .enter()
      .append("tr")
      .attr("class", "g-row")
      .on("mouseover", highlightCountryGroup)
      .on("mouseout", unHighlightCountryGroup);

  row.append("td")
      .attr("class", "g-country-name")
      .text(function(d) { return countryMap[d.key]; });

  row.append("td")
      .attr("class", "g-medal-count")
      .text(function(d) { return d.values.length; });

  xScale.domain(d3.extent(data, function(d) { return d.metersBehind; }) );

  yScale.domain(d3.extent(data, function(d) { return d.year; }));



  svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis);

  svg.append("g")
      .attr("class", "y axis")
      .attr("transform", "translate(" + width + ",0)")
      .call(yAxis);

  var medalDot = svg.append("g").attr("class", "circle-group").selectAll(".g-medal-dot")
      .data(data)
    .enter().append("circle")
      .attr("r", 7)
      .attr("class", function(d) { return "g-medal-dot " + d.medal; })
      .attr("cx", function(d) { return xScale(d.metersBehind); })
      .attr("cy", function(d) { return yScale(d.year); })
      .on("mouseover", renderTooltip)
      .on("mouseout", hideTooltip);

  function highlightCountryGroup(countryRow) {
    var thisCountry = countryRow.key;

    medalDot
        .classed("g-hovering", function(d) { return d.countryCode == thisCountry; });
  }

  function unHighlightCountryGroup(d) {

    medalDot
        .classed("g-hovering", false);
  }

  function renderTooltip(d) {
    tooltip.classed("g-hidden", false);

    d3.select(this).classed("g-hovering", true);

    ttAthlete.text(d.name);
    ttMedalType.text(d.medal);
    ttMetersback.text(d.metersBehind);
    ttCountryName.text(countryMap[d.countryCode]);
    ttYear.text(d.year);
  }

  function hideTooltip(d) {
    medalDot.classed("g-hovering", false);
    tooltip.classed("g-hidden", true);
  }


}

</script>
```







    
