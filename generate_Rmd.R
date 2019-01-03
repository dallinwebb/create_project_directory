generate_user_Rmd <- function(member) {
  
  rscript_content <- c(
    "# Use other scripts to explore your data and visualize your data.",
    "# When you get to the point where you are satisfied with your visualization,",
    "# save the code to a ggplot object like the example below. Your .Rmd section ", 
    "# can source this script and display the object.", "",
    "library(tidyverse)", "", 
    "specie <- iris[, 'Species'] %>% 
    sample(1) %>% 
    as.character()", "", 
    "my_plot <- iris %>%
    filter(Species == specie) %>%
    ggplot(aes(Sepal.Length, Sepal.Width, col = Species)) +
    geom_point()"
  )
  
  rmd_content <- c(
    paste0("# ", member, "'s Section"), "",
    "You can write your portion of the deliverable here. This .Rmd will be ", 
    "part of the whole `presentation.Rmd`` final in the deliverables directory, ",
    "similar to how the following r chunk displays the object from your R scripts.", 
    "",
    "```{r message=FALSE, warning=FALSE}", 
    'source("data_vis.r")', 
    "my_plot", 
    "```", "", "<br>"
    )
  
  
  rmd_path <- paste0("personal_directories/", member, "/my_contribution.Rmd")
  rsc_path <- paste0("personal_directories/", member, "/data_vis.R")
  
  write_lines(rmd_content, path = rmd_path)
  write_lines(rscript_content, path = rsc_path)
  
}
