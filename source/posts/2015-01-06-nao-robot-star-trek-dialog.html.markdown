---
layout: post
title:  "Nao Robot Tells Encounter at Farpoint"
date:   2015-01-06
categories: rails scaffod model modules
summary: Experimenting with Nao Robot's new dialog engine, wikipedia and star trek
permalink: nao-robot-wikipedia-star-trek/
---

I spent a bit of time exploring the Nao Robot's new [dialog](http://doc.aldebaran.com/2-1/getting_started/helloworld_choregraphe_dialog.html) capabilities.  Once I knew my way around I converted a wikipedia article on the Star Trek episode [Encounter at Farpoint](http://en.wikipedia.org/wiki/Encounter_at_Farpoint) into a sort of choose your own adventure.

It only took a few minutes and my son enjoyed hearing the story from Nao and responding to inquiries to affect the story.

```
topic: ~startrek () language: enu

concept: (attack) [phasers torpedoes attack fight kill hit punch fire kick zap] 
concept: (explore) [talk ask question inquire explore search find study why] 
concept: (retreat) [run escape warp beam leave evacuate]

u: ("begin farpoint") %chap1 It is the year 23 64 and you are the captain of Starfleet's USS Enterprise NCC-1 7 0 1 D and you are assigned to travel to Deneb 4. Shall we set course? 
    u1: ("yes") Course is set, engaging at warp 5. ^goto(chap2) 
    u1: ("no") Starfeet warns you that if you do not perform your mission you will lose your ship. ^goto(chap2)

u: ("chapter 2") %chap2 Your mission is to open relations with the simple Bandi people who have tapped a immense energy source and used it to construct Farpoint Station. An omnipotent being appears and identifies himself as the Q. He demands you head home. 
    u1: (~attack) your first officer draws his phaser and the Q freezes him. ^goto(chap3) 
    u1: (~explore) you ask Q what he wants? ^goto(chap3) 
    u1: (~retreat) you try to outrun the Q at warp 9.5 but it does not work ^goto(chap3)

u: ("chapter 3") %chap3 The Q warns you that your mission is destined to fail and then leaves. The Enterprise arrives at Deneb 4 and the crew is suspicious of how certain items they desire appear out of nowhere.
 	u1: (~attack) attacking a nonviolent race is against the prime directive. ^goto(chap4) 
    u1: (~explore) ^goto(chap4) 
    u1: (~retreat) You are about to beam of the planet when ^goto(chap4)

u: ("chapter 4") %chap4 Deanna Troi senses a being with powerful yet despairing emotions nearby but Zorn is unable to offer an explanation. 
    u1: (~attack) attacking a nonviolent race is against the prime directive. ^goto(chap5) 
    u1: (~explore) As the Enterprise crew continues its explorations, when ^goto(chap5) 
    u1: (~retreat) You you beam off the planet ^goto(chap4)

u: ("chapter 5") %chap5 a large unknown alien craft enters orbit and begins to fire upon an older Bandi settlement. you order the crew to fire phasers at the craft, but the Q appears to remind you of humanity's violent tendencies.
    u1: (~explore) You ^goto(chap6) 
    u1: (~attack) You consider attacking anyway, but decide instead to ^goto(chap6) 
    u1: (~retreat) You consider firing up the warp drives and leaving this sad scene, but your star fleet training reminds you that you must complete your mission. So you ^goto(chap6)

u: ("chapter 6") %chap6 order an away team to check out the alien craft. The away team discovers the craft has passages similar to those under Farpoint. Their actions cause the alien craft to transform into a jellyfish-like space creature. It occurs to you that Zorn exploited this creatures ability to synthesize matter and used it to create Farpoint Station. 
    u1: (~attack) ^goto(chap7) 
    u1: (~explore) You consider exploring the situtation deeper but then ^goto(chap7) 
    u1: (~retreat) You consider making a run for it but instead ^goto(chap7) 

u: ("chapter 7") %chap7 You order the Enterprise to fire a vivifying energy beam onto Farpoint Station after it is evacuated. The beam allows the land-bound creature to transform back into its jellyfish-like form, and it flies into orbit to join its fellow being. As the crew watches the reunion of the alien creatures, Q reluctantly tells you that they have succeeded in their test, but hints that he will be back
```





