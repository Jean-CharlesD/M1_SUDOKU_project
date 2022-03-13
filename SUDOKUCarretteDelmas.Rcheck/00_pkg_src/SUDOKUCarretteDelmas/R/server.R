#'Coté server de l'app shiny sudoku
#'@title server
#'@description client de l'app shiny
#'@export

library(shiny)
library(shinyMatrix)


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
        "Bravo ! Vous avez r?ussi !"
      }else{
        "essaie encore"
      }
    })
  })

}
