library(shiny)
library(miniUI)
library(tidyverse)

df<-read.csv("df_sale_floripa_apartments_brognoly.csv",header=TRUE
             ,stringsAsFactors=FALSE,encoding="UTF-8")

# Select a subset of the most important features in df
df <- select(df,URL,Price_BRL,Dormitorios,Banheiros,Area_m_2,
             Vagas_Garagem,neighborhood,latitude,longitude)

#Subset a Daframe by Brushing a plot

#This is very usefull to pick Outliers in a Data Analisys
pickTrees <- function() {
    ui <- miniPage(
        gadgetTitleBar("Select Points by Dragging your Mouse"),
        miniContentPanel(
            plotOutput(outputId = "plot", height = "100%", brush = "brush")
        )
    )
    
    server <- function(input, output, session) {
        output$plot <- renderPlot({
            plot(x = df$Area_m_2, y = df$Price_BRL, main = "Imoveis!",
                 xlab = "Area[m2]", ylab = "Price R$")
        })
        # The Done button closes the app
        observeEvent(input$done, {
            stopApp(brushedPoints(df = df, brush = input$brush,
                 xvar = "Area_m_2", yvar = "Price_BRL"))
        })
    }
    runGadget(ui, server)
}

