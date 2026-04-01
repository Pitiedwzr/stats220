# ==== Code ====
library(tidyverse)

# Import the data from csv
logged_data <- read_csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vShO4SMxN2LjWsJAfacWNI7Vdl-RlRIwCWndjqlhtVelZEmhYK_uQ4uKDX8b1qQipxOqmu5VHuakHBH/pub?gid=1368522283&single=true&output=csv")

# How the data looks like
names(logged_data)
glimpse(logged_data)

# Rename columns to improve readability
latest_data <- logged_data %>%
  rename(timestamp = 1,
         course = 2,
         content_type = 3,
         pages = 4,
         density = 5,
         duration_minutes = 6)

# How many sessions in the data
total_sessions <- nrow(latest_data)
total_sessions

# What's the max time for the study sessions
max_duration <- max(latest_data$duration_minutes)
max_duration

# What's the average ink density
avg_density <- mean(latest_data$density)
avg_density

# What's the average pages
ave_pages <- mean(latest_data$pages)
ave_pages

# How many papers are saved in theory
total_pages <- sum(latest_data$pages)
total_pages

# Course in pages
latest_data %>%
  ggplot() +
  geom_bar(aes(x = pages, fill = course))

# Which content type is more
latest_data %>%
  ggplot() +
  geom_bar(aes(x = content_type))

# Type of content in each course
latest_data %>%
  ggplot() +
  geom_bar(aes(x = course, fill = content_type)) +
  labs(title = "What kind of work am I doing in each course?",
       subtitle = "Breakdown of study sessions by content type across courses",
       caption = "Data collected over 14 days of iPad note-taking",
       x = "Course",
       y = "Number of Study Sessions",
       fill = "Content Type")

# Which course is more ink density
latest_data %>%
  ggplot() + 
  geom_bar(aes(x = course, fill = as.factor(density))) + # convert a numerical variable into a factor to stop the warning
  labs(title = "Which course is more ink-heavy?",
       subtitle = "Breakdown of ink density across courses",
       caption = "Data collected over 14 days of iPad note-taking",
       x = "Course",
       y = "Number of Study Sessions",
       fill = "Ink Density\n1 - Mostly Spaces\n5 - Wall of Text")

# ==== Choose of values&charts ====
#
# Two summary values I decided to use for my report:
#
# 1. avg_density: This value shows the typical "ink intensity" of my digital notes, a higher value means my notes have 
#                 more text, a lower value means my notes have more graph.
#
# 2. total_pages: This value shows the total number of digital pages I've written, and the number of papers are saved.
#
# Two bar charts I decided to use for my report:
#
# 1. Type of content in each course: It can show for each course, which type of content I write the most.
#
# 2. Which course is more ink density: It can show which course's content is more density, and also can relate to different
#                                      courses' teaching style.