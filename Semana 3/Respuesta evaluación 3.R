## 1. Leyendo los datos
library(xlsx)
educacion.1 <- read.xlsx("./Semana 3/data/educacion_.xlsx", sheetIndex = 1, rowIndex = 3:37,
                         header = TRUE)
educacion.2 <- read.xlsx("./Semana 3/data/educacion_01.xlsx", sheetIndex = 1, rowIndex = 3:37,
                         header = TRUE)
educacion.3 <- read.xlsx("./Semana 3/data/educacion_03.xlsx", sheetIndex = 1, rowIndex = 3:37,
                         header = TRUE)
## 2. Uniendo las tablas
library(plyr)
names(educacion.1)
### Primero seleccionar las columnas correspondientes en cada data.frame
##tabla 1
names(educacion.1)
educacion.1 <- educacion.1[,c("Entidad.federativa", "Sin.escolaridad", "Preescolar", "Primaria", 
                           "Secundaria", "Preparatoria.o.bachillerato", "Licenciatura.o.equivalente",
                           "Posgrado")]
## tabla 2
library(dplyr)
names(educacion.2)
educacion.2 <- select(educacion.2, -c(Total, No.especificado))
## tabla 3
educacion.3 <- educacion.3[,c("Entidad.federativa", "Asiste", "No.asiste")]

## Unir las tablas
edu.list <- list(educacion.1, educacion.2, educacion.3)
educacion.joined <- join_all(edu.list, by = "Entidad.federativa")
head(educacion.joined)

## 3. Posteriormente pasar unir las variables a diferentes columnas
library(tidyr)
names(educacion.joined)
educacion.joined <- gather(educacion.joined, escolaridad, personas.escolaridad, 
       Sin.escolaridad:Posgrado)
educacion.joined <- gather(educacion.joined, apt.leer.y.escribir, personas.apt.leer.escribir,
                           Sabe.leer.y.escribir:No.sabe.leer.y.escribir)
educacion.joined <- gather(educacion.joined, asistencia.escolar, personas.asistencia, Asiste:No.asiste)
head(educacion.joined)
