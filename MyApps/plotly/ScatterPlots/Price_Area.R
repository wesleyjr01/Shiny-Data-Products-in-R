library(plotly)
library(tidyverse)

df<-read.csv("df_sale_floripa_apartments_brognoly.csv",header=TRUE
             ,stringsAsFactors=FALSE,encoding="UTF-8")

df <- df[complete.cases(df), ] #Filter NA's rows

df <- select(df,URL,Price_BRL,Dormitorios,Banheiros,Area_m_2,
             Vagas_Garagem,neighborhood,latitude,longitude)

## Scatterplot Color

#You can add color to your scatterplot points according to a categorical variable
#in the data frame you use with `plot_ly()`.

#Plot 01
plot_ly(df, x = ~Area_m_2, y = ~Price_BRL, type = "scatter",
        color = ~factor(neighborhood), size = ~Area_m_2, mode = "markers")

#Plot 02
plot_ly(df, x = ~Dormitorios, y = ~Price_BRL, type = "scatter",
        color = ~factor(neighborhood), size = ~Area_m_2)

#Plot 03
plot_ly(df, x = ~Banheiros, y = ~Price_BRL, type = "scatter",
        color = ~factor(neighborhood), size = ~Area_m_2)

#Plot 04
plot_ly(df, x = ~Vagas_Garagem, y = ~Price_BRL, type = "scatter",
        color = ~factor(neighborhood), size = ~Area_m_2)

#Plot in the web plot.ly
# Save your authentication credentials
# Sys.setenv("plotly_username"="wesleyjr01")
# Sys.setenv("plotly_api_key"="HewFkTdVWhxkhtpWqVDy")
# 
# api_create(p1, filename = "Price_X_Area")