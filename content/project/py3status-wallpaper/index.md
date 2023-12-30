---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Py3status Random Wallpaper"
summary: "py3status-random-wallpaper is a module for the Py3status bar, that allows you to easily change your wallpaper on GNU/Linux."
authors: ["rchaput"]
tags: ["Python", "py3status", "Linux"]
categories: []
date: 2020-08-04T22:06:02+02:00

# Do not show author profile
profile: false

# Optional external URL for project (replaces project detail page).
external_link: ""

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Custom links (optional).
#   Uncomment and edit lines below to show custom links.
# links:
# - name: Follow
#   url: https://twitter.com
#   icon_pack: fab
#   icon: twitter

url_code: "https://github.com/rchaput/py3status-random-wallpaper/"
url_pdf: ""
url_slides: ""
url_video: ""
---


[Py3status Random Wallpaper][PRW] is a module for [Py3status] (which is itself
a replacement for the default i3status in i3bar) that allows you to change your
wallpaper. Each time the module is loaded (for example, when the i3bar is
started), it will pick a random wallpaper amongst your library. You can also
directly click on the module to change the wallpaper.

This module was made with high configurability in mind, and you can tweak
several parameters, such as:

* the folders which will be scanned for wallpapers;
* the buttons used to trigger a new change;
* the command used to set the wallpaper (by default, uses [feh]);
* an optional list of ignored files;
* and others...


[PRW]: https://github.com/rchaput/py3status-random-wallpaper/ "Pystatus-Random-Wallpaper"
[Py3status]: https://github.com/ultrabug/py3status/
[feh]: https://feh.finalrewind.org/
