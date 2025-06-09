awk '
BEGIN { buffer = ""; in_quote = 0 }
{
    for (i = 1; i <= length($0); i++) {
        if (substr($0, i, 1) == "\"") in_quote = !in_quote
    }
    if (in_quote) {
        buffer = buffer $0 " "
    } else {
        print buffer $0
        buffer = ""
    }
}
END { if (buffer) print buffer }
' tmdb-movies.csv > tmdb-movies-fixed.csv