---
title: "r2dup2"
summary: "Redirecting stderr messages in R"
authors: ["rchaput"]
tags: ["r"]
categories: []
date: 2021-12-20

profile: false

external_link: ""

image:
  caption: "Using r2dup2 and its result"
  focal_point: ""
  preview_only: false

url_code: "https://github.com/rchaput/r2dup2/"
---

In `R`,  the default `utils::capture.output` function only redirects R
messages: it does not truly redirect the system streams, and thus fails with
sub-processes, such as *pandoc* when using *RMarkdown*.

**r2dup2** provides a way to truly redirect the error stream (*stderr*),
by using the `with_redirect_stderr` function:

```r
r2dup2::with_redirect_stderr(file = "error.txt", {
  system("echo >&2 This line will be printed to error.txt")
})
```

**r2dup2** is only available on GitHub, install it with the `remotes` package:

```r
install.packages("remotes")
remotes::install_github("rchaput/r2dup2")
```
