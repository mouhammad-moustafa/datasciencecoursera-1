library(shiny)
library(ggplot2)
library(mlbench)
library(rCharts)
library(dplyr)

data(BostonHousing2)
modFit <- lm(cmedv ~ age + rm + crim, data = BostonHousing2)

housePrice <- function(crm, hage, rooms) {
    dt <- data.frame(crim = crm, age = hage, rm = rooms)
    predict(modFit, newdata = dt ) * 1000
}

shinyServer(
    function(input, output) {
        output$prediction <- renderText({ 
            if (input$submitBut == 0) { "Please, select a town" }
            else {
                input$submitBut
                isolate(housePrice(input$crm, input$age, input$rooms))
            }
        })
        #reactive code returns a function not a df
        town_filter <- reactive({
            filter(BostonHousing2, town == input$town)
        })
        output$numHouses <- renderText({
            if (input$submitBut == 0) { }
            else{
                input$submitBut
                isolate(nrow(town_filter()))
            }
        })
        output$priceSum <- renderPrint({
            if (input$submitBut == 0) { }
            else{
                input$submitBut
                isolate(summary(town_filter()$medv) * 1000)
            }
        })
        output$houseMap <- renderMap({
            map3 <- Leaflet$new()
            map3$setView(c(42.3, -71), zoom = 9)
            if (input$submitBut != 0) {
                if (nrow(town_filter()) > 0) {
                    map3$setView(c(town_filter()$lat[1], town_filter()$lon[1]), zoom = 12)
                    for (i in 1:nrow(town_filter())){
                        map3$marker(c(town_filter()$lat[i], town_filter()$lon[i]),
                                    bindPopup = paste('Price: <br>', 
                                                      town_filter()$medv[i]*1000, '$',sep=""))
                    }
                }
            }
            map3
        })
    }
)