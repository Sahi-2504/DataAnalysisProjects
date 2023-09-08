library(tidyverse)
data <- read_csv("fifa_cleaned.csv")
head(data)


#overview of data
glimpse(data)

#Checking for dimensions of data
dim(data)

#checking for the head values in data
head(data)

#checking for missing values in columns
data %>% filter(!complete.cases(.)) %>% names() %>% table() %>% view()

#Since most of the missing values are 1 lets find out the rows that have missing values

data %>% filter(!complete.cases(.)) %>% view()

#Since this is a significant amount of data replacing na values with Unknown
mean(data$height_cm)
names(data)[names(data) == 'skill_moves(1-5)'] <- "skill"

names(data)

data <- data %>% filter(!complete.cases(.)) %>% replace_na(list(body_type="Unknown",
                                                                age=mean(data$age),
                                                                club_team="Unknown",
                                                                height_cm=mean(data$height_cm),
                                                                nationality="Unknown",
                                                                skill=mode(data$skill),
                                                                national_rating=mode(data$national_rating),
                                                                wage_euro=mean(data$wage_euro),
                                                                weight_kgs=mean(data$weight_kgs)))

#checking for null values after replacing the null values in the column

sum(is.na(data$body_type))

#Checking for duplicate values

data   %>%  view()
data  %>%  distinct() %>% view()

#There are no duplicate values

#Extracting the required columns for specific research questions
names(data)

rq_df<- data %>%  select("full_name","height_cm","weight_kgs","body_type","potential","skill","wage_euro")
head(rq_df)
write.csv(rq_df,"C:\\Users\\sahit\\OneDrive\\Documents\\Courses-1Sem\\AIT580\\Assignments\\Final Project\\ResearchData.csv",fileEncoding = "utf-8")



