---
title: "knitrdrawio"
summary: "New engine for knitr that allows to include draw.io diagrams in R Markdown documents."
authors: ["rchaput"]
tags: ["lua", "knitr", "drawio", "rmarkdown", "reproducibility"]
categories: []
date: 2021-08-06

profile: false

external_link: ""

image:
  caption: "Using the knitrdrawio library and its result"
  focal_point: ""
  preview_only: false

url_code: "https://github.com/rchaput/knitrdrawio/"

links:
  - name: Documentation
    url: 'https://rchaput.github.io/knitrdrawio/'
    icon_pack: fas
    icon: book
---

**knitrdrawio** is a publicly-available R package that brings a new engine
to the [knitr] library, to automatically include [draw.io] diagrams in R
Markdown documents (Rmd).

Rmd documents are powerful documents that increase reproducibility in
research by integrating code chunks which are run when the document is 
processed by the [knitr] library and exported (e.g., to PDF or HTML webpages).
Typical usages of such code chunks include, for example, the plotting
of figures based on experiments data.

However, no tool was easily accessible to include diagram images,
especially those created by a third-party software, such as [draw.io].

Before **knitrdrawio**, the alternative would have been to manually export
the diagram from [draw.io] as an image (e.g., PNG, JPG, or PDF), and then
to manually include it in the R Markdown document, as one would do with
any Markdown document (`[Image name](/path/to/image.png)`).

This workflow is rather cumbersome and does not support the stakes of
reproducibility, open science and reusability.
Indeed, the export process, and its parameters, are separated from
the rest of the document. One has to remember how to export the diagrams,
from which source files, which are the correct versions, etc.
Moreover, many scientists only include the exported images in their
Version Control System (VCS), which makes it more difficult to modify
the diagram later on ("where is that source file?!").

**knitrdrawio** was built to solve this, by extending the [knitr] library
with a new chunk *engine*, which allows to seamlessly export and include
[draw.io] diagrams.

Automatically exporting and including a diagram is as simple as writing:
````
```{drawio my-super-diag1, src="diag1.drawio"}
```
````
This code chunk is replaced by the actual image, automatically exported
from the `diag1.drawio` diagram file, during the *knitting* process.

Of course, parameters can be added to control the export process:
````
```{drawio my-super-diag2, src="diag2.drawio", border=5, crop=FALSE, page.index=4}
```
````

Notice how the parameters are directly written in the document itself: 
any people trying to re-create your document (including future you!) will
export the diagram exactly as you intended.

As a bonus, **knitrdrawio** builds upon [knitr]'s caching mechanism
to avoid re-executing chunks if unnecessary. This means that, if
you chose to enable cache, the chunk will be executed only once, as long
as neither the parameters nor the diagram source file are changed.

See the [GitHub](https://github.com/rchaput/knitrdrawio) page for more
details, or start using **knitrdrawio** in your Rmd documents right away:
````
```{r setup}
install.packages("remotes")
remotes::install_github("rchaput/knitrdrawio")
library(knitrdrawio)
```
````

[knitr]: https://yihui.org/knitr/
[draw.io]: https://diagrams.net
