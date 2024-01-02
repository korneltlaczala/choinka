library(plotly)
library(ggplot2)

ppr <- 200 # ppr - points per revolution
revolutions <- 2
arclen <- 2 * pi
point_count <- ceiling(ppr * revolutions)
height <- 10
width <- 0.3

z <- seq(0, height, length.out = point_count)

x <- sin((1:point_count) / ppr * arclen) * rev(z) * wide_constant
y <- cos((1:point_count) / ppr * arclen) * rev(z) * wide_constant

df <- data.frame(x, y, z)

plot <- plot_ly(df,
                x = ~x,
                y = ~y,
                z = ~z,
                type = "scatter3d",
                mode = "markers",
                marker = list(size = 2))
print(plot)
