---
layout: post
title:  "Cache Jquery Ajax"
date:   2014-10-20
categories: cache jquery ajax promise
summary: Here is a very simple approach to caching Jquery ajax calls
permalink: cache-jquery-ajax/
---

Here is a very simple approach to caching Jquery ajax calls.

* Riffing on the use of plain ol' [object oriented javascript](/object-oriented-javascript/)
* using [jquery promise](http://api.jquery.com/promise/) to avoid callback hell
* and [jquery proxy](http://api.jquery.com/jquery.proxy/) to maintain context.


## The Model
Here is a simple prototype that will represent out Model and be responsible for making ajax calls.

{% highlight javascript %}

function MyModel(options) {
	this.url = "http://www.some-rest-service.com";
}

// cache
MyModel.prototype.cache = {};

// ajax method
MyModel.prototype.all = function (url) {

  // key to uniquely identify ajax call
  var cacheKey = 'all()';

  // check cache?
  if (!this.cache[cacheKey])
  {
  	// add to cache
    this.cache[cacheKey] = $.ajax({
      url: this.url,
      method: 'GET'
    }).promise(); 
  }

  // return promise
  return this.cache[cacheKey];
};
{% endhighlight %}

Notice how we store the [jquery promise](http://api.jquery.com/promise/), which callers will use to fetch data. 

Unlike a regular jquery events (binds and triggers) which must be caught right at the moment, a jquery promise can be used at any point after it's completion.  This is perfect for caching where subsequent calls will definitely be too late for a triggered event.  


## The View

Now a prototype that would be responsible for using the model to fetch data and render it somewhere.

{% highlight javascript %}
function MyView(options) { }

MyView.prototype.renderSomething = function () {
  
  // construct model
  var model = new MyModel();

  // call method
  model.all()
    .done($.proxy(function(data){

  	  // add data to MyView
  	  this.data = data;

  	  // render here

    }, this)
  );

 };

{% endhighlight %}

We simply created the model and used the .done method of the promise to deal with the data right there inline; we could have used a callback as well.  Also because we used the [jquery proxy](http://api.jquery.com/jquery.proxy/), the keyword 'this' still refers to the MyView.