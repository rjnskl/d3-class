#Class 10: Even more on data joins
We'll go deeper into data joins and hopefully it will make more sense than last time. We'll start from a simpler place but end in a more complex one.

##Housekeeping
Anything good?
Possibly ending early tonight.

##Lab
Let's get to it. We'll go slow, and use a better example.

1. We'll work with a data set we've worked with before: the cross-national [income data from LIS](www.lisdatacenter.org/resources/other-databases/), which was the basis for this [New York Times story](http://www.nytimes.com/2014/04/23/upshot/the-american-middle-class-is-no-longer-the-worlds-richest.html). I formatted the data for you as [incomes.tsv](incomes.tsv) (itself a reshape of our old data set, [all-countries.tsv](all-countries.tsv). Download it to your local project folder and fire up a server and a standard `index.html` file.

2. Set up everything But the data join: load and format your data, define axes and scales, add an SVG and append axis components it.

3. These are best as lines, eventually, but for now, we'll keep it simple, with a scatterplot. Draw the values for all cutoff points for just the United States.

4. Our goal is to make a function that transitions the dots between one country and another, adding and removing dots as necessary, and possibly putting a title on top of the chart that says what country has been selected. This function should take the argument of the country name. Don't worry about adding `g` elements with `circle` and `text` children – let's start with circles.

5. First, try to get the circles drawing once, the first time, on refresh, using your function, without any updating.

6. We'll do these step by step, but generally, some options:

  1. Do your data join, but separate the data join and the enter function. Give this selection a class of `g-update`.

  2. Do your `enter()` selection, and give this selection a class of `g-enter`. 

  4. Make a new `selectAll` call, which will select all your elements, including those you just appended. Position your new circles accordingly.

  5. Sometimes your new data join will have less data than your old one, so you will have to perform an `exit()` selection and remove them from the SVG. Give this selection a class of `g-exit`. (A transition on this could help)


7. You can fire the function from your console, but probably you want them to happen with UI, so you might want to add them as buttons, or links. Possibly using a data join.

You are in great shape if you have circles appearing and disappearing when you fire the function for a new country. If you can, add transitions. Also, what about using the `key` property of the data join?

##Lab, part II
We'll introduce a little more complexity, hopefully ending back where we started at the end of last class. Instead of just doing the join with circles, let's do it with `g` elements, and append a `text` element and a `circle` to each. Update the label each time.

##Lab, part III
This is good for learning, but circles aren't right for this data set. It's clearly a trend over time. Make them lines instead of a scatterplot, and add the label for the last point in the data set.

##Chat time
We'll hopefully end a little early, and I'll be available to chat with some of you about your personal projects and small problems you're having, either on class subjects or your own work.
