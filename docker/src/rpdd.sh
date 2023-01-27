#!/bin/ash

fa=$1
bed=$2

# Get the sequence in $fa in the container from regions in $bed in the container
seqtk subseq $fa $bed | grep -v "^>" > /tmp/subseq

# Run some postprocessing on it and write out to a file
Rscript -e "readLines('/tmp/subseq') |> rpdd::missyelliot() |> writeLines('$fa.revcomp.txt')"
