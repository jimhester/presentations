# Setup

This talk will mainly be a interactive demo, if you would like to follow along
please install the following things _before_ the meetup.

- [R and the RStudio IDE](http://happygitwithr.com/install-r-rstudio.html) - I will be using R 3.4.1 and the RStudio Preview (v1.1.350).
- [devtools](https://cran.r-project.org/package=devtools), [roxygen2](https://cran.r-project.org/package=roxygen2) and [testthat](https://cran.r-project.org/package=testthat) - With the latest versions available on CRAN.

    `install.packages(c("devtools", "roxygen2", "testthat"))`
- [usethis](https://github.com/r-lib/usethis) - This package is not yet on CRAN. It can be installed by running the following

    `devtools::install_github("r-lib/usethis")`
- Please run `update.packages(ask = FALSE, checkBuilt = TRUE)` to make sure your packages are fully updated.
