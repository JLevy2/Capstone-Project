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
                        
                        
                        tabsetPanel(type="tabs",
                                    tabPanel("The Prediction",
                        
                        #suppress red error message on app screen when no text is entered
                        tags$style(type="text/css",
                                   ".shiny-output-error { visibility: hidden; }",
                                   ".shiny-output-error:before { visibility: hidden; }"),

                        br(),
                                            h3("Predicted next word:"),
                                            h2(textOutput("Prediction"))
                        #br()  
                        #End first tab
                        ),
                

                                 tabPanel("About the app",
                                        # add a web link to the slide presentation
                                        br(),
                                        br(),        
                                        
                                        tags$div(class = "submit",
                                                 tags$a(href = "https://rpubs.com/jhlevy/277211", 
                                                        " A milestone report showing the code used for data download, data extraction, data cleaning, data formatting, and generation of the file used to train the prediction algorithm can be found here.")
                                        )   ,                   
                
                br(),
                br(),
                
                tags$div(class = "submit",
                         tags$a(href = "https://github.com/JLevy2/Capstone-Project/tree/master", 
                                "Click here to see the shiny ui and server files for this app as well as the slide deck presentation. The server file shows the algorithm used to generate predictions.")
                )
                
     

                #End second tab
                                 )
                                
               # end tabset Panel
                        )
                
                         ))
                )) 