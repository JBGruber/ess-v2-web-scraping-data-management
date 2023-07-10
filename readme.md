# 2V Introduction to Web Scraping and Data Management for Social
Scientists
Dr Marius Sältzer & Dr Johannes B. Gruber

This is the course material for the Essex Summer School in Social
Science Data Analysis course [2V Introduction to Web Scraping and Data
Management for Social
Scientists](https://essexsummerschool.com/summer-school-facts/courses/ess-2023-course-list/2v-introduction-to-web-scraping-and-data-management-for-social-scientists/).

# Schedule

| time   | Session                                  |
|--------|------------------------------------------|
| Day 1  | Introduction to computing                |
| Day 2  | Introduction to the Web                  |
| Day 3  | static web pages                         |
| Day 4  | interactive web pages                    |
| Day 5  | application programming interface (APIs) |
| Day 6  | Basic SQL                                |
| Day 7  | Importing Data                           |
| Day 8  | Linking and joining data                 |
| Day 9  | Scaling and Reporting                    |
| Day 10 | Building a reproducable Research project |

# Course Project

We collect and integrate a number of data sources for a common project: A database of Political Science Conferences.

Homework: Scrape, Clean and Manage one part of the course project

# Your Own Research Project

Additionally, we want to provide you with the tools to build your own research pipeline. In the last session, we apply what we have learned
to your own research agenda. To do this, we want to know what you do. Please prepare an abstract of your research question and planned data
collection effort, so we can build a research pipeline together.

# Required software

You should have several software applications installed before the start
of the course:

- [R](https://cran.r-project.org/)
- [RStudio Desktop](https://posit.co/download/rstudio-desktop/) or
  [VSCodium](https://vscodium.com/) or
  [VSCodium](https://code.visualstudio.com/download)
- [Quarto](https://quarto.org/docs/get-started/)
- [Docker Desktop](https://docs.docker.com/get-docker/) or the [Docker
  Engine](https://docs.docker.com/engine/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)

You do not need to know what all of these do and we have limited time
available to help you get them running, but ideally they all work
beforehand.

Most R packages install quickly, but you can get ahead and run this code
in a new R session to find and install all required packages:

``` r
if (!requireNamespace("rlang", quietly = TRUE)) install.packages("rlang", dependencies = TRUE)
rlang::check_installed("attachment")
rlang::check_installed(attachment::att_from_qmds(path = ".", recursive = TRUE))
```


# Course Plan

## Day 1    Introduction to computing    

In this session, you learn how to use the tools of the hunt.

Your task: Hand in your research abstract 

## Day 2    Introduction to the Web                   

In this session, we learn how to scout data in the wild. 


## Day 3    Static Web Pages                         

In this session, we trap some docile data that wants to be found. 


## Day 4    Interactive Web Pages                     

In this session, we learn how to hunt down wild data. 


Your task: Choose your webpage. Apply your knowledge 


## Day 5    Application Programming Interface (APIs)  

In this session, we learn how to get caged data. 

## Day 6    Basic Data Structures & SQL                                 

In this session, we learn the basics of relational databases.

## Day 7    Importing Data                           

In this session, we learn to tame data.

Your task: Turn your webpage into data.

## Day 8    Linking and joining data                   

In this session, we learn how to mate and crossbreed data.

Your task: Link your data to our database

## Day 9    Scaling and Reporting                     

In this session, we learn how to bring data to the data fair.

## Day 10   Building a reproducible Research Project  
