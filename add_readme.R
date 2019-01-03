add_readme <- function() {
  readme_main <- c(
    "# Project Title", "", 
    "One sentence describing scope of the project", "", "---", "",
    "### Objective/Questions", "",
    "- 1st Objective/Question", "",
    "- 2nd Objective/Question", "",
    "- 3rd Objective/Question", ""
  )
  
  readme_data <- c(
    "### Data Collection Method", "",
    "Ex. Survey, Machinery, Web, Database query, etc.", "",
    "### Data Dictionary", "",
    "`X1` = Predictor", "",
    "...", "",
    "`Y` = Target"
  )
  
  readme_deli <- c(
    "# Deliverables", "", 
    "Use this directory to store files that will eventually become your final ",
    "product. Files here usually include `.Rmd` files for presentations going ",
    "over project results"
  )
  
  readme_docs <- c(
    "# Documents", "",
    "Use this directory to store files such as non-disclosure agreements, ",
    "project descriptions from clients, research on project topic, etc."
  )
  
  readme_glsc <- c(
    "# Global Scripts", "",
    "Use this directory to store scripts that will be usefull for all project ",
    "team members. For best practices, refrain from editing this code ", 
    "for personal work. That work should be done in your personal directory", "", 
    "Files here can include scripts that:", "",
    "- clean data (It's a good idea to have a standardized method for cleaning ",
    "your data so everyone in the team is working on identical datasets).", "", 
    "- contain template code that multiple team members will need.", "",
    "- etc."
  )
  
  readme_pers <- c(
    "# Personal Directories", "",
    "Use this directory to store each team members files. This is key to ", 
    "keeping a project's files system organized."
  )
  
  readme_mems <- c(
    "# Notes", "",
    "Use this directory to store your personal files including scripts, images,
      documents, etc. that will contribute to the project.", "",
    "This is also a great place to record your notes such as ideas, thought
      process, links to research on project topics etc."
  )
  
  readme_mems_paths <- paste0("personal_directories", "/", 
                              members_us, "/",
                              rep("README.md", length(members_us)))
  
  write_lines(x = readme_main, path = "README.md")
  write_lines(x = readme_data, path = "data/README.md")
  write_lines(x = readme_deli, path = "deliverables/README.md")
  write_lines(x = readme_data, path = "documents/README.md")
  write_lines(x = readme_glsc, path = "global_scripts/README.md")
  write_lines(x = readme_pers, path = "personal_directories/README.md")
  dont_print <- map(.x = readme_mems_paths, .f = write_lines, x = readme_mems)
}
