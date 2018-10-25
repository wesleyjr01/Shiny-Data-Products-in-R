library(shiny)

shinyUI(fluidPage(
    titlePanel("Data science FTW!"),
    sidebarLayout(
        sidebarPanel(
            h3("Sidebar")
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            h2("Hey, Main Panel Text")
        )
    )
))