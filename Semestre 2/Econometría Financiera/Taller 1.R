library(tidyverse)
library(stargazer)

Datos <- read_excel("Datos Taller 1.xlsx", 
                             sheet = "PUNTO IV", range = "A1:F71")

CostoCientos <- Datos$CostoCientos
Cajas <- Datos$Cajas
D31 <- Datos$D31
D46 <- Datos$D46

LnCajas <- log(Cajas)
LnCostoCientos <- log(CostoCientos)
Costo2 <- CostoCientos*CostoCientos
sqrt <- sqrt(Cajas)

mod1 <- lm(CostoCientos~Cajas+D31+D46)
mod2 <- lm(Costo2 ~LnCajas+D31+D46)
mod3 <- lm(CostoCientos~sqrt+D31+D46)

stargazer(mod1,mod2, mod3, type="text")
