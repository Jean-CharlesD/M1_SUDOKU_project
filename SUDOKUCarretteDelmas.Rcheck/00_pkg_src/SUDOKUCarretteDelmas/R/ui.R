#'@title Coté client de l'app shiny sudoku
#'@author Camille Carrette Jean Charles Delmas
#'@export

library(shiny)
library(shinyMatrix)

ui <- fluidPage(

  #Tire
  headerPanel('SUDOKU'),

  #Choix des options et bouton de g?n?ration des diff?rentes grilles
  sidebarPanel(
    selectInput('level','Choix de la difficult?',c('facile','difficile')),
    selectInput('Choixgrille','Choix de la grille',c('complete','incomplete')),
    actionButton('genGrille','G?n?ration du sudoku')
  ),

  #Grille
  mainPanel(
    #Panel de la grille
    conditionalPanel(condition = "input.genGrille > 0", uiOutput(outputId = "displayGrid")),
    #conditionalPanel(condition = "input.Choixgrille == 'incomplete'", actionButton('submit','soumission',grille='grille'))
    textOutput("Resultat")
  )
)
