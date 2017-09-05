#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
        # Application title
        titlePanel("Word Prediction Application"),
        
        br(),
        br(),
        # Text Box for User input 
        sidebarLayout(
                sidebarPanel(
                        textInput("text", 
                                           label = h3("Enter your text here:"),
                                           value = ),
                                 em("English words only"),
                        br(),
                        br(),
                        em("Thank you for trying the app!")
                        
                              ),
                mainPanel(
                        #supress red error message on app screen when no text is entered
                        tags$style(type="text/css",
                                   ".shiny-output-error { visibility: hidden; }",
                                   ".shiny-output-error:before { visibility: hidden; }"),

                        br(),
                                            h3("Predicted next word:"),
                                            h2(textOutput("Prediction")),
                        br(),
                        br(),
                        br(),
                
                # add a web link to the slide presentation
                tags$div(class = "submit",
                         tags$a(href = "https://www.google.com/", 
                                "Information describing the data sources, methods, and the algorithm used to create this app can be found here")
                )
                         ))
                )) 