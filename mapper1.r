#!/usr/bin/env Rscript
# wc_mapper.r
#args = commandArgs(trailingOnly = T)
args = c(10)
input = file("stdin", "r")
df = data.frame(title = character(), id = character(), numtags = numeric(), stringsAsFactors =F)
anyna = function(fields) {
  for(i in 1:length(fields)) {
    if(is.na(fields[i]) || fields[i]=="") return (1)
  }
  return (0)
}


while(length(line <- readLines(input, n = 1, warn = F))) {
  fields = unlist(strsplit(line, ",", fixed = T))
  if(anyna(fields)) next #Check whether any value is na
  artistlist = fields[1]
  taglist = fields[2]
  title = fields[3]
  songid = fields[4]
  tags = unlist(strsplit(taglist, ";", fixed = T))
  artists = unlist(strsplit(artistlist, ";", fixed = T))
  numtags = length(tags)
  numartists = length(artists)
  if(numtags>args[1]) cat(title, "\t", songid, "\t", numtags, "\n")
}
#  newrow = data.frame(title = title, id = songid, numtags = numtags, stringsAsFactors = F)
#  df = rbind(df, newrow)
#df = df[order(-df$numtags),]
#for(i in 1:nrow(df)) {
#  if(df$numtags[i]>args[1]) cat(df$title[i],"\t", df$id[i],"\t", df$numtags[i],"\n")
#}
