#!/bin/bash

#DATE=$(date)

start_date=$(date +%s)

sleep 10 &

end_date=$(date +%s)

total=$($end_date-$start_date)

echo "date is executed:" $total
