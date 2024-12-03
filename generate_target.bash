#!/bin/bash

vegeta_targets="targets.txt"
echo "" > $vegeta_targets
start_index=0 # Set your desired starting index here
# Generate 10 unique requests
for i in $(seq 1 10); do
  order_id="${base_order_id}$((start_index + i))"
  
  echo "POST http://localhost:5001/api/tms3PLOrder/v2/Mirakl" >> $vegeta_targets
  echo "Authorization: Bearer dae355f3-3201-480c-8c11-afd648f29446" >> $vegeta_targets
  echo "Content-Type: application/json" >> $vegeta_targets
  echo -e "@data$((start_index + i)).json\n" >> $vegeta_targets
done

# Run Vegeta

