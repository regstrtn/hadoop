#!/usr/bin/env Rscript

#args = commandArgs(trailingOnly = T)
args = c(10)
maxtags = args[1]
input = file("stdin", "r")

anyna = function(fields) {
  for(i in 1:length(fields)) {
    if(is.na(fields[i]) || fields[i]=="") return (1)
  }
  return (0)
}

#df = data.frame(artists = character(), title = character(), id = character(), numtags = numeric(), stringsAsFactors =F)
#artistdf = data.frame(artists = character(), numsongs = numeric(), stringsAsFactors = F)

while(length(line <- readLines(input, n = 1, warn = F))) {
  fields = unlist(strsplit(line, ",", fixed = t))
  if(anyna(fields)) next #Check whether any value is na
  artistlist = fields[1]
  taglist = fields[2]
  title = fields[3]
  songid = fields[4]
  tags = unlist(strsplit(taglist, ";", fixed = T))
  artists = unlist(strsplit(artistlist, ";", fixed = T))
  numtags = length(tags)
  numartists = length(artists)
  for(a in artists) {
    if(numtags> maxtags) cat(a, "\t", title, "\t", numtags, "\n")

    }
}

#Add new song artist combination to the raw database
#     new1 = data.frame(artists = a, title = title, id = songid, numtags = numtags, stringsAsFactors = F)
#     df = rbind(df, new1)
#     #Update numsongs by the artist
#     if(a %in% artistdf$artists) {
#       artistdf[artistdf$artists == a,]$numsongs = artistdf[artistdf$artists == a,]$numsongs+1
#     } 
#     else {
#       new2 = data.frame(artists = a, numsongs = 1, stringsAsFactors = F)
#       artistdf = rbind(artistdf, new2)
#     }
#   }
# }
# 
# df = df[order(-df$numtags),]
# for(i in 1:nrow(df)) {
#   if(df$numtags[i]>maxtags) cat(df$artists[i],"\t", df$title[i], "\t", df$numtags[i],"\n")
# }