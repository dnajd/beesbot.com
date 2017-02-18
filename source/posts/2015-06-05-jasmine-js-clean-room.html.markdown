---
layout: post
title:  "Jasmine.js, jquery and :visibility"
date:   2015-06-05
categories: javascript jasmine jquery
summary: Jasmine.js testing :visibility with a clean room
permalink: jasmine-js-jquery-visibility
---

I was testing javascript with [jasmine.js](http://jasmine.github.io/) and the [jquery visible selector](https://api.jquery.com/visible-selector/) was giving me trouble.

```
// jquery visbile selector
var visibleElements = $('elements:visible');
```

The object I was testing gets constructed with a container for all HTML to load into.

```
describe('MyObject', function() {

  beforeEach(function() {

    fixtures = {
      container: $('<div id="container"></div>'),
    };

    obj = new MyObject({
      container: fixtures.container
    });

  });

});

```

Unfortunately this is not enough for the jquery visible selector.  The fixture.container must be in the DOM for the jquery visible selector to work.  Here is where I landed with it.

```

describe('MyObject', function() {

  beforeEach(function() {

    fixtures = {
      container: $('<div id="container"></div>')
    };

    // create a cleanroom
    var cleanroom = $('<div id="clean-room" style="width:1px;height:1px;overflow:hidden"></div>');
    $('body').append(cleanroom);

    // add container
    cleanroom.append(fixtures.container);

  });

  afterEach(function() {

    // remove cleanroom
    $('body').remove('#clean-room');

  });

```

With a clean-room div loaded into the dom, I have a safe place for html or handlebar.js templates to happen.  The jquery visibility selector works as it should and when the test is finished I simply remove the cleanroom.  

The additional styles on the cleanroom prevent anything from showing up in your in-browser test runner.

