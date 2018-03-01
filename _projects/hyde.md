---
layout:       project
date:         05 Aug 2017
title:        Hyde
caption:      Capturing the magic of the original Hyde theme.
description:  >
  Capturing the magic of the original Hyde theme, complete with Abril Fatface title font and PT Serif for regular text.
image:        /assets/img/projects/hyde.jpg
screenshot:
  src:        /assets/img/projects/hyde.jpg
  srcset:   
    1920w:    /assets/img/projects/hyde.jpg
    960w:     /assets/img/projects/hyde@0,5x.jpg
    480w:     /assets/img/projects/hyde@0,25x.jpg
links:
  - title:    Demo
    url:      https://qwtel.com/hydejack-hyde/
featured:     true
accent_color: '#268bd2'
accent_image:
  background: '#202020'
  overlay:    false
---

![Typeface](../assets/img/hyde-1.jpg){:.lead}

## Usage
To use this flavor, make the following changes to following files:

### `_config.yml`

~~~yml
google_fonts: Abril+Fatface:400|PT+Sans:400,400i,700,700i
font:         "'PT Sans', Helvetica, Arial, sans-serif"
font_heading: "'PT Sans', Helvetica, Arial, sans-serif"
accent_color: '#268bd2'
accent_image:
  background: '#202020'
  overlay:    false
~~~

### `_sass/my-inline.scss`

~~~css
.sidebar h2 {
  font-family: 'Abril Fatface', serif!important;
  font-weight: normal;
  font-size: 3rem;
}
~~~

***

## Attributions

| Work                                                   | License        | Changes
|:-------------------------------------------------------|:---------------|:-
| [IMac vector.svg][11] by [Rafael Fernandez][12]        | [CC-BY-SA-3.0] | Apple logo removed, rasterized
| [iPhone 6S Rose Gold.png][21]                          | [CC-BY-SA-3.0] | Desaturated
| [iPad Air 2.png][31] by [Justinhu12][32]               | [CC-BY-SA-4.0] | Desaturated

Screenshots can be reused under [CC-BY-SA-4.0].

[11]: https://commons.wikimedia.org/wiki/File:IMac_vector.svg
[12]: https://commons.wikimedia.org/wiki/User:TheGoldenBox
[21]: https://commons.wikimedia.org/wiki/File:IPhone_6S_Rose_Gold.png
[31]: https://commons.wikimedia.org/wiki/File:IPad_Air_2.png
[32]: https://commons.wikimedia.org/wiki/User:Justinhu12

[CC-BY-SA-4.0]: https://creativecommons.org/licenses/by-sa/4.0/
[CC-BY-SA-3.0]: https://creativecommons.org/licenses/by-sa/3.0/
