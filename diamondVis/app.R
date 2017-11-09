library(shiny)
library(ggplot2)


#user interface

ui = fluidPage(
  titlePanel("Diamonds Data", windowTitle = "Diamonds"), 
  sidebarLayout(
    sidebarPanel(
      helpText("This app is to visualize diamonds dataset."),
      textInput(inputId = "title", 
                label = "Chart Title",
                value = ""),
      selectInput(inputId = "pos",
                  label = "Position",
                  choices = list("stack", "dodge"),
                  selected = "stock")
    ),
    mainPanel(
      plotOutput(outputId = "plot")
    )
  )
)
###窗口大小会根据内容或者图的大小改变

###server

server = function(input,output){
  output$plot = renderPlot(ggplot(diamonds, aes(cut, fill = clarity))+
    geom_bar(position = input$pos)+
    ggtitle(input$title))
}

###run the app
shinyApp(ui,server)
###左边的是side bar panel 右边的是main panel