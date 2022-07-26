folder <- "data/"
csv_separator <- ","
txt_separator <- "\t"
input_decimal <- "."
output_decimal <- ","
na_strings <- "NA"

csv_files <- list.files(path = folder, pattern = "csv")
filenames <- sub(".csv", "", csv_files)

for (i in 1:length(filenames)) {
  input_data <- read.csv(paste0(folder, csv_files[i]),
    sep = csv_separator, header = T, dec = input_decimal,
    na.strings = na_strings, check.names = FALSE
  )
  write.table(input_data[, seq_along(input_data) - 1],
    file = paste0(folder, filenames[i], ".txt"),
    sep = txt_separator, dec = output_decimal, row.names = FALSE
  )
}
