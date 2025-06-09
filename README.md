## Description

Dữ liệu trên đang được đặt trên Linux server, cần team Data Engineer sử dụng command line Linux hỗ trợ các tác vụ sau để có các thông tin cơ bản về dữ liệu

1. Sắp xếp các bộ phim theo ngày phát hành giảm dần rồi lưu ra một file mới
2. Lọc ra các bộ phim có đánh giá trung bình trên 7.5 rồi lưu ra một file mới
3. Tìm ra phim nào có doanh thu cao nhất và doanh thu thấp nhất
4. Tính tổng doanh thu tất cả các bộ phim
5. Top 10 bộ phim đem về lợi nhuận cao nhất
6. Đạo diễn nào có nhiều bộ phim nhất và diễn viên nào đóng nhiều phim nhất
7. Thống kê số lượng phim theo các thể loại. Ví dụ có bao nhiêu phim thuộc thể loại Action, bao nhiêu thuộc thể loại Family, ….
8. Idea của bạn để có thêm những phân tích cho dữ liệu?


## Usage
Gom các dòng line break lại với nhau
```bash
./data_format.sh
```

Sắp xếp các bộ phim theo ngày phát hành giảm dần rồi lưu ra một file mới
```bash
./sort_date.sh
```

Lọc ra các bộ phim có đánh giá trung bình trên 7.5 rồi lưu ra một file mới
```bash
./rate.sh
```

Tìm ra phim nào có doanh thu cao nhất và doanh thu thấp nhất
```bash
awk -F',' 'NR>1 {gsub(/\./, "", $NF); print $NF}' tmdb-movies-fixed.csv | sort -n | tail -1
```

Tìm ra phim nào có doanh thu thấp nhất
```bash
awk -F',' 'NR>1 {gsub(/\./, "", $NF); print $NF}' tmdb-movies-fixed.csv | sort -n | head -1
```

Tính tổng doanh thu tất cả các bộ phim
```bash
awk -F',' 'NR>1 {gsub(/\./, "", $NF); sum += $NF} END {print "Total revenue:", sum}' tmdb-movies.csv
```

Top 10 bộ phim đem về lợi nhuận cao nhất
```bash
awk -F',' 'NR>1 {gsub(/\./, "", $(NF-1)); gsub(/\./, "", $NF); profit = $NF - $(NF-1); print profit, $6}' tmdb-movies-fixed.csv | sort -nr | head -10
```

Diễn viên nào đóng nhiều phim nhất
```bash
./actor.sh
```

Đạo diễn nào có nhiều bộ phim nhất
```bash
./director.sh
```

Thống kê số lượng phim theo các thể loại. Ví dụ có bao nhiêu phim thuộc thể loại Action, bao nhiêu thuộc thể loại Family, ….
```bash
./genres.sh
```