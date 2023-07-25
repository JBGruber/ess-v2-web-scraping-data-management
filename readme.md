# 2V Introduction to Web Scraping and Data Management for Social Scientists
[Dr Marius Sältzer](https://msaeltzer.com/) & [Dr Johannes B. Gruber](https://www.johannesbgruber.eu/)

This is the course material for the Essex Summer School in Social Science Data Analysis course [2V Introduction to Web Scraping and Data Management for Social Scientists](https://essexsummerschool.com/summer-school-facts/courses/ess-2023-course-list/2v-introduction-to-web-scraping-and-data-management-for-social-scientists/).

# Schedule

| time   | Session                                  |
|--------|------------------------------------------|
| Day 1  | Introduction                             |
| Day 2  | Introduction to the Web                  |
| Day 3  | Scraping Static Web Pages                |
| Day 4  | Application Programming Interface (APIs) |
| Day 5  | Scraping Interactive Web Pages           |
| Day 6  | Basic SQL                                |
| Day 7  | Importing Data                           |
| Day 8  | Linking and joining data                 |
| Day 9  | Scaling and Reporting                    |
| Day 10 | Building a Reproducible Research Project |

# Course Project

We collect and integrate a number of data sources for a common project: A database of Political Science Conferences.

Homework: Scrape, Clean and Manage one part of the course project (different parts of this are spread through the days).

# Your Own Research Project

Additionally, we want to provide you with the tools to build your own research pipeline.
In the last session, we apply what we have learned to your own research agenda.
To do this, we want to know what you do.
Please prepare an abstract of your research question and planned data collection effort until the end of day 2, so we can build a research pipeline together!

# Required software

You should have several software applications installed before the start of the course:

- [R](https://cran.r-project.org/)
- [RStudio Desktop](https://posit.co/download/rstudio-desktop/) or [VSCodium](https://vscodium.com/) or [VSCodium](https://code.visualstudio.com/download)
- [Quarto](https://quarto.org/docs/get-started/)

The course uses the base pipe character (`|>`) which is only available in `R` version 4.1.0+.
If you still use an older version of `R`, we recommend that you update it.
Since the newer version is not compatible with old installations of `R`, you will have to install all your old packages again.
You can use a small function for this, which guides you through retrieving your old packages, from this [Github gist](https://gist.github.com/JBGruber/28c79af6d5f9015370feef31da2cb1da):

``` r
source("https://gist.githubusercontent.com/JBGruber/28c79af6d5f9015370feef31da2cb1da/raw/8165f560fc53647e3456ba661fc65d0244ac437c/get_old_packages.R")
get_old_packages()
```

After cloning this repository to your computer, you can install all required R packages with the code below. But you can do this after the first day (when we discuss how you work with GitHub):

``` r
if (!requireNamespace("rlang", quietly = TRUE)) install.packages("rlang", dependencies = TRUE)
rlang::check_installed("attachment")
if (!rlang::is_installed("playwrightr")) remotes::install_github("benjaminguinaudeau/playwrightr")
if (!rlang::is_installed("paperboy")) remotes::install_github("JBGruber/paperboy")
rlang::check_installed(attachment::att_from_qmds(path = ".", recursive = TRUE))
```

# Course Plan

## Day 1 Introduction

In this session, you learn how to use the tools of the hunt.

## Day 2 Introduction to the Web

In this session, we learn how to scout data in the wild. For this, we need to understand the rules of the outdoors.

Your task: Hand in your research abstract

## Day 3 Static Web Pages

In this session, we trap some docile data that wants to be found.

Your task: Find a conference that uses a static website and scrape the data as we have done in class (note: if you find non-static pages, also note them, we can have a look at them later)

## Day 4 Application Programming Interface (APIs)

In this session, we learn how to obtain data from someone else.

Your task: Find and parse information about the authors you found on the conference website youscraped before

## Day 5 Interactive Web Pages

In this session, we learn how to hunt down wild data.

Your task: Find a conference that uses a dynamic website and scrape the data as we have done in class

## Day 6 Basic Data Structures & SQL

In this session, we learn the basics of relational databases.

## Day 7 Importing Data

In this session, we learn to tame data.

Your task: Turn your webpage into data.

## Day 8 Linking and joining data

In this session, we learn how to mate and crossbreed data.

Your task: Link your data to our database.

## Day 9 Scaling and Reporting

In this session, we learn how to bring data to the data fair.

## Day 10 Building a reproducible Research Project

In this session, we learn how to promote our hunting strategies to the public.
