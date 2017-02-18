---
layout: post
title:  "Interactive FluentNao"
date:   2014-05-16
categories: nao fluent-nao python
summary: I'll show you how to set up Fluent Nao code to interactively control Nao
permalink: interactive-fluent-nao/
---

Here I will show you how to set up Fluent Nao code to interactively control Nao.

## Setup Pynaoqi Python SDK

Download the [Python SDK](https://community.aldebaran-robotics.com/resources/) from Aldebaran's community site and extract it into a folder on your computer.  

Afer that add the folder to your PYTHONPATH by editing you .bashrc or .profile file.  For example on my linux system I added the following to my .bashrc

{% highlight bash %}
export PYTHONPATH=$PYTHONPATH:$HOME/development/opensource/pynaoqi-python2.7-2.1.0.19-linux64
{% endhighlight %}


## Setup Fluent Nao

Next up you'll need to clone fluent nao using [git](http://git-scm.com/)

{% highlight bash %}
git clone https://github.com/dnajd/FluentNao.git
{% endhighlight %}

And add the src/main/python folder to your .bashrc or .profile file.  For example on my system I added the following to my .bashrc

{% highlight bash %}
export PYTHONPATH=$PYTHONPATH:$HOME/development/opensource/FluentNao/src/main/python
{% endhighlight %}

## Bootstrap Python

To test things out you can edit the bootstrap.py file in the root of the FluentNao code you checked out.  

* Update the following line to Nao's ipaddress if needed. 
* Get Nao's ipaddress by pushing his chest button once.

{% highlight python %}
naoIp = "192.168.2.12"
{% endhighlight %}

Then run the bootstrap file in an interactive python shell to connect

{% highlight bash %}
python -i bootstrap.py
{% endhighlight %}


## Interactively Control Nao

Run a [FluentNao commands](https://github.com/dnajd/FluentNao/wiki) to test it out.

{% highlight bash %}
nao.say('hi')
{% endhighlight %}

If that worked you're ready to go.
