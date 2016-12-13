#!/usr/bin/env Rscript
# wc_reducer.r
is_first_line = T

input = file("stdin", "r")
while(length(line <- readLines(input, n=1, warn = F))> 0) {
  line = unlist(strsplit(line, "\t", fixed = T))
  if(!is_first_line && prev_lang == line[1]) {
    sum = sum + as.integer(line[2])
  }
  else {
    if(!is_first_line) {
      cat(prev_lang, "\t", sum, "\n")
    }
    prev_lang = line[1]
    sum = as.integer(line[2])
    is_first_line = F
  }
}
cat(prev_lang, "\t", sum, "\n")
close(input)