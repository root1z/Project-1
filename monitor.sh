# Monitor trong khi script chạy
#!/bin/bash
./sort_date.sh &
PID=$!

while kill -0 $PID 2>/dev/null; do
    echo "$(date): CPU $(ps -p $PID -o %cpu= )%, MEM $(ps -p $PID -o %mem= )%"
    sleep 1
done
