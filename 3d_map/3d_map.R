library(plotrix)

inferior_limit <- -80
superior_limit <- 30
alpha_rotation <- -50
beta_rotation <- 25

height_data <- read.table("data/height_data.txt", header = FALSE)
coordinates_data <- read.table("data/coordinates_data.txt", header = TRUE)

z <- as.matrix(height_data)
x <- 5 * seq_len(nrow(z)) - 5
y <- 5 * seq_len(ncol(z)) - 5

jet_colors <- colorRampPalette(c("gray50", "white"))
number_of_colors <- 100
color_ramp <- jet_colors(number_of_colors)
center_values <- z[-1, -1] + z[-1, -ncol(z)] +
    z[-nrow(z), -1] + z[-nrow(z), -ncol(z)]
facet_colors <- cut(center_values, number_of_colors)

tiff(
    filename = "3d_map.tif",
    width = 170, height = 130, units = "mm", pointsize = 10,
    bg = "white", res = 600, family = "serif"
)

par(font = 10, oma = c(0, 0, 0, 0), mar = c(1, 1, 1, 1))
perspective_plot <- persp(x, y, z,
    scale = FALSE, theta = alpha_rotation, phi = beta_rotation, r = 2,
    zlim = c(inferior_limit, superior_limit),
    xlab = "y", ylab = "x", zlab = "z",
    col = color_ramp[facet_colors], lwd = 0.6
)
color.legend(0.26, -0.065, 0.265, 0.17,
    legend = c(0, 7, 14),
    color_ramp, gradient = "y", align = "rb"
)

points(trans3d(coordinates_data$yacc, 100 - coordinates_data$xacc,
    inferior_limit,
    pmat = perspective_plot
), pch = 20, cex = 0.4)

for (i in 1:40) {
    lines(trans3d(c(5 * i - 5, 5 * i - 5), c(0, 100),
        inferior_limit,
        pmat = perspective_plot
    ), lty = 1, lwd = 0.6)
}
for (i in 1:20) {
    lines(trans3d(c(0, 200), c(5 * i - 5, 5 * i - 5),
        inferior_limit,
        pmat = perspective_plot
    ), lty = 1, lwd = 0.6)
}

dev.off()