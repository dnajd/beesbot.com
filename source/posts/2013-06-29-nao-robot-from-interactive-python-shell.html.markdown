---
layout: post
title:  "Control Nao Robot from Interactive Python Shell"
date:   2013-06-29
categories: python nao robot
summary: See how to control the Nao Robot from the interactive python shell. Meaning you type the commands, press enter and Nao moves.
permalink: nao-robot-python-interactive-shell/
---
See how to control the Nao Robot from the interactive python shell. Meaning you type the commands, press enter and Nao moves.

This is useful when showing Nao to a group of people and wanting to really quickly get nao into a position like "sit", "stand", etc. But it also powerful enough to get nao into any position and useful for creating animations to embed in your applications.

<iframe width="420" height="315" src="//www.youtube.com/embed/co3sydMPd3Q" frameborder="0" allowfullscreen></iframe>

Accomplished with [FluentNao](https://github.com/dnajd/FluentNao), an open source python library that also powers [naoscript](https://store.aldebaran-robotics.com/product/naoscript_1/); a application available via the Nao Store.

NOTE: to get this to work you have to add the [nao python sdk](https://community.aldebaran-robotics.com/resources/) and the path to [FluentNao](https://github.com/dnajd/FluentNao) to your [python path](http://stackoverflow.com/questions/3402168/permanently-add-a-directory-to-pythonpath) like so:

{% highlight bash %}
export PYTHONPATH=$PYTHONPATH:/path_to_fluent_nao/FluentNao/src/main/python
export PYTHONPATH=$PYTHONPATH:/path_to_sdk/python-2.7-naoqi-1.14-linux64
{% endhighlight %}

By Don Najd