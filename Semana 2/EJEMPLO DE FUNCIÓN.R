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


dat <-  med.ten.cen(airquality$Ozone, airquality$Solar.R, airquality, c("Ozone", "Solar.R"))
dat

