library(shiny)
library(ggplot2)
library(mlbench)
library(rCharts)
data(BostonHousing2)
towns <- sort(as.character(unique(BostonHousing2$town)))

shinyUI(navbarPage("BostonState",
    tabPanel("Predict",
             fluidPage(
                 h4("Welcome to the Boston home prices page!"),
                 p("With this application, you can check what is the predicted price
                    of the houses in Boston suburbs based on your data input"),
                 fluidRow(
                    column(3,
                        wellPanel(
                             selectInput('town', "Town name:", choices=towns),
                             hr(),
                             numericInput('rooms', 'Number of rooms', 1, min = 1, max = 50, step = 1),
                             numericInput('age', 'Years of the house', 0, min = 0, max = 150, step = 1),
                             actionButton('submitBut', 'Submit')  
                         ),
                        hr(),
                        h4("Houses in town:"),
                        verbatimTextOutput("numHouses")
                      ),
                      column(4, offset = 1,
                           h4('Estimated price for your preferences:'),
                           verbatimTextOutput('prediction'),
                           h4('Price summary in town:'),
                           verbatimTextOutput('priceSum'),
                           tags$style('.leaflet {width: 200px;}'),
                           showOutput('houseMap', 'leaflet')
                      )
                    )
                 )
            ),
           tabPanel('DataSet Info',
                    p('summary')
           )
))