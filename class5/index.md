#Class 5: D3 and hierarchical data 

##Housekeeping
  * Office hours
  * Class projects
  * Self-assessment on Thursday

##Discussion
Hopefully you've read these links:

  * [Arrays and nesting](https://github.com/mbostock/d3/wiki/Arrays#-nest)
  * [An older article by Mike about nesting](http://bost.ocks.org/mike/nest/)
  * [An extremely useful tool by Shan Carter](http://bl.ocks.org/shancarter/raw/4748131/)

Some examples of d3.nest() in action:
  * [Why Peyton Manning's Record Will Be Hard to Beat](http://www.nytimes.com/interactive/2014/10/19/upshot/peyton-manning-breaks-touchdown-passing-record.html?abt=0002&abg=0) Here, the raw data `touchdowns` and the nested one, `touchdownsByPlayer` are exposed in the console.
  * [Everyone's NCAA Bracket Predictions](http://www.nytimes.com/interactive/2015/03/18/upshot/ncaa-bracket-predictions.html?abt=0002&abg=0) Check out `ratingsByRoundAndTeam` in the Console, and the original [data source](http://graphics8.nytimes.com/newsgraphics/2015/03/17/ncaa-super-table/33363320293f8da2db52d0e280c7ff4c782e4b28/data.csv)
  * [America's Middle Class Is No Longer the World's Richest](www.nytimes.com/2014/04/23/upshot/the-american-middle-class-is-no-longer-the-worlds-richest.html?abt=0002&abg=0) We did a version of this last class.

Let's draw out the structures of the nested data on scratch paper or the whiteboard.

So, whats the point of having hierarchical data structures? And why transform them in the client?

##Activity
Today, everyone is a barley farmer.

As William S. Cleveland puts it in [Visualizing Data](https://books.google.com/books/about/Visualizing_Data.html?id=V-dQAAAAMAAJ):

  > In the early 1930s, agronomists in Minnesota ran a field trial to study the crop barley. Ax six sites in Minnesota, ten varieties of Barley were grown in each of two years. The data are the yields for all combinations of site, variety and year, so there are 6 x 10 x 2 =120 observations.

Find which city you're a barley farmer in from [this Google Doc](https://docs.google.com/spreadsheets/d/1PRjTK7IpVkhsWUFxbjBEISehIbhZyJSBLInK52Yp3EU/edit?usp=sharing). Find all the other members of the class with the same town as you and sketch a chart of whatever form you want. You can filter your data for just your site from [this tsv](barley.tsv).

The intent of the chart will be to **compare the yield for each variety of barley for that town in 1931 and in 1932** as effectively as possible.

Your group should produce just one chart. Take no more than 10 minutes to make this chart.

Once everyone has one, we'll put them up on the wall and discuss the merits of the form. Ideally, we'll also notice an anomoly in the data that researchers noticed in the 1930s, too.

Let's make a plan for the most effective way to display all these charts at once in the browser.  

##Lab

1. We're going to chart whatever we decide as a class is the best way to present the data for *all* the sites. Stay in your groups.

2. As always, let's get started making a starter kit for this chart. [This](https://github.com/thisismetis/data-visualization-with-d3/blob/master/class3/index.md#lab-part-1), from class 3, may help. You don't have to do all the steps right now, but you should have an `index.html` page on a localhost, with the data loaded and formatted, and your `xScale` and `yScale` defined, with ranges, if not domains. 

3. What structure would we like ideally for our data? Let's work with [Mister Nester](http://bl.ocks.org/shancarter/raw/4748131/) and see if we can get what we want.

4. Once we do, try to get your first data join working. What's the output in the DOM?

5. Add an SVG and axes to each element in your data join. Pick your SVG height and width with the goal of seeing all the charts at once. Give each chart a title.

5. Now we'll do *another* data join. 

6. If you have that, you should be able to add and style circles. How can you differentiate the colors to make it easier for readers?

7. Style your charts as best you can.

8. Can you tell what the anomaly is? 

##For overachievers
1. The way these are sorted can really improve their effectiveness. First, try to sort the sites by their median yield for all varieites in 1931 and 1932. Then, for each site, sort the varieties by their *overall* yield across all sites, in decreasing order. (Each site should have the same variety order.)

2. Use an additional nest to make 12 charts: one for each year at each site, which may allow better comparisons on a per-year basis.


##Further reading
[Tidy data](http://www.jstatsoft.org/v59/i10/paper) By Hadley Wickham