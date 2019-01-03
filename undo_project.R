undo_project <- function() {
  fs::dir_delete(path = c("data", "documents","deliverables", "global_scripts", 
                          "personal_directories"))
  
  fs::file_delete(path = c("README.md"))
}
