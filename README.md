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

The script will:
1. Read the input file `tmdb-movies.csv`
2. Process and sort the data
3. Output the sorted results to `sorted_movies.csv`

## How It Works

1. **Header Preservation**: The first line (header) is preserved and not included in the sorting process
2. **Date Processing**: 
   - Identifies the date field (field 16)
   - Converts dates from MM/DD/YY to YYYY-MM-DD
   - Handles year conversion (YY < 25 → 20YY, YY ≥ 25 → 19YY)
3. **CSV Parsing**:
   - Properly handles quoted fields
   - Maintains field integrity
4. **Sorting**:
   - Sorts all data rows based on the converted date
   - Preserves all original fields

## Input Format

The script expects a CSV file with:
- Comma-separated values
- Optional quoted fields
- Date in MM/DD/YY format in field 16

## Output Format

The output will be a CSV file with:
- Original header row
- Sorted data rows (descending order by date)
- All original fields preserved
- Dates converted to YYYY-MM-DD format

## Example

Input (field 16):
```
12/25/23
```

Output (field 16):
```
2023-12-25
```