group_project_dir <- function(members, 
                              readme_help   = TRUE, 
                              workflow_help = TRUE) {
  require(tidyverse)
  require(fs)
  
  members_us <- members %>% str_replace_all("\\s", "_")
  dir_main   <- c("data","deliverables", "documents", "global_scripts", 
                  "personal_directories")
  dir_readme <- c(paste0("personal_directories", "/", members_us, "/", "README.md"),
                  paste0(c(dir_main, "personal_directories"), "/", "README.md"))
  
  members_us %>% dir_create(path = "personal_directories")
  dir_main   %>% dir_create()
  dir_readme %>% file_create()
  
  if (file_exists("README.me") == FALSE) file_create("README.md")

  if (readme_help) {
    add_readme()
  }
  
  if (workflow_help) {
    dont_print <- map(.x = members_us, .f = generate_user_Rmd)
    
    contributions <- paste0('"../personal_directories', "/", 
                            members_us, "/",
                            rep('my_contribution.Rmd"', length(members_us)))

    deliver_content <- c(
      "---",
      'title: "Deliverable"',
      "output: html_document",
      "---", "",
      "```{r setup, include=FALSE}",
      "knitr::opts_chunk$set(echo = TRUE)",
      "```", "",
      "# Introduction", "",
      "The general overview of the project can be discussed here. This ",
      "document is setup to compile the contents of each team member's ",
      "`my_contribution.Rmd` within their `personal_folder`. This enables an ",
      "organization style that makes for easy iteration and reduces the need ",
      "for multiple people working in the same document, which can be combersome ", 
      "when using github.", "",
      "Below are just randomly generated examples of each team members ",
      "contribution. Any changes saved in their `my_contribution.Rmd` will be ",
      "reflected in this document.",
      "<br>", "",
      map(contributions, insert_child) %>% purrr::flatten(.)
      )
    
    write_lines(deliver_content, path = "deliverables/combined_example.Rmd")
  }

}


members <- c("Jason Bourne", "Jack Bauer","Ethan Hunt")
group_project_dir(members)
undo_project()
