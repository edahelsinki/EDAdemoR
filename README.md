# Shiny example of explorative data analysis

This is a small demonstration of how to use R and Shiny for explorative data analysis using a fluid HTML5 based web browser interface. This system can be used as a skeleton for implementing interactions on more complex models. 

This is not supposed to be a full application, but it should contain all components that you need to make the UI and server parts working. Examples of more complete applications:

* sideR, <http://www.iki.fi/kaip/sider.html>. Published in Proc ICDE 2018 (in print). 
* tiler, <https://github.com/aheneliu/tiler>. Published in Proc ECML PKDD 2018 (in print).

For more in-depth introduction to Shiny see <https://shiny.rstudio.com/>. 

There are lots of example applications of Shiny for other purposes, I just could not find anything to do what I want, i.e., to add fluid HTML5 interaction to R with minimal extra hassle.

## Quick start

Requirements:

* A recent version of [R](https://www.r-project.org/).
* [Shiny](https://cran.r-project.org/web/packages/shiny/index.html), which can be [installed from CRAN](https://www.dummies.com/programming/r/how-to-install-and-load-cran-packages-in-r/).
* A modern web browser such as Google Chrome.

There is simple script at [`R/run.R`](https://github.com/edahelsinki/EDAdemoR/blob/master/R/run.R), which launches a local Shiny app, after which you should be able to point your web browser to <http://127.0.0.1:7000>. It is for one user only&#8212;you can test what happens if many use it simultaneously! You can either type Make in directory [`R`](https://github.com/edahelsinki/EDAdemoR/tree/master/R) or say `Rscript --vanilla run.R` in the same directory.

The idea is that you can mark a subset of points in the scatterplot by painting them by your mouse. Hitting buttons "clear current selection" removes all markings and "reverse selection" reverses the marking. "recompute PCA projection" computes PCA projection vectors using the marked subset of points only and then projects the whole data to the first two of these principal components.

The actual logic is contained under [`R/demoR`](https://github.com/edahelsinki/EDAdemoR/tree/master/R/demoR). The script reads R data frame saved using [`saveRDS`](https://www.rdocumentation.org/packages/base/versions/3.5.1/topics/readRDS) from the first rds file in directory [`R/demoR/data`](https://github.com/edahelsinki/EDAdemoR/tree/master/R/demoR/data). Reading of the data and other initializations are in [`R/demoR/global.R`](https://github.com/edahelsinki/EDAdemoR/blob/master/R/demoR/global.R).

[`R/demoR/ui.R`](https://github.com/edahelsinki/EDAdemoR/blob/master/R/demoR/ui.R) contains the UI components and [`R/demoR/server.R`](https://github.com/edahelsinki/EDAdemoR/blob/master/R/demoR/server.R) the server logic. The philosophy in the latter file is that by doing interactions (e.g., pressing buttons, choosing menu items, brushing plots) may change the state stored in variable `current`. In [`R/demoR/server.R`](https://github.com/edahelsinki/EDAdemoR/blob/master/R/demoR/server.R), there is a `updateall` function which updates all visual presentations. This function should not do any heavy computations.

The actual data analysis functions are stored in [`R/demoR/demoR.R`](https://github.com/edahelsinki/EDAdemoR/blob/master/R/demoR/demoR.R). The idea is that you can put your complex data analysis algorithms here. In this example it is quite simple: the system projects the data into the first two principal components of the data, computed from the selected subset. In the plot, the system uses the levels of the first factor in the data to differentiate between the points. Notice that you can use standard R plotting etc. routines: you do not need to know that you are actually making web graphics.

It would be easy to add more interactions, more sophisticated visualizations or summarizations of the data etc. An advantage of this template is that if you know how to do your system in R Shiny (when used like this) provides a very easy way to provide a fluid HTML5 user interface for your application.


## Default dataset 

The dataset at `R/demoR/server/bnc.rds` contains 1335 documents from the British National Corpus in bag words of representation from four genres (conversation, fiction, broadsheet newspaper, academic). See Puolamäki et al. (2017) for more information about the dataset and preprocessing used.

Kai Puolamäki, Emilia Oikarinen, Bo Kang, Jefrey Lijffijt, Tijl De Bie. Interactive Visual Data Exploration with Subjective Feedback: An Information-Theoretic Approach. 2017. [arXiv:1710.08167](https://arxiv.org/abs/1710.08167) [stat.ML]

“The British National Corpus, v. 3 (BNC XML Edition),” Distributed by Oxford University Computing Services on behalf of the BNC.

-----

Kai Puolamäki  
30 September 2018
