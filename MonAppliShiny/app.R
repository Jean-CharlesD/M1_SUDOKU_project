#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Ma première application Shiny"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            numericInput("NumVar", "Numéro de la variable :", 
                         min=1, max=4, value=1),
            sliderInput("NbCla",
                        "Nombre de classes :",
                        min = 2,
                        max = 30,
                        value=10),
            radioButtons("Coul", "Couleur de l'histogramme",
                         choices = c("Bleu clair"="lightblue", "Vert"="green","Rouge"="red"),
                         selected="green"),
        ),

        # Show a plot of the generated distribution
        mainPanel(
          verbatimTextOutput("sortie1"),
          plotOutput("sortie2")
        )
    ))

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$sortie1<-renderPrint({
    paste("La médiane vaut",median(iris[input$NumVar]))
  })

    output$sortie2 <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- iris[,input$NumVar]
        Classes<-seq(min(x),max(x), length.out=input$NbCla + 1)
        hist(x, breaks = Classes, freq=FALSE, col=input$Coul)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
