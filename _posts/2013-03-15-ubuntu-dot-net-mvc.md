---
layout: post
title:  "Ubuntu & .NET MVC"
date:   2013-03-15
categories: ubuntu .net mvc
summary: Mono.net and Mono Develop have come a long way; it's not only reasonable to run/develop .NET MVC on linux, it's damn near preferable.
permalink: ubuntu-dot-net-mvc/
---

Mono.net and Mono Develop have come a long way; it's not only reasonable to run/develop .NET MVC on linux, it's damn near preferable.

Setup to install Mono.NET

{% highlight bash %}
sudo apt-get update && sudo apt-get -y install git-core curl python-software-properties
{% endhighlight %}

Use nathanb's script to install mono 2.11 which includes MVC 4.

{% highlight bash %}
mkdir mono-2.11
cd mono-2.11
wget --no-check-certificate https://github.com/nathanb/iws-snippets/raw/master/mono-install-scripts/ubuntu/install_mono-2.11.sh
sudo chmod 755 install_mono-2.11.sh
sudo ./install_mono-2.11.sh
{% endhighlight %}

Run this to check if the correct version shows up

{% highlight bash %}
/opt/mono-2.11/bin/mono -V
{% endhighlight %}

To set as default, add it to the end of your .bashrc 

{% highlight bash %}
pico ~/.bashrc

# add at the end of your .bashrc
export PATH="$PATH:/opt/mono-2.11/bin"
{% endhighlight %}

Install mono develop 4 from source:

<script src="https://gist.github.com/choffmeister/5114966.js"></script>

As for building your applications to run on Linux:
Connect to mysql through [nhibernate](http://nhforge.org/), do it in an agile way with [fluent migrator](https://github.com/schambers/fluentmigrator) and don't forget the [mysql-connector-net-6.4.3](http://dev.mysql.com/downloads/connector/net/).

Off chance you have compile error related to "WebApplication.targets", look at [my solution on this stack overflow](http://stackoverflow.com/questions/10575509/webapplication-targets-missing-when-building-a-mvc4-project-in-monodevelop-on-os)

Beesbot.com ran on linux, nginx and mysql... before I moved it to jekyll.

By Don Najd