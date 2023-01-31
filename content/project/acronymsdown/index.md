---
title: "acronymsdown"
summary: "Adds support for acronyms in RMarkdown documents."
authors: ["rchaput"]
tags: ["knitr", "rmarkdown", "OpenSource"]
categories: []
date: 2021-12-20

profile: false

external_link: ""

image:
  caption: "Using the acronymsdown library and its result"
  focal_point: ""
  preview_only: false

url_code: "https://github.com/rchaput/acronymsdown/"
---

**acronymsdown** is an open-source [Pandoc filter] shipped in an R package
that allows using acronyms in a [R Markdown] document (Rmd).

Rmd documents bring a simplified syntax over existing languages, such as
LaTeX or HTML; however, no easy and integrated support for acronyms was
available, as opposed to LaTeX's [glossaries] package for example.

The typical workflow to use acronyms in a Rmd document, without 
**acronymsdown**, would be to write in plain text the full name and its
acronym, such as `R Markdown (Rmd)`, the first time the acronym is used, then
only the acronym on subsequent uses, such as `Rmd`. This involves remembering
whether the acronym already appeared; if the first occurrence is changed or
moved, the document might not be correct anymore.

Instead, **acronymsdown** automates the use of acronyms, by first declaring
them, and then using a special syntax throughout the document. The underlying
filter will automatically replace each occurrence by the correct text,
depending on whether it corresponds to the first use.

Using an acronym is as simple as writing:
```md
\acr{Rmd} documents are great!
\acr{Rmd} relies on Pandoc internally.
```

Each occurrence of `\acr{KEY}` will be replaced, according to a user-configurable
style, such as `R Markdown (Rmd)` or `Rmd (R Markdown)`. In addition, a List of
Acronym can be automatically generated, based on all defined acronyms.

See the [GitHub](https://github.com/rchaput/acronymsdown) page, the 
[documentation](https://rchaput.github.io/acronymsdown/) for more details, or
start using **acronymsdown** in your Rmd documents right away:

````
```{r setup}
install.packages("remotes")
remotes::install_github("rchaput/acronymsdown")
```
````

````yaml
---
output:
  pdf_document:
    pandoc_args: !expr acronymsdown::add_filter()
acronyms:
  keys:
    - shortname: Rmd
      longname: R Markdown
---
````


[Pandoc filter]: https://pandoc.org/lua-filters.html
[R Markdown]: https://rmarkdown.rstudio.com/
[glossaries]: https://www.ctan.org/pkg/glossaries
