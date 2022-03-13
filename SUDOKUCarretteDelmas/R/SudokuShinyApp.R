library(shiny)
library(shinyMatrix)


ui <- fluidPage(
  
  #Tire
  headerPanel('SUDOKU'),
  
  #Choix des options et bouton de génération des différentes grilles
  sidebarPanel(
    selectInput('level','Choix de la difficulté',c('facile','difficile')),
    selectInput('Choixgrille','Choix de la grille',c('complete','incomplete')),
    actionButton('genGrille','Génération du sudoku')
  ),
  
  #Grille
  mainPanel(
    #Panel de la grille
    conditionalPanel(condition = "input.genGrille > 0", uiOutput(outputId = "displayGrid")),
    #conditionalPanel(condition = "input.Choixgrille == 'incomplete'", actionButton('submit','soumission',grille='grille'))
    textOutput("Resultat")
  )
)

server <- function(input,output){
  
  grillecomplete <- genGrilleComplete()
  
  observeEvent(input$genGrille, {
    if(input$Choixgrille == "complete"){
      m = reactive({grillecomplete})
      output$displayGrid <- renderUI({
        div(matrixInput(inputId = "newGrid", value = m()),)
      })
      
    }else{
      if(input$level == 'facile'){
        diff <- 1
      }else{
        diff <- 2
      }
      
      grilleIncomplete <- genGrilleIncomplete(grillecomplete,diff)
      m = reactive({grilleIncomplete})
      output$displayGrid <- renderUI({
        div(matrixInput(
          inputId = "newGrid", 
          value = m(),
          class = numeric(),
          rows = list(n = 9),
          cols = list(n = 9)
          ),
        actionButton('submit','soumission',grille='grille')
        )
      })
    }
  })
  
  observeEvent(input$submit, {
    print(grillecomplete)
    print(input$newGrid)
    victory <- CompareMatrix(grillecomplete,input$newGrid)
    output$Resultat <- renderText({
      if(victory){
        "Bravo ! Vous avez réussi !"
      }else{
        "essaie encore"
      }
    })
    })
  
}

shinyApp(ui = ui, server=server)
