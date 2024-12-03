#!/bin/bash

base_order_id="LTENMRS24120207-A00"
start_index=0 # Set your desired starting index here
# Generate 10 unique requests
for i in $(seq 1 10); do
  # order_id="${base_order_id}${i}"
  fileData="data$((start_index + i)).json"
  echo "" > $fileData
  order_id="${base_order_id}$((start_index + i))"
  body=$(cat <<EOF
{
    "orders": [
        {
            "order_id": "${order_id}",
        }
    ],
    "total_count": 1
}
EOF
) 
  echo -e "\n$body\n" >> $fileData
done

# Run Vegeta

