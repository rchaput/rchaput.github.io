# RChaput's Personal Website
> Author: rchaput <rchaput.pro@gmail.com>

## Description

This repository contains the source code for my personal-professional website, 
using [Hugo][hugo] to generate static HTML files, in combination with 
the [Wowchemy][wowchemy] (formerly Academic) theme.

## How to

To locally view the website (dev version), use the `./view.sh` script.

To build the website into a set of static files, use `./build.sh`.

To update Wowchemy, change the version number (tag) in `go.mod`, and then
download the new modules with `hugo mod get -u`. If something does not work,
`hugo mod clean` can be used to clear the cache.

Remember to read and apply the "Breaking changes" described in the
[release](https://github.com/wowchemy/wowchemy-hugo-themes/releases).

The `./update_wowchemy.sh` script can be used only to update to the latest
commit (development version).

## License

The content of the website itself is licensed under the 
[Creative Commons Attribution 4.0 License][cc-by], and the underlying
source code used to produce that website is licensed under the 
[MIT License][mit].

The [Wowchemy][wowchemy] theme is released under the MIT License, copyright
[George Cushen][gcushen].

[hugo]: https://github.com/gohugoio/hugo
[wowchemy]: https://wowchemy.com/
[gcushen]: https://georgecushen.com/
[cc-by]: https://creativecommons.org/licenses/by/4.0/
[mit]: ./LICENSE
