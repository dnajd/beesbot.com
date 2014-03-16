---
layout: post
title:  "Functional Ruby Fu!"
date:   2013-05-15
categories: ruby folding functions
summary: For some strange reason I keep forgetting ruby folding functions. So to be kind to my my future self, here is how it works.
permalink: functional-ruby-fu/
---
For some strange reason I keep forgetting ruby folding functions. So for my future self...

Reject
{% highlight ruby %}
[1, 2, 3, 4, 5].reject {|x| x%2==0}
=> [1, 3, 5]
{% endhighlight %}


Select
{% highlight ruby %}
[1, 2, 3, 4, 5].select {|x| x%2==0}
=> [2, 4]
{% endhighlight %}


Collect
{% highlight ruby %}
[1, 2, 3, 4, 5].collect {|x| x*2}
=> [2, 4, 6, 8, 10]
{% endhighlight %}


Inject
{% highlight ruby %}
sum = 0
[1, 2, 3, 4, 5].inject {|sum, x| sum + x}
=> 15
{% endhighlight %}


Now I will never forget!