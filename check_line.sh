#!/bin/bash

# Đọc toàn bộ file vào memory và xử lý
sed '
:start
# Nếu có quote lẻ (không thành cặp)
/^[^"]*"[^"]*"[^"]*$/!{
    # Nếu chưa hết file, đọc dòng tiếp theo
    N
    # Thay newline trong quote bằng space
    s/\n/ /
    # Lặp lại
    b start
}
' tmdb-movies.csv > temp_sed.csv

# Lọc field
awk -F',' 'NF >= 21' temp_sed.csv > movies_sed_fixed.csv

rm temp_sed.csv
echo "Hoàn thành với sed!"