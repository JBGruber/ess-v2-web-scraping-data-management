# 2V Introduction to Web Scraping and Data Management for Social Scientists
[Dr Johannes B. Gruber](https://www.johannesbgruber.eu/)

- [Schedule](#schedule)
- [Required software](#required-software)

This is the course material for the Essex Summer School in Social Science Data Analysis course [2V Introduction to Web Scraping and Data Management for Social Scientists](https://essexsummerschool.com/summer-school-facts/courses/ess-2024-course-list/2v-introduction-to-web-scraping-and-data-management-for-social-scientists/), Monday 22 July-–Friday 2 August 2024.

# Schedule

| time   | Session                                  |
|--------|------------------------------------------|
| Day 1  | Introduction                             |
| Day 2  | Data Structures and Wrangling            |
| Day 3  | Working with Files                       |
| Day 4  | Linking and joining data & SQL           |
| Day 5  | Scaling, Reporting and Database Software |
| Day 6  | Introduction to the Web                  |
| Day 7  | Static Web Pages                         |
| Day 8  | Application Programming Interface (APIs) |
| Day 9  | Interactive Web Pages                    |
| Day 10 | Building a Reproducible Research Project |

# Required software

You should have several software applications installed before the start of the course:

- [R](https://cran.r-project.org/)
- An IDE, preferably [RStudio Desktop](https://posit.co/download/rstudio-desktop/), but you can also use [VSCodium](https://vscodium.com/) or [VSCodium](https://code.visualstudio.com/download) or [Positron](https://github.com/posit-dev/positron)
- [Quarto](https://quarto.org/docs/get-started/)

The course uses the base pipe character (`|>`) which is only available in `R` version 4.1.0+.
If you still use an older version of `R`, it is recommended that you update it.
Since the newer version is not compatible with old installations of `R`, you will have to install all your old packages again.
You can use a small function for this, which guides you through retrieving your old packages, from this [Github gist](https://gist.github.com/JBGruber/28c79af6d5f9015370feef31da2cb1da):

``` r
source("https://gist.githubusercontent.com/JBGruber/28c79af6d5f9015370feef31da2cb1da/raw/8165f560fc53647e3456ba661fc65d0244ac437c/get_old_packages.R")
get_old_packages()
```

After cloning this repository to your computer, you can install all required R packages with the code below.
But you can do this after the first day (when we discuss how you work with GitHub):

``` r
if (!requireNamespace("rlang", quietly = TRUE)) install.packages("rlang", dependencies = TRUE)
rlang::check_installed("attachment")
rlang::check_installed("remotes")
# install some experimental packages
if (!rlang::is_installed("paperboy")) remotes::install_github("JBGruber/paperboy")
if (!rlang::is_installed("playwrightr")) remotes::install_github("JBGruber/playwrightr")
if (!rlang::is_installed("amcat4r")) remotes::install_github("ccs-amsterdam/amcat4r")
rlang::check_installed(attachment::att_from_qmds(path = ".", recursive = TRUE))
```
