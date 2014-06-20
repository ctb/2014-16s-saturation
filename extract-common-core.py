#! /usr/bin/env python
import sys
import khmer
import argparse
import gzip
import screed
import os

K=20
HT_SIZE=8e9
N_HT=4

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('inputs', nargs='+')

    args = parser.parse_args()

    kh = khmer.new_hashbits(K, HT_SIZE, N_HT)

    print 'consuming last file'
    kh.consume_fasta(args.inputs[-1])

    for index in range(len(args.inputs)):
        kh2 = khmer.new_hashbits(K, HT_SIZE, N_HT)
        this_file = args.inputs[index]

        kept = 0
        for n, read in enumerate(screed.open(this_file)):
            if n % 100000 == 0:
                print '... 1', this_file, n, kept

            med, _, _ = kh.get_median_count(read.sequence)
            if med > 0:
                kh2.consume(read.sequence)
                kept += 1

        kh = kh2

    for inpfile in args.inputs:
        outfilename = os.path.basename(inpfile) + '.common.fq'
        outfp = gzip.open(outfilename, 'w')
        
        kept = 0
        for n, read in enumerate(screed.open(inpfile)):
            if n % 10000 == 0:
                print '... 2', inpfile, n, kept
            
            med, _, _ = kh.get_median_count(read.sequence)
            if med > 0:
                kept += 1
                outfp.write('@%s\n%s\n+\n%s\n' % (read.name,
                                                  read.sequence,
                                                  read.accuracy))

if __name__ == '__main__':
    main()
