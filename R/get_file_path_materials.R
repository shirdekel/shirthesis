##' @title Get materials file paths
##'
##' @param file_name_materials File name of the materials
##' @param materials_directory Materials directory
##'
##' @return A filepath string
##' @author Shir Dekel
##' @export
get_file_path_materials <- function(materials_directory, file_name_materials) {
  file_path_materials <-
    file.path(
      materials_directory,
      paste0(
        file_name_materials,
        ".png"
      )
    )

  return(file_path_materials)
}
