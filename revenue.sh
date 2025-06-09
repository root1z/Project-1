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
            if (field_count == 20) {
                date_field = current_field
                break
            }
            current_field = ""
        } else {
            current_field = current_field char
        }
    }

    if (field_count >= 20) {
        print date_field "," line
    }
}' tmdb-movies.csv | (head -n1; tail -n+2 | sort -r | cut -d',' -f2-) > revenue_movies.csv