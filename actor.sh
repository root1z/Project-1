#!/bin/bash
# awk -F',' '{
#     field_count = 0
#     current_field = ""
#     in_quotes = 0
#     line = $0
#     date_field = ""

#     for (i = 1; i <= length($0); i++) {
#         char = substr($0, i, 1)
#         if (char == "\"") {
#             in_quotes = !in_quotes
#         } else if (char == "," && !in_quotes) {
#             field_count++
#             if (field_count == 7) {
#                 split(current_field, actors, "|")
#                 for (i in actors) {
#                     print actors[i]
#                 }
#             }
#             current_field = ""
#         } else {
#             current_field = current_field char
#         }
#     }

#     if (date_field != "") {
#         print date_field "," line
#     }
# }' tmdb-movies-fixed.csv | (head -n1; tail -n+2 | sort -r | cut -d',' -f2-) > actor_movies.csv

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
            if (field_count == 7) {
                split(current_field, actors, "|")
                for (i in actors) {
                    print actors[i]
                }
            }
            current_field = ""
        } else {
            current_field = current_field char
        }
    }
}' tmdb-movies-fixed.csv | sort | uniq -c | sort -nr > actor_count.csv