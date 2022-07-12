library(plotrix)

minute_size <- 0.8
hour_size <- 0.5
maintick <- 0.1
subtick <- maintick * 0.5

# png(file = "clock%04d.png", width = 1000, height = 1000)
for (i in 0:4320) {
  degrees <- i
  minutes_rad_degrees <- (degrees - 180) * pi / 180
  hour_rad_degrees <- (degrees - 2160) * pi / 180

  xpos_minutes <- minute_size * -sin(minutes_rad_degrees)
  ypos_minutes <- minute_size * -cos(minutes_rad_degrees)

  xpos_hours <- hour_size * -sin(hour_rad_degrees / 12)
  ypos_hours <- hour_size * -cos(hour_rad_degrees / 12)

  plot(0, 0, pch = 19, bty = "n", axes = F, ann = F,
       asp = 1, xlim = c(-1, 1), ylim = c(-1, 1))
  draw.circle(0, 0, 1, nv = 100)

  lines(c(0, 0), c(1, 1 - maintick))
  lines(c(1, 1 - maintick), c(0, 0))
  lines(c(0, 0), c(-1, -1 + maintick))
  lines(c(-1, -1 + maintick), c(0, 0))

  for (j in 1:12) {
    tick_degrees <- 30 * j - 180
    tick_rad_degrees <- tick_degrees * pi / 180
    lines(c(1 * cos(tick_ang), 1 * cos(tick_ang) - subtick * cos(tick_ang)),
        c(1 * sin(tick_ang), 1 * sin(tick_ang) - subtick * sin(tick_ang)))
  }

  lines(c(0, xpos_minutes), c(0, ypos_minutes))
  lines(c(0, xpos_hours), c(0, ypos_hours))
}

# dev.off()
# system("D:\\ImageMagick-6.9.2-Q16\\convert -delay 16.667 *.png example_1.gif")