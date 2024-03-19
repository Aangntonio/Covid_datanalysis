#Este es un script de prueba para poder hacer nuetra lectura de datos
#use para el primer archivo un 
# data <- read.csv("Archivo,csv", header = T)
#new_data <- subset.data.frame(data, data$Entidad == 9) #   clave de la CDMX
#write.csv(x = new_Data, file = "Covid_CDMX.csv", row.names = T)

data <-  read.csv("Covid_cdmx.csv", header = T)
View(data)
