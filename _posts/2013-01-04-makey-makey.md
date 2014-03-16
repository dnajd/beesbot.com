---
layout: post
title:  "Makey Makey Inventors Kit"
date:   2013-01-04
categories: makey ruby
summary: Ruby script that uses the curses gem to capture commands from Makey Makey and use a case statement to tell me which fruit / vegetable I touched
permalink: makey-makey-fruit/
---

I finally got my Makey Makey inventors kit and just for fun I wired up / programmed a tomato and some grapes from my parents farm. 

![Makey Makey Vegetables]({{ site.url }}/images/blog/makey1.jpg)

I wrote a ruby script that uses the curses gem to capture commands from Makey Makey and use a case statement to tell me which fruit / vegetable I touched.

![Ruby Output]({{ site.url }}/images/blog/makey2.jpg)

Here is the script.

{% highlight ruby %}
require 'curses'

Curses.noecho # do not show typed keys
Curses.init_screen
Curses.stdscr.keypad(true) # enable arrow keys (required for pageup / down)

loop do
  case Curses.getch
  when Curses::Key::DOWN
	puts "grapes"
  when Curses::Key::UP
	puts "tomato"
  end
end
{% endhighlight %}

Melissa was amazed and said "we should plug it into the cat". We are married 7 years to the day and it's got everything to do with suggestions like that. :)