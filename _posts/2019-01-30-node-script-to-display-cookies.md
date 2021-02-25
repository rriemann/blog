---
layout: "post"
title: "Node Script to Display Cookies"
date: "2019-01-30 23:04"
last_modified_at: "2019-05-24 12:34"
comments: true
tags:
  - node
  - data-protection
published: true
categories: [digitalisation]
keywords:
  - webpage cookies
  - node
  - puppeteer
---

With some advice from StackOverflow, I wrote a short node script that I placed in the file `$HOME/bin/get-cookies.js` with the executive bit set via `chmod +x $HOME/bin/get-cookies`. It relies on the [library puppeteer](https://www.npmjs.com/package/puppeteer) to control a browser instance of headless Chromium, which must be installed first via `npm i puppeteer`.

Then, you can call `get-cookies.js https://google.com` to get all installed cookies upon request of the page given as a parameter (here: `https://google.com`). Note that Puppeteer creates its own Chromium user profile which it cleans up on every run.

## Source Code of 'get-cookies.js'


~~~js
#!/usr/bin/env node

const puppeteer = require('puppeteer');

const url = process.argv[2];

(async () => {
  const browser = await puppeteer.launch({ headless: true, args: ['--disable-dev-shm-usage'] });
  try {
    const page = await browser.newPage();
    await page.goto(url, { waitUntil: 'networkidle2' });

    var cookies = await page._client.send('Network.getAllCookies');
    cookies = cookies.cookies.map( cookie => {
      cookie.expiresUTC = new Date(cookie.expires * 1000);

      return cookie;
    });

    var persistantCookies = cookies.filter(c => {
      return !c.session;
    });

    console.log({
      persistantCookies: persistantCookies,
      persistantCookiesCount: persistantCookies.length,
    });
  } catch(error) {
    console.error(error);
  } finally {
    await browser.close();
  }
})();
~~~
