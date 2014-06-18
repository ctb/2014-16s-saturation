all: soil_analysis podar_analysis

soil_analysis: soil.16s.x.16s.k32.kmers.out \
	soil.16s.x.16s.k20.kmers.out \
	soil.16s.x.16s.k20.reads.out \
	soil.16s.x.16s.k32.reads.out \
	soil.16s.x.wgs.k20.kmers.out \
	soil.16s.x.wgs.k32.kmers.out \
	soil.16s.x.wgs.k20.reads.out \
	soil.16s.x.wgs.k32.reads.out 

soil.16s.x.16s.k32.kmers.out:
	./saturate-by-kmers.py -k 32 soil/C2_16s.fa soil/C2_16s.fa soil.16s.x.16s.k32.kmers.out

soil.16s.x.16s.k20.kmers.out:
	./saturate-by-kmers.py -k 20 soil/C2_16s.fa soil/C2_16s.fa soil.16s.x.16s.k20.kmers.out

soil.16s.x.16s.k32.reads.out:
	./saturate-by-reads.py -k 32 soil/C2_16s.fa soil/C2_16s.fa soil.16s.x.16s.k32.reads.out

soil.16s.x.16s.k20.reads.out:
	./saturate-by-reads.py -k 20 soil/C2_16s.fa soil/C2_16s.fa soil.16s.x.16s.k20.reads.out

soil.16s.x.wgs.k20.kmers.out:
	./saturate-by-kmers.py -k 20 soil/C2_16s.fa soil/C2_wgs.subset.fa soil.16s.x.wgs.k20.kmers.out

soil.16s.x.wgs.k32.kmers.out:
	./saturate-by-kmers.py -k 32 soil/C2_16s.fa soil/C2_wgs.subset.fa soil.16s.x.wgs.k32.kmers.out

soil.16s.x.wgs.k20.reads.out:
	./saturate-by-reads.py -k 20 soil/C2_16s.fa soil/C2_wgs.subset.fa soil.16s.x.wgs.k20.reads.out

soil.16s.x.wgs.k32.reads.out:
	./saturate-by-reads.py -k 32 soil/C2_16s.fa soil/C2_wgs.subset.fa soil.16s.x.wgs.k32.reads.out

podar_analysis: podar.16s.x.16s.k32.kmers.out \
	podar.16s.x.16s.k20.kmers.out \
	podar.16s.x.16s.k20.reads.out \
	podar.16s.x.16s.k32.reads.out \
	podar.16s.x.wgs.k20.kmers.out \
	podar.16s.x.wgs.k32.kmers.out \
	podar.16s.x.wgs.k20.reads.out \
	podar.16s.x.wgs.k32.reads.out 


podar.16s.x.16s.k32.kmers.out:
	./saturate-by-kmers.py -k 32 podar/SRR606370.fastq.gz podar/SRR606370.fastq.gz podar.16s.x.16s.k32.kmers.out

podar.16s.x.16s.k20.kmers.out:
	./saturate-by-kmers.py -k 20 podar/SRR606370.fastq.gz podar/SRR606370.fastq.gz podar.16s.x.16s.k20.kmers.out

podar.16s.x.16s.k32.reads.out:
	./saturate-by-reads.py -k 32 podar/SRR606370.fastq.gz podar/SRR606370.fastq.gz podar.16s.x.16s.k32.reads.out

podar.16s.x.16s.k20.reads.out:
	./saturate-by-reads.py -k 20 podar/SRR606370.fastq.gz podar/SRR606370.fastq.gz podar.16s.x.16s.k20.reads.out

podar.16s.x.wgs.k20.kmers.out:
	./saturate-by-kmers.py -k 20 podar/SRR606370.fastq.gz podar/SRR606249_1.fastq.gz podar.16s.x.wgs.k20.kmers.out

podar.16s.x.wgs.k32.kmers.out:
	./saturate-by-kmers.py -k 32 podar/SRR606370.fastq.gz podar/SRR606249_1.fastq.gz podar.16s.x.wgs.k32.kmers.out

podar.16s.x.wgs.k20.reads.out:
	./saturate-by-reads.py -k 20 podar/SRR606370.fastq.gz podar/SRR606249_1.fastq.gz podar.16s.x.wgs.k20.reads.out

podar.16s.x.wgs.k32.reads.out:
	./saturate-by-reads.py -k 32 podar/SRR606370.fastq.gz podar/SRR606249_1.fastq.gz podar.16s.x.wgs.k32.reads.out
