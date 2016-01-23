#Class 8: Maps, part II
We'll make things a little bit less magical and make some more maps. Headaches may be involved, but you should also get a real sense of the power of the free tools that are out there, too.

##Housekeeping
  * Projects

#Mapping checklist.

Just like we did with [charts](https://github.com/thisismetis/data-visualization-with-d3/blob/master/class3/index.md#lab-part-1), we may benefit from a small checklist when making maps.

**General gameplan for making a map**

1. If you're starting with a Shapefile, you will need to convert to TopoJSON somehow. I prefer [Mapshaper](http://www.mapshaper.org), but there are plenty of options.
1. Navigate to your working directory, create an `index.html` file with D3, queue and topojson loaded and start a local server
1. Load all your data
1. Add an SVG on the page.
1. Format your data, adding fields as necessary
1. Convert topojson back to geoJSON
1. Define a geo path 
1. Create your map in SVG using a data join with your geojson features.
1. Create a link, preferably using a Javascript object, to link your feature attribute ID to your data.
1. Style your map accordingly.

##Lab, part I
Today we're going to be working with data that's a little different than states and counties. Specifically, data about droughts.

1. Start by downloading the National Climatic Data Center drought boundaries shapefile from [this page](http://www.esrl.noaa.gov/psd/data/usclimdivs/boundaries.html). We'll also need some data for the Palmer Drought Severity Index, which is [found here](http://www1.ncdc.noaa.gov/pub/data/cirs/climdiv/climdiv-pdsidv-v1.0.0-20150706). Download both to your local folder.

2. Take a look at the csv and Google around until you know what the numbers represent.

2. Let's explore the shapefile. It's nice if you have the [Mapshaper node module](https://github.com/mbloch/mapshaper#installation) installed, but you don't need to. Check out the awesome console tool in the browser! Or install it locally if you like.

3. Let's simplify our data manually, using your simplification algorithm of choice, then load it in the browser like we did with the US data.

4. Draw your map!

5. But wait. There's a problem. What is it? Back to mapshaper!

6. Now add the .dbf to your output and draw the map again.

7. One problem solved, but another one inserted. What is it?

8. Poke around the mapshaper command line interface. We really only care about outputtting `CLIMDIV` field.

9. You're ready to go if you are loading a relatively small topojson file that has the `CLIMDIV` id in it. Next we can visualize it.

10. Projections, and scale, and sadness.

##Lab, part II.
Our goal is to make a map drought severity in the United States as of June 2015. [These breakpoints](http://www.cpc.ncep.noaa.gov/products/analysis_monitoring/regional_monitoring/palmer.gif) may be useful for our color scale's domain, but we can probably do better on the colors – perhaps with [every ColorBrewer scale](http://bl.ocks.org/mbostock/5577023)?

Also, we'll need to create a data object that gives us the drought value given a `CLIMDIV` id and year.

##Lab, part III
Use d3.nest() or a function and generalize your code to make 100 maps -- one for June of every year since 1915. We're going to run into performance issues, I bet.

<!-- ##Bonus -->
