# RChaput's Personal Website
> Author: rchaput <rchaput.pro@gmail.com>

## Description

This repository contains the source code for my personal-professional website,
using [Hugo][https://github.com/gohugoio/hugo] to generate static HTML files,
in combination with the [Blowfish](https://blowfish.page/docs/) theme.


## How to

### Preview (Dev)

To locally view the website (dev version), use:

```shell
make dev
```

If you change the CSS (or the classes / styles in HTML directly), you must also
run the following command in another shell (this is a background-running command):

```shell
make watch-tailwind
```

(You might need to install Tailwind and Blowfish dependencies -- see below)

### Build (Deploy)

To build the website into a set of static files (e.g., for deployment), run
the following commands:

```shell
make install-blowfish-deps
make compile-tailwind
make build
```

This produces the `public/` folder that contains the whole website.

### Update Blowfish

Remember to periodically update Blowfish using the following command:

```shell
make update-blowfish
```


## Technical details

### How to add and use icons

Download a SVG file (e.g., from FontAwesome, Academicons, Devicons, ...);
place it in the `assets/icons/` folder, ideally in a sub-folder corresponding
to the icon "pack" (e.g., `fas` for Font Awesome Solid).

The icon can now be used with the Blowfish partial `{{ partial "icon" "pack/icon" }}`
where `pack` is the sub-folder (e.g., `fas`), and `icon` the SVG filename without
the extension (e.g., `book`).

This partial is internally used for each `.Params.link` item in a Page, which
means you can use it like this:

```yaml
links:
  - name: The name of the desired button (link)
    url: The desired URL
    icon: pack/icon (e.g., fas/globe)
```


## License

The content of the website itself is licensed under the
[Creative Commons Attribution 4.0 License][https://creativecommons.org/licenses/by/4.0/],
and the underlying source code used to produce that website is licensed under the
[MIT License][./LICENSE].

The [Blowfish](https://blowfish.page/docs/) theme is released under the MIT license.
