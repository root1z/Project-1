awk -F',' 'BEGIN{OFS=","} 
NR==1 {print "formatted_date", $0} 
NR>1 {
    split($(NF-5), d, "/")
    year = (d[3] < 25) ? 2000 + d[3] : 1900 + d[3]
    date_field = sprintf("%04d-%02d-%02d", year, d[2], d[1])
    print date_field, $0
}' tmdb-movies-fixed.csv | (sort -r | cut -d',' -f2-)> sorted_movies.csv