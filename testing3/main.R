library(plotly)
library(ggplot2)

arclen <- 2 * pi
plot <- plot_ly()

generate_tree_plot <- function(ppr = 100, revolutions = 1, branch_count = 10, height = 10) {
    point_count <- ceiling(ppr * revolutions)

    width <- height * 3/10
    branch_offset <- arclen / branch_count
    branch_offset <- seq(from = 0, by = branch_offset, length.out = branch_count)

    z <- rep(seq(0, height, length.out = point_count), 2*branch_count)

    spread <- (1:point_count) / ppr * arclen
    grid <- expand.grid(spread, branch_offset)
    spread <- grid$Var1 + grid$Var2
    spread <- c(spread, rev(spread))

    x <- sin(spread) * rev(z) * width / height
    y <- cos(spread) * rev(z) * width / height

    colors <- rep(c("green", "darkgreen", "forestgreen"), length.out = point_count * branch_count * 2)
    df <- data.frame(x, y, z, colors)

    plot <- plot %>% 
        add_trace(  df,
                    x = ~x,
                    y = ~y,
                    z = ~z,
                    type = "scatter3d",
                    mode = "markers",
                    marker = list(size = 6, color = ~colors))
}

generate_trunk_plot <- function(ppr = 5, height = 8.5, ring_density = 0.2, width = 0.2) {

    ring_count <- floor(height / ring_density)
    ring_heights <- rep(seq(0, height, length.out = ring_count), each = ppr)
    spread <- rep((1:ppr) / ppr * arclen, ring_count)
    
    x <- sin(spread) * width
    y <- cos(spread) * width

    df <- data.frame(x, y, ring_heights)
    
    plot <- plot %>% 
        add_trace(  df,
                    x = ~x,
                    y = ~y,
                    z = ~ring_heights,
                    type = "scatter3d",
                    mode = "markers",
                    marker = list(size = 10, color = "saddlebrown"))
}

plot <- generate_tree_plot()
plot <- generate_trunk_plot()
print(plot)