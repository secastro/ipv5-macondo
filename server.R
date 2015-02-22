library(shiny)
library(ggplot2)
library(reshape)
csv_file <- "data/ip5-macondo.csv"
v5_data <- read.csv(csv_file)
v5_data$Month <- as.Date(paste(v5_data$Month, "01", sep="-"))
totals <- v5_data[ v5_data$metric == 'total_domain', c('Month', 'counter')]
names(totals) <- c('Month', 'total')
v5_data <- merge(v5_data, totals, by='Month')

shinyServer(
  function(input, output) {
    clean_v5 <- reactive({
        types <- unlist(strsplit(as.character(input$types), " "))
        clean_v5 <- v5_data[ v5_data$metric %in% types, ]
        if (input$perc) {
          clean_v5$counter <- 100*(clean_v5$counter/clean_v5$total)
        }
        clean_v5
    })
    output$deployment_plot <- renderPlot({
      if (input$perc) {
        y_label <- "Percentage of Domains"
      } else {
        y_label <- "Number of Domains"
      }
      base_plot <-  ggplot(clean_v5(), aes(x=Month, y=counter, color=metric)) + geom_line(size=1.0) + theme_bw() + labs(x="", y=y_label, title="V5 deployment") + scale_color_discrete(name="Service")
      if (input$lm) {
        base_plot + geom_smooth(method="lm")
      } else {
        base_plot
      }
    })
  }
)
# runApp("~/Documents/personal/Coursera/Developing.Data.Products/Project")