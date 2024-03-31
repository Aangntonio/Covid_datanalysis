#Este es un script de prueba para poder hacer nuetra lectura de datos
#use para el primer archivo un 
# data <- read.csv("Archivo,csv", header = T)
#new_data <- subset.data.frame(data, data$Entidad == 9) #   clave de la CDMX
#write.csv(x = new_Data, file = "Covid_CDMX.csv", row.names = T)

data <-  read.csv("Covid_cdmx.csv", header = T)
View(data)
defunciones <- subset.data.frame(data, data$FECHA_DEF != '9999-99-99')
intubados <- subset.data.frame(data, data$INTUBADO == 1 )
#PArticiones

View(intubados)
summary(intubados$EDAD)

summary(defunciones$EDAD)
sd(defunciones$EDAD)
hist(defunciones$EDAD, breaks = 20, col = "skyblue", xlab = "Edades", ylab = "Frecuencia", main = "Defunciones por Covid en 2023 por edades")

hist(intubados$EDAD, breaks = 20, col = "skyblue", xlab = "Edades", ylab = "Frecuencia", main = "Intubados por Covid en 2023 por edades")
