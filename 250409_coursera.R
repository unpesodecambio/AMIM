install.packages("palmerpenguins")
library("palmerpenguins")
summary(penguins)
View(penguins)

ggplot(data=penguins,aes(x=flipper_length_mm,y=body_mass_g))+geom_point(aes(color=species))


print("Coding in R")
?print()

# esto es un comentario
frist_variable <- "This is my variable"
frist_variable

second_variable <- 12.5

#vectores
vec_1 <- c(13, 48.5, 71, 101, 5.2)

vec_1

#listas
str(list("a", 1L, 1.5, TRUE))

z <- list(list(list(1 , 3, 5)))

str(z)

list('Chicago' = 1, 'New York' = 2, 'Los Angeles' = 3)

Chicago

# datetime
install.packages("tidyverse") 

library(tidyverse)

library(lubridate)

today()
now()

ymd("2021-01-20")

mdy("January 20th, 2021")


# marcos de datos (DATAFRAMES)
data.frame(x = c(1, 2, 3) , y = c(1.5, 5.5, 7.5))

ccc <- data.frame(x = c(1, 2, 3) , y = c(1.5, 5.5, 7.5))

ccc

# crear directorios
dir.create ("destination_folder")

# crear archivos 
file.create ("new_text_file.txt")
file.create ("new_word_file.docx")
file.create ("new_csv_file.csv")

#copiar archivos
file.copy ("new_text_file.txt" , "destination_folder")

#eliminar archivos
unlink ("new_text_file.txt")

# matrices
matrix(c(3:8), nrow = 2)
matrix(c(3:8), ncol = 2)


# mis calculaciones
quarter_1_sales <- 35657.98
quarter_2_sales <- 43810.55
midyear_sales <- quarter_1_sales + quarter_2_sales

yearend_sales <- midyear_sales * 2
yearend_sales

#operadores lógicos
# AND (&,&&), OR (|,||) y NOT (!)

#AND
TRUE & TRUE
FALSE & TRUE

x <- 10
x > 3 & x < 12

y <- 20
y > 3 & y < 12

#OR
TRUE | TRUE
FALSE | TRUE

y <- 7
y < 8 | y > 16

x <- 12
x < 8 | x > 16

#NOT
!TRUE
!FALSE

x <- 2
!x
x != 2

airquality
Solar.R > 150 & Wind > 10

# Condicionales
# if(), else(), else if()

#if()
x <- -4
if (x > 0) {
  print("x is a positive number")
  }

#else()
if (x > 0) {
  print ("x is a positive number")
  } else {
    print ("x is either a negative number or zero")
    }

#else if()
if (x < 0) {
  print("x es un número negativo")
  } else if (x == 0) {
   print("x es cero")
  } else {
    print("x es un número positivo")
    }


#checar paquetes
installed.packages()
library(class)
library("tidyverse")
tidyverse_update()


# Toothgrowth exploration

data("ToothGrowth")
view(ToothGrowth)
install.packages("dplyr")

filtered_tg <- filter(ToothGrowth, dose==0.5)
view(filtered_tg)
arrange(filtered_tg, len)

#nested functions
arrange(filter(ToothGrowth, dose==0.5), len)

#pipes
filtered_toothgrowth <- ToothGrowth %>%
  filter(dose==0.5) %>% 
  group_by(supp) %>% 
  summarize(mean_len = mean(len, na.rm = T),.group="drop")


#### Trabajar con dataframes
library(tidyverse)
view(filtered_toothgrowth)

data("diamonds")
view(diamonds)
head(diamonds)

str(diamonds)
colnames(diamonds)

mutate(diamonds, carat_2=carat*100)


### trabajar tibbles
library(tidyverse)
data(diamonds)
View(diamonds)

as_tibble(diamonds)

# cargar datos
data()
data(mtcars)
mtcars

#read_csv(): Archivos de valores separados por comas (.csv)
#read_tsv(): Archivos de valores separados por tabuladores
#read_delim(): Archivos delimitados en general
#read_fwf(): Archivos de ancho fijo
#read_table(): Archivos tabulares cuyas columnas están separadas por espacios en blanco
#read_log(): Archivos de registro de la web

readr_example()

read_csv(readr_example("mtcars.csv"))

library(readxl)

readxl_example()

read_excel(readxl_example("type-me.xlsx"))
excel_sheets(readxl_example("type-me.xlsx"))
read_excel(readxl_example("type-me.xlsx"), sheet = "numeric_coercion")

### Limpieza
install.packages("here")
library(here)

install.packages("skimr")
library(skimr)

install.packages("janitor")
library(janitor)

install.packages("palmerpenguins")
library(palmerpenguins)

skim_without_charts(penguins)

glimpse(penguins)

head(penguins)

penguins %>% 
  select(-species) # todas las columnas menos esa

penguins %>% 
  rename(island_new=island) 

rename_with(penguins,tolower) # cambiar a minúsculas

clean_names(penguins)

## Organizar datos
penguins %>% arrange(bill_length_mm) # ascendente
penguins %>% arrange(-bill_length_mm) # descendente

penguins2 <- penguins %>% arrange(-bill_length_mm)
penguins2

penguins %>% 
  group_by(island) %>% 
  drop_na() %>% 
  summarise(mean_bill_length_mm = mean(bill_length_mm))

penguins %>% 
  group_by(island) %>% 
  drop_na() %>% 
  summarise(max_bill_length_mm = max(bill_length_mm))

penguins %>% 
  group_by(species, island) %>% 
  drop_na() %>% 
  summarize(max_bl = max(bill_length_mm), mean_bl = mean(bill_length_mm))

penguins %>% 
  filter(species == "Adelie")

#DF manual
id <- c(1:10)
name <- c("John Mendes", "Rob Stewart", "Rachel Abrahamson", "Christy Hickman", "Johnson Harper", "Candace Miller", "Carlson Landy", "Pansy Jordan", "Darius Berry", "Claudia Garcia")
job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", "Programmer", "Management", "Clerical", "Developer", "Programmer")
employee <- data.frame(id, name, job_title)

employee

employee2 <- separate(employee, name, into = c('first_name','last_name'), sep=' ')

unite(employee2, 'name', first_name,last_name, sep=' ')

penguins %>% 
  mutate(body_mass_kg=body_mass_g/1000, flipper_length_m=flipper_length_mm/1000)


# mismos datos dif resultado
install.packages('Tmisc')
library(Tmisc)
data(quartet)
view(quartet)

quartet %>% 
  group_by(set) %>% 
  summarize(mean(x),sd(x), mean(y),sd(y), cor(x,y))

ggplot(quartet, aes(x,y)) + geom_point() + geom_smooth(method=lm,se=FALSE) + facet_wrap(~set)

install.packages('datasauRus')
library(datasauRus)

ggplot(datasaurus_dozen, aes(x=x,y=y,colour = dataset))+geom_point()+theme_void()+theme(legend.position = "none")+facet_wrap(~dataset,ncol=3)


#función de sesgo
install.packages("SimDesign")
library(SimDesign)
actual_temp <- c(68.3, 70, 72.4, 71, 67,70)
predicted_temp <- c(67.9, 69, 71.5, 70, 67, 69)
bias (actual_temp, predicted_temp)

actual_sales <- c(150, 203, 137, 247, 116, 287)
predicted_sales <- c(200, 300, 150, 250, 150, 300)
bias(actual_sales, predicted_sales)
