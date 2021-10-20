## 1 Medidas de tendencia central para 2 columnas de una base de datos.
med.ten.cen <- function(x, y, data, nombres){
     data1 <- na.omit(x)
     data2 <- na.omit(y)
     media <- c(mean(data1), mean(data2))
     mediana <- c(median(data1), median(data2))
     sd <- c(sd(data1), sd(data2))
     tabulares <- rbind(media, mediana, sd)
     tabulares <- data.frame(tabulares)
     colnames(tabulares) <- names(data[,nombres])
     tabulares
}

med.ten.cen(airquality[, "Ozone"], airquality$Solar.R, airquality, c("Ozone", "Solar.R"))
dat


## 2 comparación entre grupos de una tabla.

comp.2.grupos <- function(grupo1, grupo2){
        grupo1 <- na.omit(grupo1)
        grupo2 <- na.omit(grupo2)
        error.est <- sqrt(var(grupo1)/length(grupo1) + var(grupo2)/length(grupo2))
        valort <- (mean(grupo1)-mean(grupo2))/error.est
        print(valort)
}

comp.2.grupos(DNase$conc, DNase$density)
