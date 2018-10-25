library(shiny)
library(miniUI)

myFirstGadget <- function(numbers1, numbers2) {
    ui <- miniPage(
        gadgetTitleBar("Multiply Two Numbers"),
        miniContentPanel(
            selectInput(inputId = "num1",label = "First Number", choices = numbers1),
            selectInput(inputId = "num2",label = "Second Number", choices = numbers2)
        )
    )
    
    server <- function(input, output, session) {
        # The Done button closes the app
        observeEvent(input$done, {
            num1 <- as.numeric(input$num1)
            num2 <- as.numeric(input$num2)
            stopApp(num1 * num2)
        })
    }
    runGadget(ui, server)
}


