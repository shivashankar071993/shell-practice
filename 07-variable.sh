#!/bin/bash

#DATE=$(date)

start_date=(date +%s)
end_date=(date +%s)

sleep 10 &

total=$start_date-$end_date
echo "date is executed:" $total
