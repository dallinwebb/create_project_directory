# Use this or other scripts to explore your data and visualize your data.
# When you get to the point where you are satisfied with your visualization,
# save the code to a ggplot object like the example below. Your .Rmd section 
# can source this script and display the object.

library(tidyverse)

specie <- iris[, 'Species'] %>% 
    sample(1) %>% 
    as.character()

my_plot <- iris %>%
    filter(Species == specie) %>%
    ggplot(aes(Sepal.Length, Sepal.Width, col = Species)) +
    geom_point()
