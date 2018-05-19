#' ---
#' title: "Manipulación de datos con dplyr"
#' author: "Nombre y apellido"
#' date: "Mes día,  año"
#' ---


# Nota: recuerde registrar sus datos con las variables en cada columna y las
# observaciones en las filas. La primera fila debe contener los nombres de las
# variables y se debe comenzar en la primera celda (A1)


# Cargar paquetes para análisis

library(dplyr)
library(ggplot2)
library(magrittr)
# Carga de archivo .csv: 
datos<-read.csv('Datos/datosS1.csv', sep=';',header=T)
attach(datos)

# El argumento 'sep' varia en cada computador entre , ó ;, revisen cual es el adecuado.
# Para 'dec', argumento que indica cuál es el separador decimal, la opciones son , ó . .

#### Filtrar usando filter(). Esta función permite generara subconjunto de datos que satisfagan condiciones particulares a nivel de filas. 

# Ejemplo 1 
#Generemos un subconjuto con los _hombres sedentarios_ y peso mayor a _80_

datos1<-filter(datos, sex=='Masculino' & status=='Sedentary', weight>80)

# Ejemplo 2 
# Mujeres no fumadoras no mayores a 50 años y con una duración mayor a 50.

datos2<-filter()

datos3<-filter()

###### select() Esta función permite generara subconjunto de datos que satisfagan condiciones particulares a nivel de columnas. 
datos4<-select(datos, -id)

## mutate(). Esta función adhiere una columna nueva. 

datos5<-mutate()

## Combinando `group_by()` y `summarise()`

summarize(group_by(datos,status), ProHeart=mean(heartbeat))

datos6<-datos %>% group_by(status)  %>%
  summarise(ProHeart=mean(heartbeat), sdHeart=sd(heartbeat))

datos7<-datos %>% 
