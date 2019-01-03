insert_child <- function(path) {
  childs <- c(
    paste0("```{r, child=", path, "}"),
    "```", "", "<br>", "" 
  )
  return(childs)
}
