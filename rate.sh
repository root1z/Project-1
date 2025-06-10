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
        } else if (char == "," && !in_quotes) {
            field_count++
            if (field_count == 18) {
                if(current_field > 7.5)
                {
                date_field = current_field
                }
            }
            current_field = ""
        } else {
            current_field = current_field char
        }
    }

    if (date_field != "") {
        print date_field "," line
    }
}' tmdb-movies-fixed.csv | (sort -r | cut -d',' -f2-) > rate_movies.csv