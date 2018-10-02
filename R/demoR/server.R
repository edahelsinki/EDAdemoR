## Server components are defined here

require("shiny")

## The global definitions are in global.R!

## The data is in the following variables:
## data$r real matrix
## data$f list of factors
## The state that may vary is collected to current as follows:
##  current$s the current subset
##  current$w information about the current projection
##  current$v PCA eigenvalues
## In your application the current may containt something totally
## different.

shinyServer(function(input,output,session) {
  
    ## This function updates plots etc. This should be fast, i.e.,
    ##no computations.
    ## We call it immediately after observing an input event which
    ## should update plots.
  updateall <- function() {
    output$plot <<- renderPlot({plotdata(data,current)})
    output$datadescr <<- renderText({sprintf("%d of %d selected",
                                             length(current$s),dim(data$r)[1])})
  }  
  
  updateall()
  
  observeEvent(input$sel1,{
    s <- input$sel1
    xy <- data$r %*% current$w[,1:2]
    current$s <<- union(current$s,
                        which(s$xmin<=xy[,1] & xy[,1]<=s$xmax &
                              s$ymin<=xy[,2] & xy[,2]<=s$ymax))
    updateall()
  })
  
  observeEvent(input$clearselection,{
    current$s <<- c()
    updateall()
  })
  
  observeEvent(input$reverseselection,{
    current$s <<- setdiff(1:dim(data$r)[1],current$s)
    updateall()
  })
  
  observeEvent(input$recompute,{
    cat("server.R: computing PCA.\n")
    a <- dopca(if(length(current$s)>1) data$r[current$s,] else data$r)
    current$w <<- a$w
    current$v <<- a$v
    updateall()
  })
})
