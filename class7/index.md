#Class 6: Maps, part I
You could have an entire class on maps and D3: using the command-line tools, U.S. Atlas, Mapshaper command line, Gdal, projections, all without getting into optimization, interactivity or design. In this class we'll equip you to make two very common forms of maps – **Choropleth** and **Bubble** – and equip you to alter mapping examples to suit your needs.

##Housekeeping
  * [Google survey](https://docs.google.com/forms/d/1c9A26g_xExGjXyFVcsAq1YZvxoAMr0YA1a7kBKUO2HA/edit) If you haven't done so yet.

##Mini lecture: Mapping and Intent
Just like with charting, mapping is all about what you want to show. There's no such thing as the perfect form, especially with maps. A few examples:
  
  * [Presidential vote](http://elections.nytimes.com/2012/results/president)
  * [Emphasizing change](http://www.nytimes.com/interactive/2012/11/07/us/politics/obamas-diverse-base-of-support.html)
  * [Extremely detailed Senate election maps](http://www.nytimes.com/interactive/2014/11/04/upshot/senate-maps.html)
  * [House districts are hard](http://elections.nytimes.com/2014/results/house), and sometimes [maps shouldn't be maps](http://www.ericson.net/content/2011/10/when-maps-shouldnt-be-maps/)
  * [Pushing the envelope](https://www.flickr.com/photos/dukefifa/6307925837/)
  * Sometimes things are [easier by hand](http://farm9.staticflickr.com/8203/8199825791_e7f7919f8d_o.jpg) though

##Basic principles of GIS
This is easy for those of us who have been studying D3. Kevin is just going to talk for a minute and draw a picture on the whiteboard.

##Lab, Part 1: Why to use TopoJSON.

1. Let's download some data from the Census. How about a [big shapefile](https://www.census.gov/cgi-bin/geo/shapefiles2010/main) of counties? Download and unzip the 2010 counties file `tl_2010_us_county10` to your local project folder. 

1. If you have a GIS program, like QGis, feel free to inspect your shapefile there. Otherwise...

2. Let's go to Matthew Bloch's amazing [MapShaper.org](http://mapshaper.org/). Drag your `.shp` file to the browser and choose "simplify." See what happens to the file size as you move the slider.

3. Export the map as both TopoJSON and GeoJSON. Notice any difference?

4. Let's [look](http://bost.ocks.org/mike/simplify/) at how that difference in file size happens.

5. In a nutshell, that's all we need to know about TopoJSON: it's really good at reducing file size. It can do hard spatial things too, but for now let's focus on using TopoJSON files someon else has already prepared for us. If you want to do fancier things, [start installing command-line tools](http://bost.ocks.org/mike/map/#installing-tools).

##Lab part II: maps three ways
Our goal: to visualize [Chicago gun traces](guns-history.csv) with different goals in mind, and decide which is best for us.

6. Make a new `index.html` file like always. Add in a link to TopoJSON this time under your link to d3:

```
<script src="https://cdnjs.cloudflare.com/ajax/libs/queue-async/1.0.7/queue.min.js"></script>
```

1. Download [us.json](us.json) just like we always do and log it in the console.

8. To convert the TopoJSON back into GeoJSON, log this:

```
topoJSON.feature(us, us.objects.counties).features
```

What's the difference between them?

9. Set up and append an SVG just like always (though no margin is necessary this time, as we have no axes).

10. Let's imagine we wanted to do a data join and add 3,000 lines to our SVG. What would that code look like? Make a variable of the topojson features and do a data join with it, adding one circle for each county.

<!-- ```
svg.append("g")
    .attr("class", "counties")
  .selectAll("path")
    .data(TopoJSON.feature(us, us.objects.counties).features)
  .enter().append("path")
    .attr("d", path)
``` -->

11. Obviously, we need some way to tell the computer how to draw the shapes in our data. Luckily for us, they've been pre-projected. We can get into this in a minute. But for now, all we need to do is tell D3 it's a [geo.path()](https://github.com/mbostock/d3/wiki/Geo-Paths#path).  

```
var path = d3.geo.path();
```

12. Instead of appending circles, append paths -- just like any other path! Recall the argument paths get. Station 4 from our [Class 6 workshop](../class6/index.md) may be of help.

13. See anything good? Let's make a list of things we need to visualize our data.

14. We have three goals:
  * Make a map showing the extent of the geography of the origins of guns successfully traced to Chicago.
  * Make a choropleth map
  * Make a bubble map 

15. Things we may need: loading [more than one](http://bl.ocks.org/mapsam/6090056) data file at once, learning about [color scales](https://github.com/mbostock/d3/wiki/Quantitative-Scales#threshold-scales), some light data formatting, probably finding out the [center of a path](https://github.com/mbostock/d3/wiki/Geo-Paths#path_centroid)

16. A bonus, add a little interactivity to your map using `mouseover` and `mouseout`.

16. We'll make all three and decide as a class which is best for the story we want to tell.

##It's not that simple, though.
If there's time, we'll talk about projections, scaling and so on.

##Reading for next week
  * Mike's helpful [tutorial series](http://bost.ocks.org/mike/map/).
  * [When Maps Shouldn't Be Maps](http://www.ericson.net/content/2011/10/when-maps-shouldnt-be-maps/) by Matt Ericson, NYT Big Dog

#Helpful links
  * [Sickening examples](https://www.jasondavies.com/maps/) from Jason Davies
  * Mike's [US Atlas](https://github.com/mbostock/us-atlas)
  * Matt Bloch's amazing [Mapshapr](http://mapshaper.org/)
  * [QGIS](http://www.qgis.org/en/site/) is excellent, free GIS software 
  * I use [this bl.ock](http://bl.ocks.org/mbostock/3306362) as a starter kit at least once a week.
  * Gregor's very helpful [color picker](http://gka.github.io/palettes/#colors=lightyellow,orange,deeppink,darkred|steps=7|bez=1|coL=1)
  * [Every ColorBrewer scale](http://bl.ocks.org/mbostock/5577023)
  * [Where 50,000 Guns in Chicago Came From](http://www.nytimes.com/interactive/2013/01/29/us/where-50000-guns-in-chicago-came-from.html) (NYT)