#! /usr/bin/env python
import screed
import argparse

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('fasta_file')
    parser.add_argument('list_file')

    args = parser.parse_args()
    
    seqs = dict( ((record.name, record.sequence) for record in \
                  screed.open(args.fasta_file)) )
    print 'loaded %d seqs' % len(seqs)

    otu_info = {}
    for line in open(args.list_file):
        x = line.strip().split('\t')
        cutoff = float(x[0])
        num = x[1]

        if cutoff != .03:
            continue

        sizes = []
        cluster_seqs = {}
        for i, cluster in enumerate(x[2:]):
            members = cluster.split(',')
            sizes.append((len(members), i))
            cluster_seqs[i] = members

        print cutoff, num
        sizes.sort(reverse=True)

        for i, (size, index) in enumerate(sizes):
            outfile = '%s.cluster%04d.fa' % (args.list_file, i)
            print 'opening', outfile
            outfp = open(outfile, 'w')
            for seqname in cluster_seqs[index]:
                print >>outfp, ">%s\n%s" % (seqname, seqs[seqname])

if __name__ == '__main__':
    main()
