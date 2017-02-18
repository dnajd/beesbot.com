---
layout: post
title:  "Ubuntu & .NET MVC"
date:   2013-03-15
categories: ubuntu .net mvc
summary: Mono.net and Mono Develop have come a long way; it's not only reasonable to run/develop .NET MVC on linux, it's damn near preferable.
permalink: ubuntu-dot-net-mvc/
---

Mono.net and Mono Develop have come a long way; it's not only reasonable to run/develop .NET MVC on linux, it's damn near preferable.

## Install Mono & Mono Develop

UPDATE April 13, 2014: Installing the latest Mono and Mono Develop is much easier than it was in 2013.  It's as simple as following this:

* Install [Mono](http://www.mono-project.com/docs/getting-started/install/linux/#debian-ubuntu-and-derivatives)
* Install [Monodevelop](http://www.monodevelop.com/download/linux/)
* Install [Nuget](https://github.com/mrward/monodevelop-nuget-addin)


## XSP4

To run your applications from Mono Develop you need to install xsp4

{% highlight bash %}
sudo apt-get install mono-xsp4 
{% endhighlight %}

## Database Agnostic

Run you application on MS SQL Server, Mysql or Postgres.

* Connect to mysql through [nhibernate](http://nhforge.org/)
* Manage you db in an agile way with [fluent migrator](https://github.com/schambers/fluentmigrator) 
* For Mysql don't forget to include the [mysql-connector-net-6.4.3](http://dev.mysql.com/downloads/connector/net/).

## Just in Case

Off chance you have compile error related to "WebApplication.targets", look at [my solution on this stack overflow](http://stackoverflow.com/questions/10575509/webapplication-targets-missing-when-building-a-mvc4-project-in-monodevelop-on-os)

Beesbot.com ran on linux, nginx and mysql... before I moved it to jekyll.

By Don Najd