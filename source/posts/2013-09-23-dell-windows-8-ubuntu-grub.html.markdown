---
layout: post
title:  "Dell, Windows 8, Ubuntu & Grub Challenges"
date:   2013-09-23
categories: dell windows 8 ubuntu grub
summary: Windows is "taking over" the boot process, you can fix the problem by using the Windows bcdedit command and by disabling secure boot
permalink: dell-windows-8-ubuntu-grub-challenges/
---

## 1. Boot Windows.

Launch a Command Shell prompt with Administrator privileges. (You do this by right-clicking the shell icon and selecting the option to "Run as Administrator.") Type the following to register GRUB as the desired default boot program. 

{% highlight bash %}
bcdedit /set {bootmgr} path \EFI\ubuntu\grubx64.efi 
{% endhighlight %}

## 2. Disable secure boot

Then [disable secure boot](http://www.maketecheasier.com/disable-secure-boot-in-windows-8). I know it looks crazy, but it's doable and gets you to dual boot windows 8 / ubuntu heaven.

## 3. Reboot and Boot Option Menu

You don't see grub by default when you reboot. So you have to reboot, hit f9 (or whatever) to edit the boot option menu, select ubuntu and then you'll see grub / be able to select ubuntu.

I'm still working on fixing it so you don't have to hit f9. to be continued...

By Don Najd