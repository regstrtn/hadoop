#!/usr/bin/env Rscript
# wc_reducer.r
#args = commandArgs(trailingOnly = T)
args = c(2)
maxsongs = args[1]
is_first_line = T
df = data.frame(artist = character(), title = character(), stringsAsFactors = F)
env = new.env(hash = T)

input = file("stdin", "r")
while(length(line <- readLines(input, n=1, warn = F))> 0) {
  line = unlist(strsplit(line, "\t", fixed = T))
  if(exists(line[1], envir = env, inherits = F)) {
    v = get(line[1], envir = env)
    v = c(v, line[2])
    assign(line[1], v, envir = env)
  }
  else assign(line[1], line[2], envir = env)
  
  if(!is_first_line && prevartist == line[1]) {
    sum = sum + 1
  }
  else {
    if(!is_first_line) {
      if(sum>= maxsongs) cat(prevartist, get(prevartist, envir = env), "\t", sum, "\n")
    }
    prevartist = line[1]
    sum = 1
    is_first_line = F
  }
}
if(sum>= maxsongs) cat(prevartist, get(prevartist, envir = env), "\t", sum, "\n")
close(input)