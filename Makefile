all: soil_analysis podar_analysis

soil_analysis: soil.16s.x.16s.k32.kmers.out \
	soil.16s.x.16s.k20.kmers.out \
	soil.16s.x.16s.k20.reads.out \
	soil.16s.x.16s.k32.reads.out \
	soil.16s.x.wgs.k20.kmers.out \
	soil.16s.x.wgs.k32.kmers.out \
	soil.16s.x.wgs.k20.reads.out \
	soil.16s.x.wgs.k32.reads.out 

podar_analysis: podar.16s.x.16s.k32.kmers.out \
	podar.16s.x.16s.k20.kmers.out \
	podar.16s.x.16s.k20.reads.out \
	podar.16s.x.16s.k32.reads.out \
	podar.16s.x.wgs.k20.kmers.out \
	podar.16s.x.wgs.k32.kmers.out \
	podar.16s.x.wgs.k20.reads.out \
	podar.16s.x.wgs.k32.reads.out \
	SRR606249_1.fastq.gz.keep.fq \
	SRR606249_2.fastq.gz.keep \
	podar.16s.x.ref.kmers.out

soil.16s.x.16s.k32.kmers.out:
	./saturate-by-kmers.py -k 32 soil/C2_16s.fa soil/C2_16s.fa soil.16s.x.16s.k32.kmers.out

soil.16s.x.16s.k20.kmers.out:
	./saturate-by-kmers.py -k 20 soil/C2_16s.fa soil/C2_16s.fa soil.16s.x.16s.k20.kmers.out

soil.16s.x.16s.k32.reads.out:
	./saturate-by-reads.py -k 32 soil/C2_16s.fa soil/C2_16s.fa soil.16s.x.16s.k32.reads.out

soil.16s.x.16s.k20.reads.out:
	./saturate-by-reads.py -k 20 soil/C2_16s.fa soil/C2_16s.fa soil.16s.x.16s.k20.reads.out

soil.16s.x.wgs.k20.kmers.out:
	./saturate-by-kmers.py -k 20 -s 1000000 soil/C2_16s.fa soil/C2_wgs.subset.fa soil.16s.x.wgs.k20.kmers.out

soil.16s.x.wgs.k32.kmers.out:
	./saturate-by-kmers.py -k 32 -s 1000000 soil/C2_16s.fa soil/C2_wgs.subset.fa soil.16s.x.wgs.k32.kmers.out

soil.16s.x.wgs.k20.reads.out:
	./saturate-by-reads.py -k 20 -s 1000000 soil/C2_16s.fa soil/C2_wgs.subset.fa soil.16s.x.wgs.k20.reads.out

soil.16s.x.wgs.k32.reads.out:
	./saturate-by-reads.py -k 32 -s 1000000 soil/C2_16s.fa soil/C2_wgs.subset.fa soil.16s.x.wgs.k32.reads.out

SRR606249_1.fastq.gz.keep.fq: podar/SRR606249_1.fastq.gz
	normalize-by-median.py -C 10 -k 20 -x 2e9 -N 4 podar/SRR606249_1.fastq.gz
	mv SRR606249_1.fastq.gz.keep SRR606249_1.fastq.gz.keep.fq

SRR606249_2.fastq.gz.keep: SRR606249_1.fastq.gz.keep.fq
	normalize-by-median.py -C 10 -k 20 -x 2e9 -N 4 SRR606249_1.fastq.gz.keep.fq podar/SRR606249_2.fastq.gz

podar.16s.x.16s.k32.kmers.out:
	./saturate-by-kmers.py -k 32 -s 1000 podar/SRR606370.fastq.gz podar/SRR606370.fastq.gz podar.16s.x.16s.k32.kmers.out

podar.16s.x.16s.k20.kmers.out:
	./saturate-by-kmers.py -k 20 -s 1000 podar/SRR606370.fastq.gz podar/SRR606370.fastq.gz podar.16s.x.16s.k20.kmers.out

podar.16s.x.16s.k32.reads.out:
	./saturate-by-reads.py -k 32 -s 1000 podar/SRR606370.fastq.gz podar/SRR606370.fastq.gz podar.16s.x.16s.k32.reads.out

podar.16s.x.16s.k20.reads.out:
	./saturate-by-reads.py -k 20 -s 1000 podar/SRR606370.fastq.gz podar/SRR606370.fastq.gz podar.16s.x.16s.k20.reads.out

podar.16s.x.wgs.k20.kmers.out:
	./saturate-by-kmers.py -k 20 -s 1000000 podar/SRR606370.fastq.gz podar/SRR606249_1.fastq.gz podar.16s.x.wgs.k20.kmers.out

podar.16s.x.wgs.k32.kmers.out:
	./saturate-by-kmers.py -k 32 -s 1000000 podar/SRR606370.fastq.gz podar/SRR606249_1.fastq.gz podar.16s.x.wgs.k32.kmers.out

podar.16s.x.wgs.k20.reads.out:
	./saturate-by-reads.py -k 20 -s 1000000 podar/SRR606370.fastq.gz podar/SRR606249_1.fastq.gz podar.16s.x.wgs.k20.reads.out

podar.16s.x.wgs.k32.reads.out:
	./saturate-by-reads.py -k 32 -s 1000000 podar/SRR606370.fastq.gz podar/SRR606249_1.fastq.gz podar.16s.x.wgs.k32.reads.out

podar.16s.x.ref.kmers.out: podar/all.fa
	./saturate-by-kmers.py -k 20 -s 1 podar/SRR606370.fastq.gz podar/all.fa podar.16s.x.ref.kmers.out
