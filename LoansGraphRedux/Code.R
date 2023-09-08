#Loading necessary libraries
#rm(list=ls())
library(tidyverse)
library(dplyr)
library(plotly)
str(mpg)

#Loading the dataset
df1= read_csv("FY_2020_loans_by_state.csv",skip=2)
head(df1)
colnames(df1)<-c('State_abbr','Total_Loans','Loan_Amount')
plot_final <- plot_ly(df1)
# Add traces
plot_final <- plot_final %>% add_trace(x = ~State_abbr, y = ~Total_Loans, name = "Loans", type = "bar")
ay <- list(
    tickfont = list(color = "green"),
    overlaying = "y",
    side = "right",
    title = "<b>Loan Amount</b>")
plot_final <- plot_final %>% add_trace(x = ~State_abbr, y = ~Loan_Amount, name = "Loan_Amount", yaxis = "y2", type = 'scatter', mode = 'lines+markers')
plot_final <- plot_final %>% layout(
    title = "VA Home Loan Volume by State for CY2020", yaxis2 = ay,
    xaxis = list(title="States "),
    yaxis = list(title="<b>No Of Loans</b>")
)%>%
    layout(plot_bgcolor='#e5ecf6',
           xaxis = list(
               zerolinecolor = '#ffff',
               zerolinewidth = 2,
               gridcolor = 'ffff'),
           yaxis = list(
               zerolinecolor = '#ffff',
               zerolinewidth = 2,
               gridcolor = 'ffff')
    )


plot_final<-plot_final %>% layout(legend = list(x=1.1, y = -0.1))
plot_final <-plot_final %>% layout(legend = list(orientation = 'h'))
plot_final
htmlwidgets::saveWidget(as_widget(plot_final), "reDesignedPlot.html")

