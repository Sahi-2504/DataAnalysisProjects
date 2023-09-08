library(tidyverse)
library(plotly)
data <- read_csv("clean_data.csv")
head(data)

#overview of data
glimpse(data)

#Checking for dimensions of data
dim(data)


#Checking for duplicate values
duplicated(data)
sum(duplicated(data))

#Checking for null values
sum(is.na(data))

data %>% view()
names(data)


df<- data %>%  select("Store","Dept","Weekly_Sales","Temperature","Fuel_Price","Unemployment","week","year")
df<- df  %>% filter(Store %in% c("1":"50"))
df<- df  %>% filter(week %in% c("5","6","51","52"))
df<- df  %>% filter(Dept %in% c("1"))
dim(df)



df_w52_2010<- df  %>% filter(week %in% c("52"))  %>% filter(year %in% c("2010"))
df_w52_2011<- df  %>% filter(week %in% c("52"))  %>% filter(year %in% c("2011"))
#Checking dimensions for 2010 dataset
dim(df_w52_2010)
#Checking dimensions for 2011 dataset
dim(df_w52_2011)
#Viewing the datasets
df_w52_2011  %>% view()
df_w52_2010 %>% view()

#------------------------------------------------------#
df_1<-data.frame(df_w52_2010$Store,df_w52_2010$Weekly_Sales,df_w52_2011$Weekly_Sales)
names(df_1)<-c("store","sales_2010","sales_2011")
head(df_1)
plot_final <- plot_ly(df_1)
plot_final <- plot_final %>% add_trace(x = ~store , y = ~sales_2010, name = "2010 sales", type = "bar")
ay <- list(
  tickfont = list(color = "green"),
  overlaying = "y",
  side = "right",
  title = "<b>Sales_2010</b>")
plot_final <- plot_final %>% add_trace(x = ~store , y = ~sales_2011, name = "2011 sales", yaxis = "y2", type = 'scatter', mode = 'lines+markers')
plot_final <- plot_final %>% layout(
  title = "Comparision of Sales of  50 stores during the christmas holiday week 2010 vs 2011", yaxis2 = ay,
  xaxis = list(title="Stores "),
  yaxis = list(title="<b>Sales_2011</b>")
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
plot_final
htmlwidgets::saveWidget(as_widget(plot_final), "Week 52 2010 vs 2011.html")

#------------------------------------------------------#
df_w51_2010<- df  %>% filter(week %in% c("51"))  %>% filter(year %in% c("2010"))
df_w51_2011<- df  %>% filter(week %in% c("51"))  %>% filter(year %in% c("2010"))
#Checking dimensions for 2010 dataset
dim(df_w51_2010)
#Checking dimensions for 2011 dataset
dim(df_w51_2011)

df_1<-data.frame(df_w51_2010$Store,df_w51_2010$Weekly_Sales,df_w51_2011$Weekly_Sales)
names(df_1)<-c("store","sales_2010","sales_2011")
head(df_1)
plot_final <- plot_ly(df_1)
plot_final <- plot_final %>% add_trace(x = ~store , y = ~sales_2010, name = "2010 sales", type = "bar")
ay <- list(
  tickfont = list(color = "green"),
  overlaying = "y",
  side = "right",
  title = "<b>Sales_2010</b>")
plot_final <- plot_final %>% add_trace(x = ~store , y = ~sales_2011, name = "2011 sales", yaxis = "y2", type = 'scatter', mode = 'lines+markers')
plot_final <- plot_final %>% layout(
  title = "Comparision of Sales of  50 stores during the Pre- holiday week 2010 vs 2011", yaxis2 = ay,
  xaxis = list(title="Stores "),
  yaxis = list(title="<b>Sales_2011</b>")
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
plot_final
htmlwidgets::saveWidget(as_widget(plot_final), "Week 51 2010 vs 2011.html")


df_w52_2010<- df  %>% filter(week %in% c("52"))  %>% filter(year %in% c("2010"))
df_w52_2011<- df  %>% filter(week %in% c("52"))  %>% filter(year %in% c("2011"))
#Checking dimensions for 2010 dataset
dim(df_w51_2010)
#Checking dimensions for 2011 dataset
dim(df_w51_2011)
#-------------------Pre-Holiday 2011 --------------------------------------------------#

df_1<-data.frame(df_w51_2011$Store,df_w51_2011$Weekly_Sales,df_w52_2011$Weekly_Sales)
names(df_1)<-c("store","week_51_sales","week_52_sales")
head(df_1)
plot_final <- plot_ly(df_1)
plot_final <- plot_final %>% add_trace(x = ~store , y = ~week_51_sales, name = "week_51_sales", type = "scatter", mode='lines')
ay <- list(
  tickfont = list(color = "green"),
  overlaying = "y",
  side = "right",
  title = "<b>week_51_sales</b>")
plot_final <- plot_final %>% add_trace(x = ~store , y = ~week_52_sales, name = "week_51_sales", yaxis = "y2", type = 'scatter', mode = 'lines')
plot_final <- plot_final %>% layout(
  title = "Comparision of Sales of  50 stores during the Pre- holiday week 2010 vs 2011", yaxis2 = ay,
  xaxis = list(title="Stores "),
  yaxis = list(title="<b>week_52_sales</b>")
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
plot_final

htmlwidgets::saveWidget(as_widget(plot_final), "Week 51 vs Week 52 year 2011.html")


df_1<-data.frame(df_w51_2010$Store,df_w51_2010$Weekly_Sales,df_w52_2010$Weekly_Sales)
names(df_1)<-c("store","week_51_sales","week_52_sales")
head(df_1)
plot_final <- plot_ly(df_1)
plot_final <- plot_final %>% add_trace(x = ~store , y = ~week_51_sales, name = "week_51_sales", type = "scatter", mode='lines')
ay <- list(
  tickfont = list(color = "green"),
  overlaying = "y",
  side = "right",
  title = "<b>week_51_sales</b>")
plot_final <- plot_final %>% add_trace(x = ~store , y = ~week_52_sales, name = "week_51_sales", yaxis = "y2", type = 'scatter', mode = 'lines')
plot_final <- plot_final %>% layout(
  title = "Comparision of Sales of  50 stores  holiday week 2010 vs 2011", yaxis2 = ay,
  xaxis = list(title="Stores "),
  yaxis = list(title="<b>week_52_sales</b>")
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
plot_final

htmlwidgets::saveWidget(as_widget(plot_final), "Week 51 vs Week 52 year 2011.html")

library(Sleuth3)
df_w51_2010<- df  %>% filter(week %in% c("51"))  %>% filter(year %in% c("2010"))
df_w51_2010 %>% view()
names(df_w51_2010)
lm.all = lm(Weekly_Sales ~Temperature+Fuel_Price+Unemployment , data =df_w51_2010 )
summary(lm.all)
confint(lm.all)
coef(lm.all)

par(mfrow=c(2,2))
plot(lm.all)
step(lm.all, direction = "backward")

library(ggplot2)
library(gganimate)
#library(babynames)
#library(hrbrthemes)
install.packages("viridis")
install.packages("gifski")
library(viridis)
library(gifski)
names(data)

# Keep only 3 names
df_2011<- df  %>% filter(week %in% c("51"))  %>% filter(year %in% c("2011"))
#%>%  filter(sex=="F")
df_2011 %>% view()

names(df_2011)
# Plot
df_2011 %>%
  ggplot(aes(x=Store, y=Weekly_Sales)) +
  geom_line() +
  geom_point() +
  scale_color_viridis(discrete = TRUE) +
  ggtitle("Popularity of American names in the previous 30 years") +
  ylab("Number of babies born") +
  transition_reveal(week)
# Save at gif:
anim_save("287-smooth-animation-with-tweenr.gif")

df_2011 %>%
  ggplot(aes(x=Store, y=Weekly_Sales))+geom_line() +geom_point() 


library(ggplot2)
library(hrbrthemes)
#install.packages("hrbrthemes")
# A basic scatterplot with color depending on Species
df_year<- df  %>% filter(week %in% c("51"))  %>% filter(year %in% c("2010","2011"))

df_year %>% ggplot(aes(x=Store, y=Weekly_Sales, shape=week, alpha=week, size=week, color=year)) + 
  geom_point() +
  theme_ipsum()
 
library(dplyr)
df_2010 <-df %>% filter(year %in% c("2010"))
df_2010 %>%view()
df_avg_sales_2010<-df_2010 %>% group_by(Store) %>%summarise(
  disp = mean(Weekly_Sales)
)
df_avg_sales %>% data.frame(df_avg_sales_2010)
