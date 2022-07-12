png(file = "dna_strand.png", width = 250, height = 500)
plot(0, 0,
  xlim = c(-2, 2), ylim = c(0, 8 * pi), type = "n",
  bty = "n", axes = FALSE, ann = FALSE
)

x <- NA
y <- NA

for (i in 0:256) {
  x[i] <- i * pi / 32
  y[i] <- i * pi / 32

  lines(sin(x), y)
  lines(cos(x + 5 / 8 * pi / 2), y)
}

x_left <- NA
x_right <- NA
y_center <- NA
line_colors <- c("green", "red", "blue", "orange")

for (i in 0:32) {
  x_left[i] <- cos(i * pi / 4 + 5 / 8 * pi / 2)
  x_right[i] <- sin(i * pi / 4)
  y_center[i] <- i * pi / 4
  random_color <- line_colors[sample.int(4, 1)]
  lines(c(x_right[i], x_left[i]), c(y_center[i], y_center[i]),
    col = random_color
  )
}

dev.off()