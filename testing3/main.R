library(plotly)
library(ggplot2)

generate_tree_plot <- function(ppr = 100, revolutions = 1, branch_count = 10) {
    arclen <- 2 * pi
    point_count <- ceiling(ppr * revolutions)

    height <- 10
    width <- 0.3
    branch_offset <- arclen / branch_count
    branch_offset <- seq(from = 0, by = branch_offset, length.out = branch_count)

    z <- rep(seq(0, height, length.out = point_count), branch_count)

    spread <- (1:point_count) / ppr * arclen
    grid <- expand.grid(spread, branch_offset)
    spread <- grid$Var1 + grid$Var2

    x <- sin(spread) * rev(z) * width
    y <- cos(spread) * rev(z) * width

    colors <- rep(c("green", "darkgreen", "forestgreen"), length.out = point_count * branch_count)
    df <- data.frame(x, y, z, colors)

    plot <- plot_ly(df,
                    x = ~x,
                    y = ~y,
                    z = ~z,
                    type = "scatter3d",
                    mode = "markers",
                    marker = list(size = 6, color = ~colors))
    print(plot)
}

generate_tree_plot()