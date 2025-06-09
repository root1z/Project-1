#view the size of the file
du -h tmdb-movies.csv

#show the number of lines in the file
wc -l tmdb-movies.csv

#show the first line of the file and number the fields
head -n 1 tmdb-movies.csv | tr ',' '\n' | nl


# Find lines in a CSV file that have unmatched quotes
grep -n ',"[^"]*$' tmdb-movies.csv

#min max
awk -F',' 'NR>1 {gsub(/\./, "", $NF); print $NF}' tmdb-movies-fixed.csv | sort -n | tail -1

#total 
awk -F',' 'NR>1 {gsub(/\./, "", $NF); sum += $NF} END {print "Total revenue:", sum}' tmdb-movies.csv


awk -F',' 'NR>1 {gsub(/\./, "", $(NF-1)); gsub(/\./, "", $NF); profit = $NF - $(NF-1); print profit, $6}' tmdb-movies-fixed.csv | sort -nr | head -10