library(tidyverse)
library(shiny)

weather<-read_csv("test/weather_monthsum.csv")

ui <- fluidPage(
  #Title
  titlePanel("Cotton EDA")

#Sidebar with a slider

sidebarLayout(
  sidebarPanel(
    varSelectizeInput("variable",
                      "variable:",
                      weather)
  ),
  mainPanel(
    plotOutput("Plot")
  )
)
)

server <-function(input,output){
  output$Plot <-renderPlot({
    
    
    ggplot(data = waether,
           aes(x=input$varibale)
           )+
      geom_density()
    
    
  })
}


shinyApp(ui,server)




