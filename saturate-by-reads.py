#! /usr/bin/env python
"""
for each rrna read, collect k-mers with counts > 2 and < 10;

then, for each wgs read, ask how many k-mers show up once. if it's more
than 80%, declare that the read was found.
"""
import khmer
import sys
import screed
import argparse

DEFAULT_K=32

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-k', '--ksize', type=int, default=DEFAULT_K)
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

    x = []

    for record in screed.open(rrna_file):
        unique_kmers = set()

        seq = record.sequence
        for i in range(len(seq) - K + 1):
            kmer = seq[i:i+K]
            count = ht.get(kmer)
            if count > 1 and count < 10:
                unique_kmers.add(kmer)

        x.append(unique_kmers)

    print len(x), 'reads'

    ###

    fp = open(output, 'w')
    ht = khmer.new_counting_hash(K, 1e8)
    total_bp = 0
    for n, record in enumerate(screed.open(reads_file)):
        ht.consume(record.sequence)
        total_bp += len(record.sequence)

        if n > 0 and n % 1000 == 0:
            if n > 50:
                break
            j = 0
            for readset in x:
                i = 0
                for kmer in readset:
                    if ht.get(kmer) > 0:
                        i += 1

                if float(i) > 0.8*float(len(readset)):
                    j += 1

            print '...', n, total_bp, j, float(j) / float(len(x)) * 100
            print >>fp, n, total_bp, j, float(j) / float(len(x)) * 100

if __name__ == '__main__':
    main()
