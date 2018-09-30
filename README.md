# Shiny demo for explorative data analysis

This is a small demonstration of how to use R and Shiny for explorative data analysis using a fluid HTML5 based web browser interface.

This is not supposed to be a full application, but it should contain all components that you need to make the UI and server parts working. Examples of more complete applications:

* sideR, <http://www.iki.fi/kaip/sider.html>. Published in Proc ICDE 2018 (in print). 
* tileR, <https://github.com/aheneliu/tiler>. Published in Proc ECML PKDD 2018 (in print).

For more in-depth introduction to Shiny see <https://shiny.rstudio.com/>. 

There are lots of example applications of Shiny for other purposes, I just could not find anything to do what I want.

## Quick start

There is simple script at `R/run.R`, which launches a local Shiny app, after which you should be able to point your web browser to <http://127.0.0.1:7000>. It is for one user only!

The actual logic is contained under `R/demoR`. The script reads R data frame saved using `saveRDS` from the first rds file in directory `R/demoR/data`. Reading of the data and other initializations are in `R/demoR/global.R`.

`R/demoR/ui.R`contains the UI components and `R/demoR/server.R` the server logic. The philosophy in the latter file is that by doing interactions (e.g., pressing buttons, choosing menu items, brushing plots) may change the state stored in variable `current`. In `R/demoR/server.R`, there is a `updateall` function which updates all visual presentations. This function should not do any heavy computations.

The actual data analysis functions are stored in `R/demoR/demoR.R`. Here, the idea is quite simple. The system projects the data into the first two principal components of the data, computed from the selected subset. In the plot, the system uses the levels of the first factor in the data to differentiate between the points.

It would be easy to add more interactions, more sophisticated visualizations or summarizations of the data etc. An advantage of this template is that if you know how to do your system in R Shiny (when used like this) provides a very easy way to provide a fluid HTML5 user interface for your application.

Kai Puolamäki  
30 September 2018
