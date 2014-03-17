---
layout: post
title:  "Ruby for Monitoring & Testing"
date:   2013-05-30
categories: ubuntu tmux
summary: Wither you're developing in Ruby, PHP, .NET or a javascript RIA, you will gain benefit by automating monitoring, integration tests & load tests. In my recently professional experiences I have found Ruby to be a fantastic technology to use to accomplish this initiative quickly and easily.
permalink: ruby-for-monitoring-and-testing/
---
<span style="float:right; margin-bottom:50px;">
![Ruby Language]({{ site.url }}/images/blog/ruby-best-friend.gif)
</span>
Wither you're developing in PHP, .NET or a javascript RIA, you will gain benefit by having automated monitoring, integration tests & load tests. 

In my recently professional experiences I have found Ruby to be a fantastic technology to use to accomplish this initiative quickly and easily. 

Ruby is [easy to learn](http://tryruby.org/) and comes with a ton of free gems to make monitoring and testing easy. I recently put together a [ruby_tester](https://github.com/dnajd/ruby_tester) project on github for friends to fork to kick-off automation efforts.

Once pulled down the ruby_tester project makes it easy to launch an interactive prompt and test drive a browser with Ruby and Selenium. There are examples that structure tests with [RSpec](http://rspec.info/) and do things like integration test a site with Selenium or call a REST services to monitor up-time and assert data integrity. 

As a bonus I included a logging library and sample config file that I have used to push data directly to [splunkstorm](https://www.splunkstorm.com/). At my previous job, with the Splunk storm 1GB free account, I have setup dashboards to visualize up-time and response-time for web services.

I find this tool-set much easier and faster to use than the one that come with other technology stacks. First hand I have seen .NET and PHP developers pick up the Ruby language in literally a few days and start using it. 

So go ahead... [learn ruby](http://tryruby.org/), clone the [ruby_tester](https://github.com/dnajd/ruby_tester)r and give it a try.

By Don Najd