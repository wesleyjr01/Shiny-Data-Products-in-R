
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("HTML Tags"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        h1("H1 Text"),
        h2("H2 Text"),
        h3("H3 Text"),
        h4("H4 Text"),
        em("Emphasized Text") ,
        strong("Strong Text")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       h3("Main Panel Text"),
       code("Some Code!")
    )
  )
))
