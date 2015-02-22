library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("IPv5 adoption in Macondo"),
  sidebarPanel(
    checkboxGroupInput("types", "Type of Service", c("Web" = "Web", "Mail" = "Mail", "DNS" = "DNS")),
    h4("Modifiers"),
    checkboxInput('perc', label = 'Display as Percentage?', value=FALSE),
    checkboxInput('lm', label = 'Include Linear Regression?', value=FALSE),
    h3("Description"),
    p("This application allows you to explore the status of deployment of IPv5 in Macondo, a magical city introduced by Gabriel Garcia Marques in the book \"A Hundred Years of Solitude\"."),
    p("IPv5, as being an advanced technology, is of great interest for the Buendia family, so they run a monthly survey where they ask each domain holder in the city if they have IPv5 service for their domain, website and mail server. That data is presented here."),
    h3("Instructions"),
    div("Select any combination of service (Web, Mail, DNS) to start. The modifiers allow you to explore the data in different ways."), strong("Display as percentage"), div(" normalizes the data by the total number of domains, useful to identify if there is any growth. "), strong("Include Linear regression"), div(" overlaps the active plot with the calculated linear regression and confidence interval")  ),
  mainPanel(
    textOutput('type_of_service'),
    plotOutput('deployment_plot'))
  ))