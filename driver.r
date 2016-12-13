arg1 = 10
arg2 = 5

#Need to supply arguments along with -mapper and -reducer arguments

runonhadoop = function(mapper, reducer, arg1, arg2) {
  system("hadoop fs -rm -r op1a")
  cat(mapper, reducer, arg1, arg2, sep = " ")
  system(paste("hadoop jar", "/usr/lib/hadoop-mapreduce/hadoop-streaming.jar",
             "-input /user/16CS60R52/d.csv", 
             "-output op1a", 
             "-file mapper1.r", 
             "-mapper", mapper, arg1, 
             "-file reducer1.r", 
             "-reducer", reducer, arg2))

#dir <- system("hadoop fs -ls op1a",intern=TRUE)
#out <- system("hadoop fs -cat part-00000",intern=TRUE)
  system("hadoop fs -cat /user/16CS60R52/op1a/part-*>>/user/16CS60R52/op")
  system("sh get.sh op")
  system("cat op")
}

while(1) {
  qnum = as.integer(readline(prompt = "Enter query number: "))
  mapper = paste("mapper", qnum, ".r", collapse = NULL, sep = "")
  reducer = paste("reducer", qnum, ".r", collapse = NULL, sep = "")
  args = unlist(strsplit(readline("Enter args: "), split = " ", fixed = T))
  arg1 = as.integer(args[1])
  if(qnum!=4) arg2 = as.integer(args[2])
  else arg2 = args[2]
  runonhadoop(mapper, reducer, arg1, arg2)
}