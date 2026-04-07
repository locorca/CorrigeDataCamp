
library(readxl)
library(writexl)

directorio_entregas <- "entregas_temp"

ficheros_puntuaciones <- list.files(path = directorio_entregas, 
                              pattern = "(?i)puntos.*\\.txt$", 
                              recursive = TRUE, 
                              full.names = TRUE)

ficheros_justificante <- list.files(path = directorio_entregas, 
                            pattern = "(?i)justificante|certif.*\\.(pdf|png|jpg)$", 
                            recursive = TRUE, 
                            full.names = TRUE)


lista_filas <- lapply(ficheros_puntuaciones, function(ruta) {
  
  componentes <- strsplit(ruta, "/")[[1]]
  carpeta_alumno <- componentes[2]
  apellido_extraido <- strsplit(carpeta_alumno, "_")[[1]][1]
  
  contenido <- readLines(ruta, n = 1, warn = FALSE)
  
  return(data.frame(
    apellidos = apellido_extraido,
    puntos = as.numeric(contenido),
    NomFile = basename(ruta),
    Puntos = as.character(contenido),
    stringsAsFactors = FALSE
  ))
})

evalua_df <- do.call(rbind, lista_filas)
evalua_df <- evalua_df[order(evalua_df$apellidos), ]