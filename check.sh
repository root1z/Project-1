#view the size of the file
du -h tmdb-movies.csv

#show the number of lines in the file
wc -l tmdb-movies.csv

#show the first line of the file and number the fields
head -n 1 tmdb-movies.csv | tr ',' '\n' | nl