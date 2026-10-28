#!/usr/bin/env bash
set -eo pipefail

# --- activate conda environment ---
set +u
source ~/miniforge3/etc/profile.d/conda.sh
conda activate oligotyping                    
set -u
#conda and MED must already be installed
# --- inputs ---
input=("/Users/josiedanckaert/LambMED4/pre_med_padded_samples.fasta")

mval=(568 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 11000 12000 13000 14000 15000 16000 17000 18000 19000 20000 21000 22000 22716 24000 26000 28000 30000 32000 34000 36000 38000 40000 42000 44000 45431)
#these mvals are the minimum substantive abundance values. They are meant to be approximately evenly spaced so as to get sufficient resolution of change in output, while minimising storage used by producing many outputs
#The minimum is M=N*0.0001 as recommended by MED, the midpoint is M=N*0.004 as calculated in SymPortal, and the maximum is M=N*0.008, twice the M as used in SymPortal

echo "============================================================================"
date
echo "cladocopium: $input"

for i in "${!mval[@]}"; do
  output_dir="$(dirname "$input")/output$((i+1))"
  decompose "$input" --skip-check-input -o "$output_dir" -M "${mval[$i]}" --skip-gen-figures
done 
 #decompose is the MED command

echo "complete"
