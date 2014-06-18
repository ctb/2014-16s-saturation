#! /usr/bin/env python
"""
collect all k-mers in rrna with counts > 2 and < 10;

for each wgs read, record what fraction of those k-mers have shown up so far.
"""

import khmer
import sys
import screed
import argparse

DEFAULT_K=32

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-k', '--ksize', type=int, default=DEFAULT_K)
    parser.add_argument('-s', '--sampling-rate', type=int, default=10000)
    parser.add_argument('-M', '--max-reads', type=int, default=None)
    parser.add_argument('rrna_file')
    parser.add_argument('reads_file')
    parser.add_argument('output')
    
    args = parser.parse_args()

    K = args.ksize
    rrna_file = args.rrna_file
    reads_file = args.reads_file
    output = args.output

    print 'reading', rrna_file
    ht = khmer.new_counting_hash(K, 1e8)
    ht.consume_fasta(rrna_file)

    print 'iterating over kmers'
    unique_kmers = set()
    for record in screed.open(rrna_file):
        seq = record.sequence
        for i in range(len(seq) - K + 1):
            kmer = seq[i:i+K]
            count = ht.get(kmer)
            if count > 1 and count < 10:
                unique_kmers.add(kmer)

    print len(unique_kmers), 'unique kmers'

    ###

    fp = open(output, 'w')
    ht = khmer.new_counting_hash(K, 1e10)
    total_bp = 0
    for n, record in enumerate(screed.open(reads_file)):
        ht.consume(record.sequence)
        total_bp += len(record.sequence)

        if n % args.sampling_rate == 0:
            if args.max_reads and n > args.max_reads:
                break
            i = 0
            for kmer in unique_kmers:
                if ht.get(kmer) > 0:
                    i += 1

            print '...', n, total_bp, i, float(i) / float(len(unique_kmers)) * 100.
            print >>fp, n, total_bp, i, float(i) / float(len(unique_kmers)) * 100.

if __name__ == '__main__':
    main()
