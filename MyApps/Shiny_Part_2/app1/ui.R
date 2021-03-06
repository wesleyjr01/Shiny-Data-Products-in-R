library(shiny)

shinyUI(fluidPage(
  titlePanel("Predict Horsepower from MPG"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "sliderMPG", label = "What is the MPG of the car?",
                  min = 10, max = 35, value = 20),
      checkboxInput(inputId = "showModel1", label = "Show/Hide Model 1",
                    value = TRUE),
      checkboxInput(inputId = "showModel2", label = "Show/Hide Model 2",
                    value = TRUE),
      submitButton("Submit") #Refresh app page when click
    ),
    mainPanel(
      plotOutput("plot1"),
      h3("Predicted Horsepower from Model 1:"),
      textOutput("pred1"),
      h3("Predicted Horsepower from Model 2:"),
      textOutput("pred2")
    )
  )
))