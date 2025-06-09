#!/bin/bash
awk -F',' '{
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
            if (field_count == 14) {
                split(current_field, genres, "|")
                for (i in genres) {
                    print genres[i]
                }
            }
            current_field = ""
        } else {
            current_field = current_field char
        }
    }
}' tmdb-movies-fixed.csv | sort | uniq -c | sort -nr > genres_count.csv