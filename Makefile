soil_analysis: soil.16s.x.16s.k=32.kmers.out \
	soil.16s.16s.k=20.kmers.out \
	soil.16s.16s.k=20.reads.out \
	soil.16s.16s.k=32.reads.out \
	soil.16s.wgs.k=20.kmers.out \
	soil.16s.wgs.k=32.kmers.out \
	soil.16s.wgs.k=20.reads.out \
	soil.16s.wgs.k=32.reads.out 

soil.16s.x.16s.k=32.kmers.out: soil/C2_16s.fa
	./saturate-by-kmers.py -k 32 soil/C2_16s.fa soil/C2_16s.fa soil.16s.x.16s.k=32.kmers.out

soil.16s.x.16s.k=20.kmers.out:
	./saturate-by-kmers.py -k 20 soil/C2_16s.fa soil/C2_16s.fa soil.16s.x.16s.k=20.kmers.out

soil.16s.x.16s.k=32.reads.out:
	./saturate-by-reads.py -k 32 soil/C2_16s.fa soil/C2_16s.fa soil.16s.x.16s.k=32.reads.out

soil.16s.x.16s.k=20.reads.out:
	./saturate-by-reads.py -k 20 soil/C2_16s.fa soil/C2_16s.fa soil.16s.x.16s.k=20.reads.out

soil.16s.wgs.k=20.kmers.out:
	./saturate-by-kmers.py -k 20 soil/C2_16s.fa soil/C2_wgs.subset.fa soil.16s.wgs.k=20.kmers.out

soil.16s.wgs.k=32.kmers.out:
	./saturate-by-kmers.py -k 32 soil/C2_16s.fa soil/C2_wgs.subset.fa soil.16s.wgs.k=32.kmers.out

soil.16s.wgs.k=20.reads.out:
	./saturate-by-reads.py -k 20 soil/C2_16s.fa soil/C2_wgs.subset.fa soil.16s.wgs.k=20.reads.out

soil.16s.wgs.k=32.reads.out:
	./saturate-by-reads.py -k 32 soil/C2_16s.fa soil/C2_wgs.subset.fa soil.16s.wgs.k=32.reads.out
