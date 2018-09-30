# Shiny demo for explorative data analysis

This is a small demonstration of how to use R and Shiny for explorative data analysis using a fluid HTML5 based web browser interface.

This is not supposed to be a full application, but it should contain all components that you need to make the UI and server parts working. Examples of more complete applications:

* sideR, <http://www.iki.fi/kaip/sider.html>. Published in Proc ICDE 2018 (in press). 
* tileR, <https://github.com/aheneliu/tiler>. Published in Proc ECML PKDD 2018 (in press).

For more in-depth introduction to Shiny see <https://shiny.rstudio.com/>. 

There are lots of example applications of Shiny for other purposes, I just could not find anything to do what I want.

## Quick start

There is simple script at `R/run.R`, which launches a local Shiny app, after which you should be able to point your web browser to <http://127.0.0.1:7000>. It is for one user only!

The actual logic is contained under `R/demoR`.

Kai Puolamäki  
30 September 2018
