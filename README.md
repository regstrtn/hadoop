# Crunching last.fm data

Crunch last.fm data to find out artists who have sung the most number of songs using MapReduce paradigm. Program runs on a hadoop cluster. 

### Usage instructions: 
You can still test the code even if you do not have access to a Hadoop cluster. Run as follows: 

`cat lastfm_dataset.csv | ./mapperxx.r | sort ./reducerxx.r`
