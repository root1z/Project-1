#!/bin/bash
# awk '
# BEGIN { FS=OFS="," }
# {
#     if (/"[^"]*$/ && !/^[^"]*"[^"]*"[^"]*$/) {
#         line = $0
#         while ((getline nextline) > 0) {
#             line = line " " nextline
#             if (nextline ~ /"/) break
#         }
#         $0 = line
#     }
#     gsub(/\n/, " ", $0)
#     print
# }' tmdb-movies.csv > tmdb11-movies.csv
# gawk -v RS='"' -v FS=',' -v OFS=',' '
# BEGIN { ORS="\"" }
# {
#     if (NR % 2 == 0) {
#         # Process fields within quotes
#         for (i = 1; i <= NF; i++) {
#             gsub(/\r?\n/, " ", $i);
#             gsub(/^[ \t]+|[ \t]+$/, "", $i);  # Trim leading/trailing whitespace
#         }
#         print $0;
#     } else {
#         # Process fields outside quotes
#         print $0;
#     }
# }' tmdb-movies.csv > output.csv

grep -n ',"[^"]*$' tmdb-movies.csv | cut -d: -f1 | while read line; do done