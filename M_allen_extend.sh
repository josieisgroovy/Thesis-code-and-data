#!/usr/bin/env bash
set -eo pipefail

# --- activate conda environment ---
set +u
source ~/miniforge3/etc/profile.d/conda.sh
conda activate oligotyping                    
set -u

# --- inputs ---
input=("/Users/josiedanckaert/AllenMED4/samples.fasta")

mval=(145 500 1000 1500 2000 2500 3000 3500 4000 4500 5000 5500 5794 6000 7000 8000 9000 10000 11000 11588)

echo "============================================================================"
date
echo "horse: $input"

for i in "${!mval[@]}"; do
  output_dir="$(dirname "$input")/output$((i+1))"
  decompose "$input" --skip-check-input -o "$output_dir" -M "${mval[$i]}" --skip-gen-figures
done 
 

echo "horse 1 complete"