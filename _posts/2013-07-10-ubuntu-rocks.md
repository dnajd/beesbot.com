---
layout: post
title:  "Ubuntu Rocks"
date:   2013-07-10
categories: ubuntu
summary: Ubuntu 13 is fantastic, stable and I've truly been enjoying it. Here is a quick list of things to do after you install ubuntu.
permalink: ubuntu-rocks/
---
Ubuntu 13 is fantastic, stable and I've truly been enjoying it. Since I advocate for Ubuntu and the Unity Interface SUCKS BAD. I thought I'd write up a quick list of things to do after you install ubuntu.

Of course you can [download Ubuntu](http://www.ubuntu.com/) for free, burn it to a CD and install it side-by-side with windows. 

But once it's installed and you're logged in, open a terminal and install the superior [gnome-shell](http://www.gnome.org/) windows manager.

{% highlight bash %}
sudo apt-get install gnome-shell
{% endhighlight %}

Then logout of ubuntu, click the little foot icon and select "GNOME" as your windows manager. You are now officially free of UNITY lameness.

Ubuntu Restricted Extra's to make all rich media work well...

{% highlight bash %}
sudo apt-get install ubuntu-restricted-extras
{% endhighlight %}

VLC, the best video player in the world...

{% highlight bash %}
sudo apt-get install vlc
{% endhighlight %}

Alacarte menu editor, for those applications that don't add themselves to your menu

{% highlight bash %}
sudo apt-get install alacarte
{% endhighlight %}

You'll want to install the open-source image editing software (aka photoshop)

{% highlight bash %}
sudo apt-get install gimp
{% endhighlight %}

Another note is if you have a solid state drive, you'll want to [configure TRIM](http://www.webupd8.org/2013/01/enable-trim-on-ssd-solid-state-drives.html) to ensure the drive lasts and stays fast.

Lastly don't forget to download

* google chrome browser
* sublime text (editing code)


And you've got ubuntu stock + things it should have come with anyway.

Enjoy!


P.S. Do you have the NVIDIA Optimus? Read this: https://wiki.ubuntu.com/HardwareSupport/Machines/Laptops/Dell/XPS/15z

Don Najd