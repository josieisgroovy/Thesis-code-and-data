#!/usr/bin/env bash
set -eo pipefail

# --- activate conda environment ---
set +u
source ~/miniforge3/etc/profile.d/conda.sh
conda activate oligotyping                    
set -u

# --- inputs ---
input=("/Users/josiedanckaert/LambMED4/pre_med_padded_samples.fasta")

mval=(568 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 11000 12000 13000 14000 15000 16000 17000 18000 19000 20000 21000 22000 22716 24000 26000 28000 30000 32000 34000 36000 38000 40000 42000 44000 45431)

echo "============================================================================"
date
echo "horse: $input"

for i in "${!mval[@]}"; do
  output_dir="$(dirname "$input")/output$((i+1))"
  decompose "$input" --skip-check-input -o "$output_dir" -M "${mval[$i]}" --skip-gen-figures
done 
 

echo "horse 1 complete"