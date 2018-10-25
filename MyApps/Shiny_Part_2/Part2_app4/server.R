library(shiny)

df<-read.csv("df_sale_floripa_apartments_brognoly.csv",header=TRUE
             ,stringsAsFactors=FALSE,encoding="UTF-8")

shinyServer(function(input, output) {
  model <- reactive({
    brushed_data <- brushedPoints(df, input$brush1,
                            xvar = "Area_m_2", yvar = "Price_BRL")
    if(nrow(brushed_data) < 2){
      return(NULL)
    }
    lm(Price_BRL ~ Area_m_2, data = brushed_data)
  })
  
  output$slopeOut <- renderText({
    if(is.null(model())){
      "No Model Found"
    } else {
      model()[[1]][2]
    }
  })
  
  output$intOut <- renderText({
    if(is.null(model())){
      "No Model Found"
    } else {
      model()[[1]][1]
    }
  })
  
  output$plot1 <- renderPlot({
    plot(x = df$Area_m_2, y = df$Price_BRL, xlab = "Area m2",
         ylab = "Price R$", main = "Apartment Measurements",
         cex = 1.5, pch = 16, bty = "n")
    if(!is.null(model())){
      abline(model(), col = "blue", lwd = 2) #Plot a line only for brushed points
    }
  })
  
  
})