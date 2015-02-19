library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("IPv5 adoption in Macondo"),
  sidebarPanel(
    checkboxGroupInput("types", "Type of Service", c("Web" = 1, "Mail" = 2, "DNS" = 3))),
  mainPanel(h4('Main Panel'))
  ))