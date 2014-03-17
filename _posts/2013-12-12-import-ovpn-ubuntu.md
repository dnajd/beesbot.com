---
layout: post
title:  "Import ovpn File on Ubuntu"
date:   2013-12-12
categories: ubuntu openssl ovpn
summary: The new network manager doesn't include openvpn and even after installing that it doesn't include an option to import your ovpn file. Here are the straight forward steps to getting set up.
permalink: import-ovpn-file-on-ubuntu/
---
The new ubuntu network manager doesn't include openvpn and even after installing that it doesn't include an option to import your ovpn file. Here are the straight forward steps to getting set up.

## Install these packages

{% highlight bash %}
sudo apt-get install openvpn network-manager-openvpn network-manager-openvpn-gnome network-manager-vpnc
{% endhighlight %}

## Run this command in a terminal to load the old interface

nm-connection-editor

{% highlight bash %}
Then select vpn -> select import -> pick .ovpn file
{% endhighlight %}

## Oh No: Vpn is blocking regular internet
By default this will block non-vpn networks (e.g. the world wide web); There's an option under "IPv4 Settings" - click the "Routes" button and then check the box next to "Use this connection only for resources on its network" and that will get you back online with the rest of the world.

By Don Najd