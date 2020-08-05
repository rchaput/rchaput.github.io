---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "XDG-Prefs"
summary: "XDG-Prefs is an open-source tool to manage your default applications on GNU/Linux."
authors: ["admin"]
tags: ["Python3", "OpenSource", "GNU/Linux"]
categories: []
date: 2020-08-04T21:36:46+02:00

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

url_code: "https://github.com/rchaput/xdg-prefs/"
url_pdf: ""
url_slides: ""
url_video: ""

# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides: ""
---


[XDG-Prefs] is an Open-Source tool to manage your default applications on GNU/Linux, with a simple but efficient GUI.

On GNU/Linux systems, each file has a type, named the [MIME Type][mime-spec] (or Media Type), based on the 
[XDG Specifications][xdg-spec] by [Freedesktop][freedesktop]. Your system maintains a database that specifies the
default application you want to use for each MIME Type ; this database is available through the official
`xdg-mime` tool, but the command-line interface is not suited for easy management (you must remember the
exact name of the MIME Type for example).

[XDG-Prefs] offers a simple GUI that allows you to view and modify this database easily ; it
is built upon the same standard specifications, meaning that your preferences will be recognized by
all other applications (typically, when you double-click on a file in your File Explorer).

Such a tool is commonly found in Desktop Environments, such as *Gnome* or *KDE*, but not in Window Managers,
such as *i3wm*. [XDG-Prefs] is desktop-agnostic, meaning that you can use it on Gnome, KDE, or even i3.


[XDG-Prefs]: https://github.com/rchaput/xdg-prefs/
[xdg-spec]:https://www.freedesktop.org/wiki/Specifications/mime-apps-spec/
[freedesktop]:https://www.freedesktop.org/wiki/
[mime-spec]:https://www.freedesktop.org/wiki/Specifications/shared-mime-info-spec/
[apps-spec]:https://www.freedesktop.org/wiki/Specifications/desktop-entry-spec/
