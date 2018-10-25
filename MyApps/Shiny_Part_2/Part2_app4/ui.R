library(shiny)

shinyUI(fluidPage(
  titlePanel("Visualize Many Models"),
  sidebarLayout(
    sidebarPanel(
      h3("Slope"),
      textOutput(outputId = "slopeOut"),
      h3("Intercept"),
      textOutput(outputId = "intOut")
    ),
    mainPanel(
      plotOutput(outputId = "plot1", brush = brushOpts(
        id = "brush1"
      ))
    )
  )
))