#!/bin/sh

# Check number of command line arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: rpdd.sh <fasta> <bed>"
    exit 1
fi

# Collect command line arguments
fasta=$1
bed=$2

# Check files exist
if [ ! -f "$fasta" ]; then
    echo "$fasta does not exist."
    exit 1
fi
if [ ! -f "$bed" ]; then
    echo "$bed does not exist."
    exit 1
fi

echo "Input fasta:   $fasta"
echo "Input regions: $bed"

# Get the sequence in $fasta in the container from regions in $bed in the container
echo "Writing sequence in select regions to $fasta.regions.txt ..."
seqtk subseq $fasta $bed | grep -v "^>" > $fasta.regions.txt

# Run some postprocessing on it and write out to a file
echo "Writing reverse complemented region sequences to $fasta.revcomp.txt ..."
Rscript /src/rpdd.R $fasta.regions.txt > $fasta.revcomp.txt

echo "Done!"
