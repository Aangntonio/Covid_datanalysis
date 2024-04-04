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

View(defunciones)
summary(intubados$EDAD)

summary(defunciones$EDAD)
sd(defunciones$EDAD)
hist(defunciones$EDAD, breaks = 50, col = "skyblue", xlab = "Edades", ylab = "Frecuencia", main = "Defunciones por Covid en 2023 por edades")

hist(intubados$EDAD, breaks = 20, col = "skyblue", xlab = "Edades", ylab = "Frecuencia", main = "Intubados por Covid en 2023 por edades")
hombres <- subset.data.frame(data, data$SEXO == 2)
mujeres <- subset.data.frame(data, data$SEXO == 1)

hombres_intubados <- subset.data.frame(hombres, hombres$INTUBADO == 1)
mujeres_intubados <- subset.data.frame(mujeres, mujeres$INTUBADO == 1)

# histograma para hombres
hist(hombres_intubados$EDAD, breaks = 20, col = "skyblue", xlab = "Edades", ylab = "Frecuencia", main = "Hombres intubados por Covid en 2023 por edades")

# histograma para mujeres
hist(mujeres_intubados$EDAD, breaks = 20, col = "pink", xlab = "Edades", ylab = "Frecuencia", main = "Mujeres intubadas por Covid en 2023 por edades")

hombres_defunciones <- subset.data.frame(hombres, hombres$FECHA_DEF != '9999-99-99')
mujeres_defunciones <- subset.data.frame(mujeres, mujeres$FECHA_DEF != '9999-99-99')

boxplot(hombres_defunciones$EDAD, main = "Edades de los hombres que han fallecido", xlab = "Hombres", ylab = "Edad", col = "skyblue")
boxplot(mujeres_defunciones$EDAD, main = "Edades de las mujeres que han fallecido", xlab = "Mujeres", ylab = "Edad", col = "pink")

par(mfrow = c(1, 2))
boxplot(hombres_intubados$EDAD, main = "Hombres intubados", xlab = "Hombres", ylab = "Edad", col = "skyblue")
boxplot(mujeres_intubados$EDAD, main = "Mujeres intubadas", xlab = "Mujeres", ylab = "Edad", col = "pink")
par(mfrow = c(1, 1))
###########Conteos
intubados_def <- subset.data.frame(intubados, intubados$FECHA_DEF != '9999-99-99')
View(intubados_def)
#####Fechas ----------------------
install.packages("lubridate")
library(lubridate)

##Defunciones por  mes --------------------------------------------- 
library(dplyr)
attach(defunciones)
enero <- subset(defunciones,FECHA_DEF  <= ymd("2023-01-01"))
febrero <- subset(defunciones, FECHA_DEF > ymd("2023-01-31") & FECHA_DEF <= ymd("2023-02-01"))
marzo <- subset(defunciones,FECHA_DEF > ymd("2023-02-28") & FECHA_DEF  <= ymd("2023-03-01"))
abril <- subset(defunciones,FECHA_DEF > ymd("2023-01-31") & FECHA_DEF  <= ymd("2023-04-01"))
mayo <- subset(defunciones,FECHA_DEF > ymd("2023-03-30") & FECHA_DEF  <= ymd("2023-05-01"))
junio <- subset(defunciones,FECHA_DEF  <= ymd("2023-06-01"))
julio <- subset(defunciones,FECHA_DEF  <= ymd("2023-07-01"))
agosto <- subset(defunciones,FECHA_DEF  <= ymd("2023-08-01"))
septiembre<- subset(defunciones,FECHA_DEF  <= ymd("2023-09-01"))
octubre <- subset(defunciones,FECHA_DEF  <= ymd("2023-10-01"))
noviembre<- subset(defunciones,FECHA_DEF  <= ymd("2023-11-01"))
diciembre <- subset(defunciones,FECHA_DEF  <= ymd("2023-12-01"))
View(febrero)
######MOrbilidades
# Crear la variable nominal combinada
# data$Condicion_medica <- ifelse(data$OBESIDAD == 1, "Obesidad",
#                                 ifelse(data$TABAQUISMO == 1, "Tabaquismo",
#                                        ifelse(data$CARDIOVASCULAR == 1, "Cardiovasculares",
#                                               ifelse(data$EPOC == 1, "EPOC",
#                                                      ifelse(data$ASMA == 1, "Asma",
#                                                             ifelse(data$HIPERTENSION == 1, "Hipertensión",
#                                                                    ifelse(data$RENAL_CRONICA == 1, "Enfermedad Renal Crónica",
#                                                                           ifelse(data$INMUSUPR == 1, "Inmunosupresión", "Ninguna"))))))))

#

data$Diabetico <- ifelse(data$DIABETES == 1, 'Diabetes ', 0 )
data$Epoc <- ifelse(data$EPOC == 1, 'EPOC ', 0 )
data$Asma <- ifelse(data$ASMA == 1, 'ASMA ', 0 )
data$Inmu <- ifelse(data$INMUSUPR == 1, 'Inmunu ', 0 )
data$Hipertenso <- ifelse(data$HIPERTENSION == 1, 'Hipertension ', 0 )
data$Cardio <- ifelse(data$CARDIOVASCULAR == 1, 'Cardiovascular ', 0 )
data$obesidad <- ifelse(data$OBESIDAD == 1, 'Obesidad ', 0 )
data$Renal <- ifelse(data$RENAL_CRONICA == 1, 'Renal_cronica ', 0 )
data$Tabaquismo <- ifelse(data$TABAQUISMO == 1, 'Tabaquismo ', 0 )




data$greed <- paste(data$Diabetico, data$Epoc, data$Asma, data$Inmu, data$Hipertenso, data$Cardio, data$obesidad, data$Renal, data$Tabaquismo, sep = "")
data$greed <- gsub("0", "", data$greed )
# data$greed < - unique(c(data$DIABETES,data$EPOC,data$ASMA,data$INMUSUPR,data$HIPERTENSION,data$CARDIOVASCULAR,data$OBESIDAD,data$RENAL_CRONICA,data$TABAQUISMO))
datos <- data.frame(
  id = data$ID_REGISTRO,
  In = data$INTUBADO,
  edad = data$EDAD,
  def = data$FECHA_DEF,
  Resultado = data$RESULTADO_ANTIGENO,
  Condicion_medica = data$greed
  
  
)
datos$Condicion_medica <- ifelse(datos$Condicion_medica == "", "Sano", datos$Condicion_medica)
library(dplyr)
attach(datos)
table(Condicion_medica)
group_by(datos,Condicion_medica) %>%
  summarise(
    conteo = n()
    
  )
morbilidades <- datos %>%
  group_by(Condicion_medica) %>%
  summarise(conteo_total = n())

print(morbilidades$Condicion_medica)
