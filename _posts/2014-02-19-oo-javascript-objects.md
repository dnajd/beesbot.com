---
layout: post
title:  "Object Oriented Javascript Objects"
date:   2014-02-10
categories: javascript architecture
summary: Build your javascript in an object oriented and maintainable way
permalink: object-oriented-javascript/
---


{% highlight javascript %}
////////////////////////////////
// Global Stuff
function mix(options, object) {
  for(var key in options) {
    object[key] = options[key];
  }
}

function newObject(options) {
  // Get the properties passed through options in the constructor.
  options = options || {};
  mix(options, this);
};


////////////////////////////////
// DEFINE our prototypes

// Person Factory
// dynamic options / args
// Now you can't override `printName` with some value in options.
function makePerson (options) {
  var p = newObject(options);
  p.printName = function() {
	console.print(this.firstName + ' ' + this.lastName);
  };
  return p;
}

// Person Prototype
// If options contains property `printName` it will be overriden.
function Person(options) {
	mix(options, this);  
}
Person.prototype = {
  firstName : 'Default',
  lastName : 'NameThatAllPersonObjectsWillInherit',
  printName : function() {
    console.log(this.firstName, this.lastName);
  }
};
  
var p1 = new Person({key1 : 'thing', firstName: 'Paul', lastName: 'McCartney'});
var p2 = new Person({firstName : 'John', lastName: 'Lennon'});

console.log(p1.printName(), p2.printName());

// Prototype: Car
// fixed options / arguments
function makeCar (make, year) {
  this.make = make;
  this.year = year;
  o.start = function() {
	console.print(this.make + ' says.... varrooom');
  };
  return o;
}

////////////////////////////////
// USE our prototypes

// create a car
var car = makeCar('honda', 1978);
console.log(car.start);


// create a bunch of people
var friends = {
  people: [
    makePerson({
      firstName: "Bill",
      lastName: "Gates",
      number: "(206) 555-5555",
      addresses: [
          {street1: 'One Microsoft Way',city: 'Redmond',state:'WA',zip:'98052'},
          {street1: 'One Microsoft Way',city: 'Cobb',state:'CA',zip:'95426'}
     ]
    }),
    makePerson({
      firstName: "Steve",
      lastName: "Jobs",
      number: "(408) 555-5555",
      addresses: [
          {street1: 'One Microsoft Way',city: 'Redmond',state:'WA',zip:'98052'}
     ]
    })
  ],
  doSomething: function() { console.log('hi') }
};

friends.doSomething();

// loop through peopl
for (var p in friends.people){
  
  console.log(p.printName());  // log full name
  
  for (var a in p.addresses)
  {
    console.log(a.zip);  // log zip
  }
}


//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

list(friends);
// List of friends objects

var list = function(obj) {
  for(var prop in obj) {
    console.log(prop);
  }
};

{% endhighlight %}