library(plotly)

df<-read.csv("df_sale_floripa_apartments_brognoly.csv",header=TRUE
             ,stringsAsFactors=FALSE,encoding="UTF-8")

df <- df[complete.cases(df), ] #Filter NA's rows

#Histogram
plot_ly(x = df$Price_BRL, type = "histogram")

#BoxPlot
plot_ly(df, y = df$Price_BRL, color = df$neighborhood, type = "box")