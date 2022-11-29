#!/bin/ash

INSEQ="GATTACAATTAC"

Rscript -e "cat(rpdd::missyelliot('${INSEQ}'), sep='\n')"

