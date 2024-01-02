library(plotly)
library(ggplot2)

# point related constants
ppr <- 100 # ppr - points per revolution
revolutions <- 1
arclen <- 2 * pi
point_count <- ceiling(ppr * revolutions)

# tree properties
height <- 10
width <- 0.3
branch_count <- 10
branch_offset <- arclen / branch_count
branch_offset <- seq(from = 0, by = branch_offset, length.out = branch_count)

z <- rep(seq(0, height, length.out = point_count), 2*branch_count)

spread <- (1:point_count) / ppr * arclen
grid <- expand.grid(spread, branch_offset)
spread <- grid$Var1 + grid$Var2

x <- sin(spread) * rev(z) * wide_constant
y <- cos(spread) * rev(z) * wide_constant

df <- data.frame(x, y, z)

plot <- plot_ly(df,
                x = ~x,
                y = ~y,
                z = ~z,
                type = "scatter3d",
                mode = "markers",
                marker = list(size = 2))
print(plot)
