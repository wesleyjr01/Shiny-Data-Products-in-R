library(tidyverse)
library(leaflet)

df <- read.csv("df_sale_floripa_apartments_brognoly.csv",
               header=TRUE ,stringsAsFactors=FALSE,
               encoding="UTF-8")  #Importing csv to DataFrame

df <- df %>%
    filter(complete.cases(df)) %>% #Filtering NA rows
    
    select(URL,Price_BRL,Dormitorios,Banheiros,
           Area_m_2,Vagas_Garagem,neighborhood,
           latitude,longitude) #Filtering key columns


prices <- paste('R$',as.character(df$Price_BRL))
URLs <- paste('<a href=','\'',as.character(df$URL),'\'>',
              as.character(prices),'</a>',sep="")

#Build color features for map markers
df$color <- "white"
df$label <- "ZZZ>X>YYY"
df$color[ (df$Price_BRL<200000) & 
              (df$Price_BRL>=0) ] <- "chartreuse" #light green

df$color[ (df$Price_BRL<400000) & 
              (df$Price_BRL>=200000) ] <- "forestgreen" #dark green

df$color[ (df$Price_BRL<800000) & 
              (df$Price_BRL>=400000) ] <- "deepskyblue" #light blue

df$color[ (df$Price_BRL<1600000) & 
              (df$Price_BRL>=800000) ] <- "mediumblue" #dark blue

df$color[ (df$Price_BRL<3200000) & 
              (df$Price_BRL>=1600000) ] <- "orange" #light red

df$color[  (df$Price_BRL>=3200000) ] <- "red" #dark red

LABEL= c("cheapest", "","","","","expansive")
LABEL_COLORS = c("chartreuse","forestgreen","deepskyblue",
                 "mediumblue","orange","red")
df %>% #Map Creation
    leaflet() %>%
    addTiles() %>%
    addCircleMarkers(lat = df$latitude, lng = df$longitude,
               popup = URLs, color = df$color) %>%
    addLegend("bottomright",colors = LABEL_COLORS,
              title = "Apartment Prices[R$]",
              labels = LABEL,
              opacity = 1) %>%
    addControl("Map Built in October 24 of 2018", position = "topleft")
               
