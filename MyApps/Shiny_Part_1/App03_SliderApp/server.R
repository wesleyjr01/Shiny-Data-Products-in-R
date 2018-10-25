library(shiny)

shinyServer(function(input, output) {
        output$text1 = renderText(input$slider1 + 10)
  
})
