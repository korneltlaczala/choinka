library(plotly)
library(ggplot2)

points_per_rotation <- 360*2*pi
rotations <- 2
point_count <- ceiling(points_per_rotation * rotations)
height <- 10
wide_constant <- 0.3

z <- seq(0, height, length.out = point_count)

x <- sin((1:point_count)/360) * rev(z) * wide_constant
y <- cos((1:point_count)/360) * rev(z) * wide_constant

df <- data.frame(x, y, z)

plot <- plot_ly(df, x = ~x, y = ~y, z = ~z, type = "scatter3d", mode = "markers", marker = list(size=2))
print(plot)
