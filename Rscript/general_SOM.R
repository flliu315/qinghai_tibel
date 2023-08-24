rm(list = ls())
library(kohonen)
data("wines")
class(wines)
wines.sc <- scale(wines)
set.seed(7)
wine.som <- som(X = wines.sc, grid = somgrid(5, 4, "hexagonal"))

# plotting the codebook vectors of the wine data
plot(wine.som, main = "Wine data") # show the codebook vectors
