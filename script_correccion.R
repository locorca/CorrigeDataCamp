
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
