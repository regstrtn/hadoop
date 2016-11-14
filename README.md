# Crunching last.fm data

Crunch last.fm data to find out artists who have sung the most number of songs using MapReduce paradigm. Program runs on a hadoop cluster. 

### Usage instructions: 
You can still test the code even if you do not have access to a Hadoop cluster. Run as follows: 

Make mapper and reducer executable
`chmod a+x mapper.R`
`chmod a+x reducer.R`

Run mapper and reducer on input data file
`cat lastfm_dataset.csv | ./mapperxx.r | sort ./reducerxx.r`

Do go through the wordcount_example/instructions.txt file in case of any confusion.
