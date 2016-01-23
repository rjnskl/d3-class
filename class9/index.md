#Class 9: More on data joins and interactivity
So far, we've just made static charts. But unlocking what D3 is best at sometimes means making things [dance](http://www.nytimes.com/interactive/2015/07/21/upshot/election-2015-the-first-gop-debate-and-the-role-of-chance.html?hp&action=click&pgtype=Homepage&module=second-column-region&region=top-news&WT.nav=top-news&abt=0002&abg=1).

##Housekeeping
Anything good?

##Some review from last week

**Comet streaks code**
The code behind the streak comets from the [Eli Manning](http://www.nytimes.com/newsgraphics/2013/09/28/eli-manning-milestone/) graphic. Lesson here is, a line function is just a tool to help you generate a simple path. But if you know what you want, you can make your own.

```
var streakComet = team.append("g")
    .attr("class", "g-streak-comets")
  .selectAll("path")
    .data(function(d) { return d.values; })
  .enter().append("path")
    .attr("class", function(d) { return "g-player-" + d.player + (d.teamRecord ? " g-streak-team-record" : "") + (d.playerRecord ? " g-streak-player-record" : ""); });

streakComet
    .attr("transform", function(d) { return "translate(" + yearScale(d.start) + ",0)"; })
    .call(renderComet, function(d) { return yearScale(d.end) - yearScale(d.start); });

function renderComet(path, width) {
  path.attr("d", function() {
    var w = Math.max(1, (typeof width === "function" ? width.apply(this, arguments) : width) - .5),
        m = w / 10,
        ab = w - Math.sqrt(w) * .6,
        ae = w,
        offset = cometHeight / 2,
        t = Math.max(offset, Math.sqrt(w / 26) * 3);
    return  "M0," + -offset +
            "L0," + offset +
            "Q" + ae + "," + offset + "," + ab + "," + t +
            "L" + ae + "," + 0 +
            "L" + ab + "," + -t +
            "Q" + ab + "," + -offset + "," + m + "," + -offset +
            "z";
  });
}
```

**Reviewing the maps super nest, and a new kind of selection**
Last week ended with a challenge of sorts about making 100 drought maps. Let's talk about the code, which, while not perfect, has some new things in it. This is  useful documentation about [selection.each()](https://github.com/mbostock/d3/wiki/Selections#each).

```
<!DOCTYPE html>
<meta charset="utf-8">

<style type="text/css">

  body {
    font-family: arial, sans;
    font-size: 14px;
    width: 960px;
    margin: 40px auto;
  }
  svg {
    border: 1px solid #f0f; 
  }

  .g-map-group {
    width:180px;
    display: inline-block;

    margin-right: 10px;
  }

  .map-container path {
    fill:#d0d0d0;
    stroke:#fff;
    stroke-width:.3px;
  }

</style>

<body>

</body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.5/d3.min.js" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/queue-async/1.0.7/queue.min.js"></script>
<script src="http://d3js.org/topojson.v1.min.js"></script>


<script type="text/javascript">
  
var width = 180,
    height = 120;

// 

var myProjection = d3.geo.albersUsa()
    .scale(250)
    .translate([width/2, height/2]);

var path = d3.geo.path()
    .projection(myProjection);

var color = d3.scale.threshold()
    .domain([-4,-3,-2,2,3,4])
    .range(["#8c510a","#d8b365","#f6e8c3","#f5f5f5","#c7eae5","#5ab4ac","#01665e"]);

queue()
    .defer(d3.json, "GIS.OFFICIAL_CLIM_DIVISIONS-fewer-fields.json")
    .defer(d3.csv, "tidy-drought-data.csv")
    .await(ready);

function ready(error, climateDivisions, data) {
  if (error) return console.warn(error);


  droughtByDivision = {};
  data.forEach(function(d) {
    droughtByDivision[d.id] = +d.val;
  });

  droughtByYear = d3.nest()
      .key(function(d) { return d.year; })
      .entries(data);

  droughtByYearAndId = d3.nest()
      .key(function(d) { return d.year; })
      .key(function(d) { return d.id; })
      .map(data);

  var climateDivisionsFeature = topojson.feature(climateDivisions, climateDivisions.objects.GIS).features;

  var mapGroup = d3.selectAll("body").selectAll(".g-map-group")
      .data(droughtByYear.slice(0,12))
      .enter().append("div")
      .attr("class", "g-map-group");

  mapGroup.append("h3") 
      .text(function(d) { return d.key; });

  mapGroup.each(function(group) {
    
    var yr = group.key;

    var svg = d3.select(this).append("svg")
        .attr("width", width)
        .attr("height", height);

    svg.append("g")
        .attr("class", "map-container")
      .selectAll("path")
        .data(climateDivisionsFeature)
      .enter().append("path")
        .attr("d", path)
        .style("fill", function(d) {
          var val = droughtByYearAndId[yr][d.properties.CLIMDIV][0].val;
          if (!val) return "#ccc"; 
          return color(val);
        });

  });


}

</script>
```

## Useful links for the day
1. [Three little circles](http://bost.ocks.org/mike/circles/)
1. [How selections work](http://bost.ocks.org/mike/selection/)
1. [selection.data()](https://github.com/mbostock/d3/wiki/Selections#data)
1. [General update pattern](http://bost.ocks.org/mike/join/)
3. [General Update Pattern](http://bl.ocks.org/mbostock/3808218)

4. I like this checklist, personally.

	2. Make new data join
	3. Get rid of old elements
	4. Enter new elements
	5. append elements as needed
	6. update new selection

##Lab, part 1
1. This is a speed test! Get a scatterplot of Group 1 of Anscombe's quartet on an index.html file as fast as you can. Have a `g` element for each row of your data; inside that, have a `circle` and a `text` element.

2. Our goal: update the chart to show whatever group is selected when you press a button.

3. Bonus points for: even cheap tooltips displaying the values on mouseover, updating your axis based only on domain of group that's selected


##Lab, part 2
If we're feeling bold, let's make a chart of income change by decile for a given country. Make a list of links, buttons or drop-down menus and have the chart redraw with values for that country.
