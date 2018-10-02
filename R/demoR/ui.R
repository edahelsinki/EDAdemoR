## UI components are defined here

## You can define page layouts using most HTML widgets here.
## See https://shiny.rstudio.com/gallery/

require("shiny")

shinyUI(fluidPage(
  titlePanel("demoR"),
  sidebarLayout(
    sidebarPanel(
        htmlOutput("datadescr"),
        actionButton("clearselection",label="clear current selection"),
        actionButton("reverseselection",label="reverse current selection"),
        selectInput("selectpoints",
                    label="add to current selection:",
                    choices=c("none",names(data$s))),
        actionButton("recompute",label="recompute PCA projection"),
        HTML("<p>See <a href=\"https://github.com/edahelsinki/EDAdemoR\">https://github.com/edahelsinki/EDAdemoR</a> for more information.</p>")  
    ),
    mainPanel(
      plotOutput("plot",brush=brushOpts(id="sel1"),click="plot_click")
    )
  )
))

