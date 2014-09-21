library(shiny)
library(ggplot2)
library(mlbench)
library(rCharts)
data(BostonHousing2)
towns <- sort(as.character(unique(BostonHousing2$town)))

shinyUI(navbarPage("BostonRE",
    tabPanel("Predict",
             fluidPage(
                 fluidRow(
                    column(3,
                        h4("Welcome to the BostonRE!"),
                        wellPanel(
                             selectInput('town', "Town name:", choices=towns),
                             numericInput('rooms', 'Number of rooms', 5, min = 1, max = 50, step = 1),
                             numericInput('age', 'Years of the house', 1, min = 0, max = 150, step = 1),
                             sliderInput('crm', 'Crime rate by town:', 
                                         min=0, max=100, value=50),
                             actionButton('submitBut', 'Submit')  
                         ),
                        hr(),
                        h4("Houses in town:"),
                        verbatimTextOutput("numHouses"),
                        hr(),
                        p("This application builds a prediction model to estimate the house prices in the Boston area. You 
                           can obtain a price estimate by selecting the different features on the panel above and click Submit."),
                        p("The model is based on the BostonHousing2 data from the mlbench library.")
                      ),
                      column(4, offset = 1,
                           h4('Estimated price for your preferences:'),
                           verbatimTextOutput('prediction'),
                           h4('Price summary in your town search:'),
                           verbatimTextOutput('priceSum'),
                           h4('Houses location and prices in your town search:'),
                           tags$style('.leaflet {width: 200px;}'),
                           showOutput('houseMap', 'leaflet')
                      )
                    )
                 )
            )
))