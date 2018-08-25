---
title       : Manipulación de datos con `dplyr`
subtitle    : Curso Análisis de datos experimentales con R
logo        : db.jpg
author      : Carlos Neftaly Lozano A.
job         : www.microbiostats.com 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
license     : by-nc-sa
---


## Manipulación de datos con `dplyr`

`dplyr` es un paquete para manipulación de datos que proporciona un conjunto coherente de verbos para resolver los desafíos más comunes de manipulación de datos:

+ `filter()`: selección filas  
+ `mutate()`: Crea una nueva columna
+ `select()`: selecciona columnas
+ `arrange()`: reordena filas
+ `group_by()`: Crea grupo dada una condición 
+ `join()`: Junta diferente _dataframes_
+ `summarise()`: Genera resumenes

---

## `filter()`

Útil cuando se desea filtar _filas_ que satisfacen una condición particular. 

+ El primer argumento es el `dataframe` que se desar filtar. 
+ El seugndo es la condicón que se desea satisfacer. 


```r
filter(datos, status=='Active')
```

Si se desea filtar por varias condiciones se usa el operador `&` o `|`. 


```r
filter(datos, status=='Active' & smoker=='Si')
```

--- 

## `filter()`

Las condiciones puede ser evaluadas usando los siguientes operadores: 

+ `==`: Igual a
+ `!=`: No igual a
+ `>, >=`: Mayor a, Mayor o igual 
+ `<, <=`: Menor a, Menor o igual a

--- 


## `filter()`



 + Generemos un subconjuto con los _hombres sedentarios_ y peso mayor a _80_: 


--- 


## `filter()`



 + Generemos un subconjuto con los _hombres sedentarios_ y peso mayor a _80_: 


```r
datos1<-filter(datos, sex=='Masculino' & status=='Sedentary', weight>80)
head(datos1)
```

```
##   id    status duration oxygen heartbeat age height weight       sex
## 1 47 Sedentary      679   31.4       190  37    176     82 Masculino
## 2 49 Sedentary      727   47.6       210  28    185     84 Masculino
## 3 54 Sedentary      760   47.2       184  33    182     87 Masculino
## 4 57 Sedentary      590   35.1       174  42    188     93 Masculino
## 5 61 Sedentary      660   46.7       190  44    176     81 Masculino
## 6 65 Sedentary      480   30.2       174  44    172     84 Masculino
##   smoker
## 1     Si
## 2     Si
## 3     Si
## 4     Si
## 5     No
## 6     Si
```


--- 


## `filter()`.... tu turno 

 <span style="display:block; height: 2cm;"></span>
 
<img src="https://media.giphy.com/media/xT0xeCI09WVWUXS3gk/giphy.gif" title="plot of chunk unnamed-chunk-6" alt="plot of chunk unnamed-chunk-6" width="400px" style="display: block; margin: auto;" />

 <span style="display:block; height: 0.5cm;"></span>

+ Cree un subconjuto llamado `datos2` donde se incluyan *Mujeres no fumadoras no mayores a 50 años y con una duración mayor a 50*.

+ Cree un subconjuto llamado `datos3` donde se incluyan individuos fumadores con peso entre 55 y 80.

--- 


## `select()`

Permite obtener `columnas` que cumplen una condición. El primer argumento es el `dataframe` y los argumentos subsequentes las columnas que se desean obtener. 

### Para seleccionar 

```r
select(datos, var1, var2, var3)
```

### Para remover 

```r
select(datos, -var1, -var2)
```

--- 

## `select()`

### Crear un `dataset` llamado `datos4` removiendo la variable `id`. 


```r
datos4<-select(datos, -id)
```

--- 


## mutate()

Esta función agrega una nueva columna al `dataset`. 


```r
mutate(datos, logHb=log(heartbeat))
```

---

## mutate() ..... tu turno 

<span style="display:block; height: 2cm;"></span>
 
<img src="https://media.giphy.com/media/5AcR8w022Gk4E/giphy.gif" title="plot of chunk unnamed-chunk-11" alt="plot of chunk unnamed-chunk-11" width="400px" style="display: block; margin: auto;" />
<span style="display:block; height: 2cm;"></span>


+ Cree un conjunto de datos llamados `datos5` donde se crea una variable nueva: `VR` que contenga el cociente entre `oxygen` y `duration`. 


---


## summarize()
 
Útil para agregar o resumir. A menudo usado en conjunto con otras funciones como: 

+ `n()`: Cuenta el número de registros
+ `mean()`: Calcula el promedio
+ `median()`: Calcula la mediana
+ `sd()`: Calcula desviación estándar
+ `max()`: Busca el valor máximo
+ `min()`: Busca el valor mínimo
+ `sum()`: Suma todo los valores

--- 

## summarize()
 

```r
summarize(datos, mean(oxygen))
```
 

```r
summarize(datos, r=cor(oxygen, age))
```


--- 

## group_by()

Permite agrupar los datos por los niveles de una variable categórica y aplicar, posteriomente, otras funciones


```r
group_by(datos, status)
```

```
## # A tibble: 94 x 10
## # Groups:   status [2]
##       id status duration oxygen heartbeat   age height weight sex   smoker
##    <int> <fct>     <int>  <dbl>     <int> <int>  <int>  <int> <fct> <fct> 
##  1     1 Active      660   38.1       184    23    177     83 Masc~ Si    
##  2     2 Active      628   38.4       183    21    163     52 Masc~ Si    
##  3     3 Active      637   41.7       200    21    174     61 Femi~ No    
##  4     4 Active      575   33.5       170    42    160     50 Masc~ Si    
##  5     5 Active      590   28.6       188    34    170     68 Femi~ No    
##  6     6 Active      600   23.9       190    43    171     68 Masc~ No    
##  7     7 Active      562   29.6       190    30    172     63 Masc~ No    
##  8     8 Active      495   27.3       180    49    157     53 Masc~ Si    
##  9     9 Active      540   33.2       184    30    178     63 Masc~ Si    
## 10    10 Active      470   26.6       162    57    161     63 Femi~ Si    
## # ... with 84 more rows
```

---

## Combinando `group_by()` y `summarise()`


```r
summarize(group_by(datos, status), ProHeart=mean(heartbeat), sdHeart=sd(heartbeat))
```

```
## # A tibble: 2 x 3
##   status    ProHeart sdHeart
##   <fct>        <dbl>   <dbl>
## 1 Active        181.    11.4
## 2 Sedentary     180.    20.2
```


--- 

## Combinando `group_by()`, `summarise()` y `%>%`

El operador `%>%` ,del paquete magrittr,  permiter enlazar funciones del tal forma que se ejecuente de forma continua..


```r
datos6<-datos %>% group_by(status)  %>%
  summarise(ProHeart=mean(heartbeat), sdHeart=sd(heartbeat))
```


--- 

## Combinando `group_by()`, `summarise()` y `%>%` ... tu turno


<img src="https://media.giphy.com/media/xRFiDPIVR2Dfy/giphy.gif" title="plot of chunk unnamed-chunk-17" alt="plot of chunk unnamed-chunk-17" width="300px" style="display: block; margin: auto;" />


>0. Cree un conjunto de datos llamado `datos7`
>1. Selecciones sólo las mujeres (sex: Femenino)
>2. Agrupe por `smoker` (Si, No)
>3. Obtenga una variable nueva llamada  `r` donde calcule el coeficiente de correlación `cor()` entre `duration`y `heartbeat`. 
>4. Agregue la variable `r` a `datos7`


--- 

## Respuesta.... 


```r
datos7<-datos %>% filter(sex=='Femino') %>% group_by(smoker) %>%
    summarise(r=cor(duration, heartbeat)) %>%mutate(r)
```


---


## Combinando `group_by()`, `summarise()` y `%>%` ... tu turno


<img src="https://media.giphy.com/media/xRFiDPIVR2Dfy/giphy.gif" title="plot of chunk unnamed-chunk-19" alt="plot of chunk unnamed-chunk-19" width="300px" style="display: block; margin: auto;" />

¿ Cuál es el promedio de `heartbeat`para hombres fumadores que tuvieron una duration mayor a 600? 


+ Cree un conjunto de datos llamado `datos8`


--- 



