---
layout: post
title:  "RBEnv, Ubuntu and Bundler"
date:   2013-02-10
categories: ubuntu rbenv ruby bundler
summary: A howto for setting up ubuntu with rbenv and more; for ruby on rails development.
permalink: rbenv-ubuntu-bundler/
---

A how to for setting up ubuntu for ruby on rails development

You want to checkout rbenv and the plugin ruby-build:

{% highlight bash %}
cd ~/
git clone git://github.com/sstephenson/rbenv.git .rbenv
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
{% endhighlight %}

Then add it to your path so it actually runs ruby versions installed by rbenv

{% highlight bash %}
echo 'export PATH="$PATH:$HOME/.rbenv/bin"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL
{% endhighlight %}

And the reason for the blog post... avoid a host of issues includes the "LoadError cannot load such file -- zlib" error, do this step before installing ruby. I spiced it up with postgresql and imagemagick; if you plan on using heroku and dealing with images, you'll want those too.

{% highlight bash %}
sudo apt-get install build-essential libreadline-dev libssl-dev zlib1g-dev libsqlite3-dev nodejs libxslt-dev libxml2-dev libpq-dev postgresql imagemagick
{% endhighlight %}

Then use rbenv to install a version of ruby and set it as global

{% highlight bash %}
rbenv install 1.9.3-p484
rbenv global 1.9.3-p484
{% endhighlight %}

Now this should show you the ruby version

{% highlight bash %}
ruby -v
{% endhighlight %}

The step other howto's forget; you want to develop in rails right? Then you'll want to install rails and bundler in the global gems

{% highlight bash %}
gem install rails --version "=3.2.13"
rbenv rehash
gem install bundler
rbenv rehash
{% endhighlight %}


In a project directory, you can set the version of ruby with this command

{% highlight bash %}
cd ~/dev/myRailProject
rbenv local 1.9.3-p484
{% endhighlight %}


## Alias Goodness

I've been really enjoying these commands to shortcut using bundler exec before everything add these to your ~/.bashrc

{% highlight bash %}
alias b="bundle"
alias bi="b install --path vendor"
alias bil="bi --local"
alias bu="b update"
alias be="b exec"
alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"
alias ber="be rspec"
alias berp="be rake db:test:prepare && ber"
{% endhighlight %}


## A Note about Bundler
To manage gems or run rake.. use bundler
cd ~/dev/myRailProject

{% highlight bash %}
bundle install --path vendor
bundle exec rake db:migrate
{% endhighlight %}

Resources:
[rbenv](https://github.com/sstephenson/rbenv)
[ruby-build](https://github.com/sstephenson/ruby-build)
[concerning zlib error](https://github.com/sstephenson/ruby-build/wiki)
[rbenv and bundler; a good write up](http://ryan.mcgeary.org/2011/02/09/vendor-everything-still-applies/)

By Don Najd