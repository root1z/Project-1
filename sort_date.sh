#!/bin/bash
awk -F',' '{
    if (NR == 1) {
        print $0
        next
    }
    field_count = 0
    current_field = ""
    in_quotes = 0
    line = $0
    date_field = ""

    for (i = 1; i <= length($0); i++) {
        char = substr($0, i, 1)
        if (char == "\"") {
            in_quotes = !in_quotes
        } else if (char == "," && in_quotes == 0) {
            field_count++
            if (field_count == 16) {
                split(current_field, d, "/")
                year = (d[3] < 25) ? 2000 + d[3] : 1900 + d[3]
                date_field = sprintf("%04d-%02d-%02d", year, d[2], d[1])
            }
            current_field = ""
        } else {
            current_field = current_field char
        }
    }

    if (date_field != "") {
        print date_field "," line
    }
}' tmdb-movies.csv | (head -n1; tail -n+2 | sort -r | cut -d',' -f2-) > sorted_movies.csv