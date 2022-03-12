library(shiny)
library(shinyMatrix)


ui <- fluidPage(
  
  #Tire
  headerPanel('SUDOKU'),
  
  #Choix des options et bouton de générations des différentes grilles
  sidebarPanel(
    selectInput('level','Choix de la difficulté',c('facile','difficile')),
    selectInput('Choixgrille','Choix de la grille',c('complete','incomplete')),
    actionButton('genGrille','Génération du sudoku')
  ),
  
  #Grille
  mainPanel(
    #Panel de la grille incomplete
    conditionalPanel(condition = "input.genGrille > 0", uiOutput(outputId = "displayGrid")),
    conditionalPanel(condition = "input.Choixgrille == 'incomplete'", actionButton('submit','soumission',grille='grille'))
  )
)

server <- function(input,output){
  
  observeEvent(input$genGrille, {
    if(input$Choixgrille == "complete"){
      m = reactive({genGrilleComplete()})
      output$displayGrid <- renderUI({
        div(matrixInput(inputId = "newGrid", value = m()),)
      })
      
    }else{
      if(input$level == 'facile'){
        diff <- 1
      }else{
        diff <- 2
      }
      grille <- genGrilleIncomplete(diff)
      m = reactive({grille})
      output$displayGrid <- renderUI({
        div(matrixInput(inputId = "newGrid", value = m()),
            )
      })
    }
  })
  
  observeEvent(input$submit, {
    print("salut")
    })
  
}

shinyApp(ui = ui, server=server)
