# source: https://github.com/Nowosad/motif-examples

rm(list = ls())

# install packages

# pkgs = c("stars", "sf", "tmap",
#          "dplyr", "readr", "osfr",
#          "spdep", "motif")
# remotes::install_cran(pkgs)

# get data and load them into R
library(osfr)
# dir.create("data")
# osf_retrieve_node("xykzv") %>%
#   osf_ls_files(n_max = Inf) %>%
#   osf_download(path = "data",
#                conflicts = "overwrite")

library(stars)
landcover <- read_stars("data/land_cover.tif") # load lc
# land cover composition was derived based on regular non-overlapping regions
comp_out <- lsp_signature(landcover,
                          type = "composition", # proportion of each land cover class
                          window = 200) # 200 by 200 cells

library(motif)

library(sf)
safe_pal6 = c("#88CCEE", "#CC6677", "#DDCC77",
              "#117733", "#332288", "#888888")
safe_pal4 = c("#88CCEE", "#CC6677", "#DDCC77", "#117733")
landcover = read_stars(system.file("raster/landcover2015.tif", package = "motif"))
landcover = droplevels(landcover)
plot(landcover, key.pos = 4, key.width = lcm(5), main = NULL)
landcover_cove = lsp_signature(landcover, type = "cove",
                               window = 100, normalization = "pdf")
landcover_comp = lsp_signature(landcover,
                               type = "composition",
                               threshold = 1,
                               normalization = "none")
