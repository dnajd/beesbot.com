---
layout: post
title:  "Jenkins & Selenium"
date:   2013-06-19
categories: jenkins ruby selenium
summary: I have in the past used Atlassian Bamboo for build automation and to run automated tests. While I love that solution, it costs money and not everyone wants to buy it. 
permalink: jenkins-ruby-selenium/
---
I have in the past used [Atlassian Bamboo](https://www.atlassian.com/software/bamboo) for build automation and to run automated tests. While I love that solution, it costs money and not everyone wants to buy it. 

Tonight I took my first dive into using the open source CI server called [Jenkins](http://jenkins-ci.org/), in combination with my [ruby_tester](https://github.com/dnajd/ruby_tester) project to launch selenium tests for my current employer.

This is not a step by step, but I've included all the things I got tripped up on. So here are my tips if you try to do this:

## Installation

[Install Jenkins](https://wiki.jenkins-ci.org/display/JENKINS/Installing+Jenkins+on+Ubuntu) on ubuntu

{% highlight bash %}
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins
{% endhighlight %}

### Setup Jenkins User

{% highlight bash %}
At this point jenkins will load up on http://localhost:8080 and run as a jenkins user; but we want to use git, rbenv, ruby and selenium. So login to your machine as the jenkins user:
sudo su jenkins -s /bin/bash
{% endhighlight %}


Remember to create an ssh key and add it where appropriate; ex. github or bitbucket

{% highlight bash %}
ssh-keygen -t rsa
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
{% endhighlight %}

Go through the steps to [install rbenv](/ubuntu/rbenv/ruby/bundler/2013/02/10/rbenv-ubuntu-bundler.html) for the jenkins user.

For [ruby_tester](https://github.com/dnajd/ruby_tester), remember to download the [correct chromedriver](http://chromedriver.storage.googleapis.com/index.html) for selenium and add it to your path in .bashrc

{% highlight bash %}
export PATH="$PATH:$HOME/Applications/chromedriver"
{% endhighlight %}

## Jenkins Job

Finally when you setup your jenkins job and try to execute a shell command, remember to include:
source /var/lib/jenkins/.bashrc 

as well as run your bundle install and bundle exec rake

{% highlight bash %}
bundle install --path vendor && bundle exec rake your_rake_task
{% endhighlight %}

If you're using the [ruby_tester](https://github.com/dnajd/ruby_tester) remember to add a 'post-build action' to 'publish j-unit test report' and set the pattern to:

{% highlight bash %}
spec/reports/*.xml
{% endhighlight %}

## Selenium Tests

You can use the Selenium Web Driver, but you're going to need to run it against a Selenium Server (very easy). Because jenkin runs under a service account and is not inside of a windowed (x-session) environment and has no access to a browser. Download the [Selenium Server Jar](http://docs.seleniumhq.org/download/) and then run the following command to start it.

{% highlight bash %}
java -jar selenium-server-standalone-2.33.0.jar [-port 4444] [-interactive] [-timeout 1800]
{% endhighlight %}

Then you simply need to launch your web driver using this syntax

{% highlight ruby %}
driver = Selenium::WebDriver.for :remote, :desired_capabilities => :chrome
{% endhighlight %}

NOTE: local host and port 4444 are assumed

## Email Notifications
I simply [used a gmail account](http://lifehacker.com/111166/how-to-use-gmail-as-your-smtp-server) to send email and put the credentials into Jenkins.

By Don Najd