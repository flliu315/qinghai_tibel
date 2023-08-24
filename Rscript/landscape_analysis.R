library(motif)
library(stars)
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
