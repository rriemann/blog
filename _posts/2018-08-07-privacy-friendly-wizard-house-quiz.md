---
layout: "post"
title: "Privacy-friendly Wizard House Quiz"
date: "2018-08-07 20:23"
published: true
categories: [digitalisation]
tags:
  - data-protection
keywords:
  - GDPR
  - data protection
  - wizard house quiz
  - quiz
hide_description: true
description: |
  You also do not want to read the lengthy privacy policy of www.pottermore.com and create an account, just to know your Wizard House Quiz? Here you have a privacy-friendly alternative.
---

You also do not want to read the lengthy privacy policy <https://www.pottermore.com/about/privacy> and create an account, just to know your Wizard House Quiz? Here you have a privacy-friendly alternative.

<!--more-->

<script src="https://cdn.jsdelivr.net/npm/vue"></script>

## Find your Wizard House

*Click the button at your favourite time to learn your Wizard house!*

{% raw %}

<div id="app">
  <form style="border: 1px solid black; padding: 5px">
    <div class="form-group row">
      <label for="staticEmail" class="col-sm-5 col-form-label">Favourite Time:</label>
      <div class="col-sm-7">
        <button v-on:click="setHouse($event)" class="btn btn-primary btn-sm" id="staticEmail">Now!</button>
      </div>
    </div>
    <div class="form-group row">
      <label for="inputPassword" class="col-sm-5 col-form-label">Your Wizard House:</label>
      <div class="col-sm-7" id="inputPassword">
        {{ house }}
      </div>
    </div>
  </form>
</div>

<script>
  var app5 = new Vue({
  el: '#app',
  data: {
    house: '',
    houses: [
      `Slytherin`,
      `Hufflepuff`,
      `Ravenclaw`,
      `Griffondor`,
    ]
  },
  methods: {
    setHouse: function (event) {
      this.house = this.houses[Math.floor(Math.random()*this.houses.length)];
      event.preventDefault();
    }
  }
  })
</script>

{% endraw %}



**Legal Notice:** Wizard House names may be protected under some legal acts in some countries.

**Privacy Notice:** No personal data is stored or transfered.


## Automated Decision Making

The following formular is employed to determine your house:

```js
this.house = this.houses[Math.floor(Math.random()*this.houses.length)]
```

**Full Source:** [read on Github](https://github.com/rriemann/blog.riemann.cc/blob/master/_posts/2018-08-07-privacy-friendly-wizard-house-quiz.md)
