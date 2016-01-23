#Class 4: Line charts, abstracting code

##Housekeeping
Anything to discuss?

##Discussion
Based on our discussion last time, here are a few more examples of good "layering" techniques for more complicated forms and ideas:

  
  - [A 3-D View of a Chart That Predicts The Economic Future: The Yield Curve](http://www.nytimes.com/interactive/2015/03/19/upshot/3d-yield-curve-economic-growth.html)
  - [The Facebook Offering: How It Compares](http://www.nytimes.com/interactive/2012/05/17/business/dealbook/how-the-facebook-offering-compares.html)
  - [Fewer Helmets, More Deaths](http://www.nytimes.com/interactive/2014/03/31/science/motorcycle-helmet-laws.html)
  - [How the Recession Reshaped the Economy, in 255 Charts](http://www.nytimes.com/interactive/2014/06/05/upshot/how-the-recession-reshaped-the-economy-in-255-charts.html)
  - [The Tenure Pipeline at Harvard Business School](http://www.nytimes.com/2013/09/08/education/harvard-case-study-gender-equity.html?ref=education)

Be sure to look at both mobile and desktop, too.


##Line charts

• Strengths of bar charts
  * Another workhorse
  * Ideal for comparing relationships over time
  * Generally better than bar charts if you're comparing more than two series 

• Common mistakes
  * Legends when they are not necessary (dynamic labels can be a headache too though)
  * Dual Axes
  * 3D charts (except when it's not a mistake)

• Examples of NYT line charts, (not all made using D3):
  * [The Jobless Rate for People Like You](http://www.nytimes.com/interactive/2009/11/06/business/economy/unemployment-lines.html) 
  * [Recovering, But at Different Paces](http://www.nytimes.com/interactive/2012/11/27/us/recovering-but-at-different-paces.html?ref=us)
  * [Case Shiller Home Prices Interactive](http://www.nytimes.com/interactive/2014/01/23/business/case-shiller-slider.html)
  * [Why Peyton Manning’s Record Will Be Hard to Beat](http://www.nytimes.com/interactive/2014/10/19/upshot/peyton-manning-breaks-touchdown-passing-record.html)
  * [How Likely is it that Birth Control Could Let You Down?](http://www.nytimes.com/interactive/2014/09/14/sunday-review/unplanned-pregnancies.html)
  * [American Middle Class is No Longer the World’s Richest](http://www.nytimes.com/2014/04/23/upshot/the-american-middle-class-is-no-longer-the-worlds-richest.html?abt=0002&abg=0)

##About SVG paths

Let's take a look at [the documentation](http://www.w3.org/TR/SVG/paths.html) for paths.

##Lab, part I
The Upshot launched with a large story using a study by the Luxembourg Income Study (LIS) that included cross-country comparisons for a variety of income levels in a handful of countries. The Times focused on comparing middle-class incomes, publishing a front--age story titled [The American Middle Class Is No Longer the World’s Richest
](http://www.nytimes.com/2014/04/23/upshot/the-american-middle-class-is-no-longer-the-worlds-richest.html?abt=0002&abg=0). We’ll work with [the data used in that story](http://www.lisdatacenter.org/resources/other-databases/) today. 

Open up the data in a spreadsheet of your choice and spend a few minutes getting to know what the fields represent.

Our first goal will be to **make a line chart of the middle class income for the U.S.** using the PPP positional measure (tab 3). Make a .tsv out of just the USA data and save it locally in your folder.

1. Using our [checklist from last week](https://github.com/thisismetis/data-visualization-with-d3/blob/master/class3/index.md#lab-part-1) ([bl.ock](http://bl.ocks.org/kpq/4ec215b40c1d559fcb2a)) (or your own if you prefer), get your basic starter kit up and running: an SVG on your page with the data loaded. Let's go step by step – hopefully it's second nature by now.

2. We'll probably have to add some custom fields here in our data formatting section. Create a field called `year` and a field called `country`. We'lll probably need to do some light data work to make this happen. Also, make sure your numbers are numbers.

2. What kind of scales do we need? What will our domains be? Is this an instance where we want to override the minimum y domain?

3. Start by making a scatterplot of the data to make sure everything's rendering properly. Do what you can to get your axes styled reasonably well, too. 

4. Now we'll use the [d3.svg.line](https://github.com/mbostock/d3/wiki/SVG-Shapes#line). Here's [an example](http://bl.ocks.org/mbostock/3883245) I use all the time.

  Assuming we have a year field, we should make a line function that looks something like this:

  ```
  var line = d3.svg.line()
        .x(function(d) { return xScale(d.year); })
        .y(function(d) { return yScale(d.cop50); });
  ```

5. The data join for lines is a little different – each line takes an array of values rather than a single point. So in our case, we just have one item to bind to the data – our array for the U.S.

  ```
  var usaLine = svg.append("path")
      .datum(usaData)
      .attr("d", line);
  ```

  Try to get that to render; then style it. Do everything you can to make this publication quality. Let's discuss.


##Lab Part II
Let's say we'd like to compare the U.S. to Canada. 

1. Load a new tsv that has all the data and add a line for Canada.

2. Do some styling to help draw a difference between the two. Also, think about how you might label them.

3. What's the benefit of this technique? A drawback?


##Lab Part III
Now we want to make the computer do work for us. Let's abstract our code to make a function, which will let us sketch a little more efficiently. Our goal: make a function that draws a chart comparing compares the U.S. to any country we like. Use this function to make the chart for every country. ([This page](https://github.com/mbostock/d3/wiki/Arrays) may be useful to get the list of unique countries.)

##Lab Part IV
This is a completely fine way to work, but if there's time, we'll also use one of D3's most powerful data transformation tools, [d3.nest()](https://github.com/mbostock/d3/wiki/Arrays#-nest), to learn how to do all this without any functions. (We'll spend a lot of time next week on this too.)










