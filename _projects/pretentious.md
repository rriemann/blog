---
layout:       project
date:         06 Aug 2017
title:        Pretentious
caption:      A pretentious two-column Jekyll theme.
description:  >
  A pretentious two-column [Jekyll](http://jekyllrb.com/) theme,
  stolen by [@qwtel](https://twitter.com/qwtel)
  from [Hyde](http://hyde.getpoole.com). You could say it was..
  [hydejacked](http://media3.giphy.com/media/makedRIckZBW8/giphy.gif).
image:        /assets/img/projects/pretentious.jpg
screenshot:
  src:        /assets/img/projects/pretentious.jpg
  srcset:
    1920w:    /assets/img/projects/pretentious.jpg
    960w:     /assets/img/projects/pretentious@0,5x.jpg
    480w:     /assets/img/projects/pretentious@0,25x.jpg
links:
  - title:    Demo
    url:      https://qwtel.com/hydejack-pretentious/
featured:     true
accent_color: '#a85641'
accent_image: /assets/img/pretentious-bg.jpg
---

![Typeface](../assets/img/pretentious-1.jpg){:.lead}

## Usage
First, [download the modified icon font](https://qwtel.com/hydejack/assets/icomoon-pretentious.zip){:download=''},
unzip it, and replace the `icomoon` folder in `assets` with the new version.

You also need to make the following changes to following files:

### `_config.yml`

~~~yml
google_fonts:          Playfair+Display+SC:700|PT+Serif:400,400i,700,700i
font:                  "'PT Serif', Georgia, serif"
font_heading:          "'Playfair Display SC', Georgia, serif"

accent_image:          /assets/img/sidebar-bg.jpg
accent_color:          '#a85641'
~~~

### `my-inline.scss`

~~~css
a {
  border-bottom: 0!important;
}

code {
  background-color: transparent!important;
  border: 1px solid $border-color;
}

.message, pre, .katex-display, div.MathJax_Preview {
  border: 3px double $border-color;

  code { border: none; }
}

.project-card, .pagination-item > * {
  border: 3px double $border-color!important;
}

.project-card, .pagination-item > *, .project-card-img,  {
  border-radius: 0!important;
}

ul {
  list-style-type: circle;
}
~~~

### `my-style.scss`

~~~css
@media screen {
  a:not(.no-hover)::after, a:not(.no-hover)::before {
    font-family: 'icomoon';
    font-weight: normal;
    font-style: normal;
    width: 0;
    height: 0;
    opacity: 0;
    pointer-events: none;
    position: absolute;
    will-change: transform, opacity;
    transition: transform 100ms, opacity 100ms;
  }

  .content {
    a:not(.no-hover)::after, a:not(.no-hover)::before {
      text-shadow: 0 0 .125em #fff, 0 0 .25em #fff, 0 0 .5em #fff;
    }
  }

  a:not(.no-hover)::before {
    content: "\ab";
    transform: scale(1.33) translate(-0.4em, -0.15em);
  }

  a:not(.no-hover)::after {
    content: "\bb";
    transform: scale(1.33) translate(-0.05em, -0.15em);
  }

  a:not(.no-hover):hover {
    &::before, &::after {
      opacity: 1;
    }

    &::before {
      transform: scale(1.33) translate(-0.65em, -0.15em);
    }

    &::after {
      transform: scale(1.33) translate(0.2em, -0.15em);
    }
  }
}

a.sidebar-nav-item::before, a.sidebar-nav-item::after {
  position: absolute;
  right: auto;
  top: auto;
}

.pagination-item {
  &:first-child > * {
    margin-bottom: -3px;
  }
}

@media (min-width: 23.5em) {
  .pagination-item {
    &:last-child > * {
      margin-left: -3px;
    }
  }
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
