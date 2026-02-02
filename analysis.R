library(readxl)
library(tidyverse)
library(scales) # Useful for the comma labels

# Loading and Clean Names
bird_base <- read_excel("C://Users//Deni//Desktop//RawData//bird_base.xlsx", skip = 1) %>%
  rename(Common_Name = 1) 

# Centralized Cleaning
# I create one master 'clean' dataframe to use for both plots
bird_clean <- bird_base %>%
  filter(!is.na(`Primary Diet`), `Primary Diet` != "No Information")

# Combined Logic for the Lollipop
diet_mass_summary <- bird_clean %>%
  group_by(`Primary Diet`) %>%
  summarise(
    Median_Mass = median(`Average Mass`, na.rm = TRUE),
    Count = n()
  ) %>%
  filter(!is.na(Median_Mass))

# Plotting...
# Plot 1: Species Distribution by Diet
bird_clean %>%
  count(`Primary Diet`) %>%
  arrange(desc(n)) %>%
  ggplot(aes(x = reorder(`Primary Diet`, n), y = n, fill = n)) +
  geom_col(show.legend = FALSE) +
  coord_flip() +
  scale_fill_gradient(low = "#A3C9A8", high = "#2E5A47") + # Dynamic green gradient
  geom_text(aes(label = n), hjust = -0.2, size = 3.5) +
  labs(
    title = "Global Distribution of Avian Diets",
    subtitle = "Invertebrates represent the primary food source for most bird species",
    x = NULL,
    y = "Number of Species"
  ) +
  theme_minimal() +
  theme(panel.grid.major.y = element_blank())

# Plot 2: Median Mass by Diet
# Create the Lollipop Chart with Labels
bird_clean %>%
  group_by(`Primary Diet`) %>%
  summarise(Median_Mass = median(`Average Mass`, na.rm = TRUE)) %>%
  filter(!is.na(Median_Mass)) %>%
  ggplot(aes(x = reorder(`Primary Diet`, Median_Mass), y = Median_Mass)) +
  
  # The Stick
  geom_segment(aes(xend = `Primary Diet`, yend = 0.1), color = "grey80", linewidth = 1) +
  
  # The Candy
  geom_point(color = "#D67D3E", size = 5) + 
  
  # The Labels (The new part!)
  geom_text(aes(label = paste0(round(Median_Mass, 1), "g")), 
            hjust = -0.4,           # Pushes text to the right of the point
            size = 3.5, 
            fontface = "bold",
            color = "#444444") +
  
  # Log scale remains essential
  scale_y_log10(labels = scales::label_comma(), 
                expand = expansion(mult = c(0, 0.2))) + # Adds extra room for labels
  
  coord_flip() +
  theme_minimal() +
  labs(
    title = "Typical Body Mass by Diet Type",
    subtitle = "Median weight in grams labeled next to each niche",
    x = NULL,
    y = "Median Body Mass (grams, Log Scale)"
  ) +
  theme(
    axis.text.y = element_text(face = "bold", size = 11),
    panel.grid.minor = element_blank()
  )