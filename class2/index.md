
#Class 2: Charting and intent; one dataset two ways

Here's what we'll do today:

"SOFT" (non-technical)
  - Understand the role of intent in charting
  - Learn about the role of redesign (and empathy) in data visualization critique
  - Use color more effectively 
  - Learn what bar charts are good for without slipping into a world without joy
  - Design a bar chart to show editorial intent

"HARD" (more technical)
  - Get more experience with d3 selections, data joins and axes
  - Complete a fully functional scatterplot with last week's data
  - Load data asynchronously with d3.tsv
  - Date parsing and formatting
  - Javascript array manipulation

Documentation pages that may be useful today:

[SVG](https://developer.mozilla.org/en-US/docs/Web/SVG):
  - [g](https://developer.mozilla.org/en-US/docs/Web/SVG/Element/g)
  - [text](https://developer.mozilla.org/en-US/docs/Web/SVG/Element/text)
  - [rect](https://developer.mozilla.org/en-US/docs/Web/SVG/Element/rect)

[D3](https://github.com/mbostock/d3/wiki):
  - [d3.tsv](https://github.com/mbostock/d3/wiki/CSV#tsv)
  - [d3.scale.ordinal()](https://github.com/mbostock/d3/wiki/Ordinal-Scales)
  - [d3.svg.axis()](https://github.com/mbostock/d3/wiki/SVG-Axes)
  - [d3.select()](https://github.com/mbostock/d3/wiki/Selections#d3_select)
  - [d3.selectAll()](https://github.com/mbostock/d3/wiki/Selections#d3_selectAll)
  - [d3.extent](https://github.com/mbostock/d3/wiki/Arrays#d3_extent)
  - [selection.data()](https://github.com/mbostock/d3/wiki/Selections#data)
  - [ordinal.rangeRoundBands()](https://github.com/mbostock/d3/wiki/Ordinal-Scales#ordinal_rangeRoundBands)

Plain JS
  - [Array.map](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map)

##Housekeeping
Before we start, any questions about technical aspects of last time? We'll try be less rote today.

##Discussion
Hopefully we all read these four links:

 
  - [Redesigining a Circular Timeline](http://www.thefunctionalart.com/2015/02/redesigning-circular-timeline.html)
  - [Design and Redesign in Data Visualization](https://medium.com/@hint_fm/design-and-redesign-4ab77206cf9)
  - [What are you trying to say?](http://lulupinney.co.uk/2012/08/what-are-you-trying-to-say/)


Let's discuss! I have questions for you, but I'm curious to hear your thoughts first.

##Activity
You can put your computers away for a while; we're going do an exercise about intent with [this LA Times](http://graphics.latimes.com/food-water-footprint/) piece

1. Take a look at this [Google Spreadsheet](https://docs.google.com/spreadsheets/d/1o9H2tkOmAhy_cH8eySMInj7-ZeFklMRnDZRmnLHbBz4/edit#gid=0).

2. Your job is to give your best guess as to what each unit (bubble or bar) represents, using your eyeballs.

##Lab part 2.
We're going to finish the chart we started last week. If things go well, ours could even be an improvement on what we could get in five minutes with Excel.

We made it to step 3, but we can go over this again as a refresher...

1. Clear out or start a new `index.html`. 

2. Make a Javascript object out of your tabular data and make sure you know how to manipulate it. (This is an annoying but useful exercise in getting useful in a text editor.) I'll use the data from the group number II, but you should chart whatever you drew.

2. Add an SVG element of width 720 and height 400.

3. Using a data join, add a circle for every element of our array. Give it a radius 5 and a class, `anscombe-circle'. Inspect it in the browser. To start, I like to put a pink border around the SVG to make sure I knew it drew:

  ```
  svg {
    border: 1px solid #f0f;
  }
  ```

4. Position the circles based on their `x` and `y` attributes. How does SVG interpret these positions?

5. We need a [scale](https://github.com/mbostock/d3/wiki/Quantitative-Scales#linear-scales). Let's add one. (There's a trick.)

<!-- 6. Checkpoint 1 is [here](c1.html). -->

7. Let's label the coordinate positions of each using text. Is another data join really necessary?

8. Redo the original join, using groups first, then appending circles and text. Note SVG [transformation](http://www.w3.org/TR/SVG/coords.html) documentation, which is not that fun. Scott Murray [does better](http://chimera.labs.oreilly.com/books/1230000000345/ch08.html#_cleaning_it_up).


10. Maybe [axes](https://github.com/mbostock/d3/wiki/SVG-Axes) are in order? The built-in components are a little clunky, and [Gregor](https://twitter.com/driven_by_data) prefers not to use them at all, but you have to know the rules before you break them, so let's use them for now.  

11. We might need to move our axes around. We'll go through the math. Also, it looks horrible unstyled. Let's inspect it and fix, using CSS.

12. The margins are a problem, and they will always be. Here's [a great trick](http://bl.ocks.org/mbostock/3019563) we'll use on every chart we make from here on out.

<!-- 9. Checkpoint 3 is [here](c3.html). -->

10. Let's style the chart to match our drawing. Things like [tickSize](https://github.com/mbostock/d3/wiki/SVG-Axes#tickSize) might help.

<!-- 11. Checkpoint 4 is [here](c4.html). -->

15. Let's make this a block before time runs out, using git and Github. Add a thumbnail and check out your own bl.ocks page! [Not bad](http://bl.ocks.org/kpq/585b89ff4657dcb35dc1)!


##If there's time/getting more advanced

11. Let's load the data instead of having it as an object inline. Why would we want to do that?

12. Might we want to make the scale in a not-hard-coded way?

13. Add `p` tags under the chart for the mean of x and y. Calculate them dynamically.

1. Load your data dynamically instead of using a variable. (Why would we want to do that?) Here's [a tsv](quartet.tsv) to get you started. You might need to filter your data before plotting your quartet.

2. So far, after 100 lines of code, our chart isn't really better than what we get with the free tools. (Paste your data into [Chartbuilder](http://quartz.github.io/Chartbuilder/) and feel free to weep.) What makes D3 different is its ability to create **dynamic** visualizations and things that tools aren't designed to create. A scatterplot is simple to make a widget for; [other forms](http://www.nytimes.com/newsgraphics/2013/09/28/eli-manning-milestone/), less so.

 To push this further, abstract our chart out by making a funciton that updates the chart given a group id, including updating the text fields for averages. Fire the function (and update the chart) every three seconds.

4. If you're really interested in doing stats in Javascript, calculate the Pearson Coefficient and best-fit line and update both in your function. 



<!-- #Class 2: Charting and intent; one dataset two ways

Here's what we'll do today:

"SOFT" (non-technical)
  - Understand the role of intent in charting
  - Learn about the role of redesign (and empathy) in data visualization critique
  - Use color more effectively 
  - Learn what bar charts are good for without slipping into a world without joy
  - Design a bar chart to show editorial intent

"HARD" (more technical)
  - Get more experience with d3 selections, data joins and axes
  - Make a bar chart in d3
  - Use ordinal scales and d3.rangeBand
  - Load data asynchronously with d3.tsv
  - Date parsing and formatting
  - Javascript array manipulation
  - Revisit high school math that's somehow a lot harder than you remember

Documentation pages that may be useful today:

[SVG](https://developer.mozilla.org/en-US/docs/Web/SVG):
  - [g](https://developer.mozilla.org/en-US/docs/Web/SVG/Element/g)
  - [text](https://developer.mozilla.org/en-US/docs/Web/SVG/Element/text)
  - [rect](https://developer.mozilla.org/en-US/docs/Web/SVG/Element/rect)

[D3](https://github.com/mbostock/d3/wiki):
  - [d3.tsv](https://github.com/mbostock/d3/wiki/CSV#tsv)
  - [d3.scale.ordinal()](https://github.com/mbostock/d3/wiki/Ordinal-Scales)
  - [d3.svg.axis()](https://github.com/mbostock/d3/wiki/SVG-Axes)
  - [d3.select()](https://github.com/mbostock/d3/wiki/Selections#d3_select)
  - [d3.selectAll()](https://github.com/mbostock/d3/wiki/Selections#d3_selectAll)
  - [d3.extent](https://github.com/mbostock/d3/wiki/Arrays#d3_extent)
  - [selection.data()](https://github.com/mbostock/d3/wiki/Selections#data)
  - [ordinal.rangeRoundBands()](https://github.com/mbostock/d3/wiki/Ordinal-Scales#ordinal_rangeRoundBands)

Plain JS
  - [Array.map](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map)
  - [Date](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date)
  - [Split](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split)

##Housekeeping
Before we start, any questions about technical aspects of last time? We'll try be less rote today.

##Discussion
Hopefully we all read these four links:

  - [The Power of Visualization’s “Aha!” Moments](https://hbr.org/2013/03/power-of-visualizations-aha-moment/)
  
  - [Redesigining a Circular Timeline](http://www.thefunctionalart.com/2015/02/redesigning-circular-timeline.html)
  - [Design and Redesign in Data Visualization](https://medium.com/@hint_fm/design-and-redesign-4ab77206cf9)
  - [What are you trying to say?](http://lulupinney.co.uk/2012/08/what-are-you-trying-to-say/)


Let's discuss! I have questions for you, but I'm curious to hear your thoughts first.

##Activity
You can put your computers away for a while; we're going to play with some Skittles for a while. 

1. Take a look at this [Google Spreadsheet](https://docs.google.com/spreadsheets/d/1uyNVim2V0YwEDS521EdVM3SmLrSih8pzQtrh9s0EQF0/edit?usp=sharing) and arrange yourselves with people in your group. Standing or sitting is fine, but you may need to push some desks together.

2. Everyone gets one bag of Skittles. Enter the number of each kind of Skittle in your bag in the spreadsheet on the row next to your name. You might want to write it down so you can re-make your bag if necessary.

3. I'll read a series of prompts or intents, and as a group you will make the charts that best suits that intent.

5. We discuss the Skittles, probably throw them away, and get back to our seats.



####Some possible prompts####
• I want to be able to count the total number of Skittles as quickly as possible regardless of flavor they are. 

• I want to be able to count the number of Skittles of each type, for each bag. 

• I want to be able to know which bags of skittles had the most and fewest of each flavor

• I want to know which flavor-bag combinations were largest, and which were smallest?

• For each flavor, I want to compare the variance in each bag?

• I want to see a comparison of the the overall makeup of each bag AND their makeups by color. 

• I want to know the ovall breakdown of all flavors for the group.

• I want to see the overall color makeup of all the bags as parts of a whole. 



##The intent of the simplest form of all: the bar chart

• There are endless supplies of forms, many of which are listed [here](http://extremepresentation.typepad.com/files/choosing-a-good-chart-09.pdf).

• Depending on what you want to show, certain visual effects are more effective than others. [This chart](http://courses.cs.washington.edu/courses/cse512/14wi/lectures/CSE512-Design.pdf), oroginally by [Jock Mackinlay](https://en.wikipedia.org/wiki/Jock_D._Mackinlay) (and included in Tufte's [Visual Display of Quantitative information](https://books.google.com/books/about/The_Visual_Display_of_Quantitative_Infor.html?id=v2x4nQEACAAJ&hl=en)), shows the effectiveness of various kinds of encoding. These are basically all the tools we get to work with.

• Strengths of bar charts
  * Everything can be a bar chart if necessary
  * Comparing a few items
  * Revealing simple patterns
  * Lots of variations 

• Weaknesses of bar charts
  * Zero-basing
  * Ordering of items

• Examples of NYT bar charts, (not all made using D3):
  * [The N.F.L. Players Mentioned Most on “SportsCenter”](http://www.nytimes.com/interactive/2012/02/04/sports/football/most-mentioned-players-on-espn.html) 
  * [An Expensive Outlier](http://www.nytimes.com/2013/08/27/sports/ncaafootball/to-defend-its-empire-espn-stays-on-offensive.html?pagewanted=all)
  * [At Chipotle, How Many Calories Do People Really Eat?](http://www.nytimes.com/interactive/2015/02/17/upshot/what-do-people-actually-order-at-chipotle.html)
  * [Where College Football is ‘Liked’ Most](http://www.nytimes.com/2014/11/08/upshot/the-places-in-america-where-college-football-means-the-most.html?abt=0002&abg=0)
  * [The Roberts Court’s Surprising Move Leftward](http://www.nytimes.com/interactive/2015/06/23/upshot/the-roberts-courts-surprising-move-leftward.html)
  * [Nearly one-third of all hate crime victims in 2013 were black; Mass shootings on the rise](http://www.nytimes.com/interactive/2015/06/18/us/charleston-church-shooting-maps-and-suspect.html)
  * [Is it Better to Rent or Buy?](http://www.nytimes.com/interactive/2014/upshot/buy-rent-calculator.html)
  * [Who Will Win the Senate?](http://www.nytimes.com/newsgraphics/2014/senate-model/)

##Lab
Every month, the BLS releases the [jobs report](http://www.bls.gov/news.release/empsit.nr0.htm), which contains the unemployment numbers for the month. The two most newsworthy numbers are the change in nonfarm payroll – how many jobs the country gained or lost that month – and the monthly unemployment rate.

We want to make a bar chart of the change in nonform payroll that could be updated dynamically every month by replacing the data file.

Let's make it together, step by step, going as slowly as we need to. I'll update this page with detailed directions of how I might do it, with checkpoints like last time, once class is over.

Here's [the data](jobs.tsv).


1. First, as always, make a new folder and an empty `index.html` file. Include D3 and start up a server.

2. Download [the file](jobs.tsv) and take a look, whether in your browser or in a spreadsheet.

3. Let's think about what we want our chart to look like. Is there any visual emphasis we might want if it will update every month? Take a minute and sketch out a chart that includes just one year of data — say, everything for 2012.

4. Now let's consider our technical needs. Things like:
  * What do our dates look like?
  * What kind of scales will we need?
  * What kind of SVG elements do we need in a bar chart?

5. Let's render an SVG element on our page with a width of 720 and a height of 400, just like last time. I always use this handy [starter bl.ock with margin conventions](http://bl.ocks.org/mbostock/3019563) to get started.

6. We don't have our data yet. Let's load it in using [D3.tsv](https://github.com/mbostock/d3/wiki/CSV#tsv), a very handy way to load data asynchronously in D3. Let's look at the docs, then load the data.

8. We should format our data. Make our numbers numbers.

7. Checkpoint 1 [is here](class2_checkpoint1.html).

9. [Dates](https://github.com/mbostock/d3/wiki/Time-Intervals) are gross. Let's discuss, particularly with regard to our scale. We could take a couple approaches depending on how defensive we want to be. Thoughts?

10. The docs are prepared with the riskier/realistic version of the two scenarios, but there are options.

11. Checkpoint 2, with domains and ranges for both scales, [is here](class2_checkpoint2.html).

12. OK, we're ready to do our data join. Let's just do it with `rect`s to start. Let's add one rectangle per month. This is actually relatively annoying to create, to be honest.

13. After a lot of discussion about high school algebra, [Checkpoint 3](class2_checkpoint3.html) is here.

14. Let's add some easy things, like axes. And style them!

15. Let's do some small touches that make a big difference: visually diferrentiating the zero axis line, the most current month, perhaps labeling it as well, adding a title and so on.

16. [Checkpoint 4](class2_checkpoint4.html) is a good start.

##On your own

Those of you in Skittles groups 1, 2 and 3 may consider yourselves Republican chartmakers; those of you in groups 4 and 5 are Democratic chartmakers.

Late in the 2012 Presidential election, both parties tried to "spin" the jobs report to match their campaigns. Democrats focused on private-sector growth (`private_job_growth` in our tsv), emphasizing that it had been positive for 31 consecutive months. 

Republicans noted that just to keep pace with population growth, the economy would need to add 150,000 jobs per month just to keep pace. Keeping that in mind, they considered job growth weak.

Your job is to make the chart that best makes your case for your opinion of the jobs report. Most of the technical framework is here already; most of your work will be deciding what to show and how to show it.

Ideally, publish your chart as a bl.ock and share it in our Slack channel. Feel free to ask each other for tips and feedback throughout the process.

I'll happily give advice to anyone who asks for it and has a link to share. Ideally, you post yours over the weekend, but you're the boss.


##Links
Our in-class exercise was based on this [fun blog post](http://www.everydayanalytics.ca/2015/05/data-visualization-fundamentals-with-skittles.html) by Myles Harrison. -->