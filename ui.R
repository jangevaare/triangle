library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Triangle test calculator"),

  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
    	numericInput("n", 
        		 label = h4("Number of participants"),
        		 min=1,
                 value = 20),
                 
    	numericInput("x", 
        		 label = h4("Number of correct participants"),
        		 min=0,
                 value = 10),
                 
         h4(textOutput("pvalue"))
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("nullplot")
    )
  )
))