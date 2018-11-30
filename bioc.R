## ----spatprot0, eval=TRUE, message=FALSE, warning=FALSE------------------
library("pRoloc")
library("pRolocdata")
data(hyperLOPIT2015)

setStockcol(paste0(getStockcol(), 80))

library("magrittr")
library("dplyr")
library("ggplot2")

## ----spatprot1, eval=FALSE-----------------------------------------------
#  plot2D(hyperLOPIT2015, fcol = NULL,
#         col = "#00000025", pch = 19)
#  plot2D(hyperLOPIT2015, method = "hexbin")
#  plot2D(hyperLOPIT2015)
#  
#  plot2D(hyperLOPIT2015, fcol = "final.assignment")
#  sz <- exp(fData(hyperLOPIT2015)$svm.score) - 1
#  plot2D(hyperLOPIT2015, fcol = "final.assignment",
#         cex = sz)
#  addLegend(hyperLOPIT2015)

## ----spatprot1eval, out.width='.8\\linewidth', eval=TRUE, echo=FALSE, fig.width = 12, fig.height = 12----
par(mfrow = c(2, 2), mar = c(4, 2, 0, 0))
plot2D(hyperLOPIT2015, fcol = NULL,
       col = "#00000025", pch = 19)
## plot2D(hyperLOPIT2015, method = "hexbin")
plot2D(hyperLOPIT2015)

plot2D(hyperLOPIT2015, fcol = "final.assignment")
sz <- exp(fData(hyperLOPIT2015)$svm.score) - 1
plot2D(hyperLOPIT2015, fcol = "final.assignment",
       cex = sz)
addLegend(hyperLOPIT2015)

## ----spatprot2-----------------------------------------------------------
unknownMSnSet(hyperLOPIT2015) %>%
    fData %>% select(final.assignment) %>% table

## ----spatprot3, fig.width = 10, fig.heigth = 6---------------------------
unknownMSnSet(hyperLOPIT2015) %>% fData %>%
    select(final.assignment, svm.score) %>%
    ggplot(aes(x = final.assignment, y = svm.score)) +
    geom_boxplot(aes(fill =  final.assignment))

