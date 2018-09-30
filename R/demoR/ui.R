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
      actionButton("recompute",label="recompute projection")
    ),
    mainPanel(
      plotOutput("plot",brush=brushOpts(id="sel1"),click="plot_click")
    )
  )
))

