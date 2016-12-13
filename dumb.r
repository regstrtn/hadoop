#!/usr/bin/env Rscript
args = commandArgs(trailingOnly = T)
arg1 = args[1]
arg2 = args[2]

system("hadoop fs -rm -r op1a")
mapper = "mapper1.r"
reducer = "reducer1.r"
cat(mapper, reducer, arg1, arg2, sep = " ")
system(paste("hadoop jar", "/usr/lib/hadoop-mapreduce/hadoop-streaming.jar",
               "-input /user/16CS60R52/d.csv", 
               "-output op1a", 
               "-file 'mapper1.r 5'", 
               "-mapper mapper1.r", 
               "-file reducer1.r", 
               "-reducer 'reducer1.r 5'"))
  
  #dir <- system("hadoop fs -ls op1a",intern=TRUE)
  #out <- system("hadoop fs -cat part-00000",intern=TRUE)
system("hadoop fs -cat /user/16CS60R52/op1a/part-*>>/user/16CS60R52/op")
system("sh get.sh /user/16CS60R52/op .")
system("cat op")
