all: soil_analysis podar_analysis beetle

soil_analysis: soil.16s.x.16s.k32.kmers.out \
	soil.16s.x.16s.k20.kmers.out \
	soil.16s.x.16s.k20.reads.out \
	soil.16s.x.16s.k32.reads.out \
	soil.16s.x.wgs.k20.kmers.m2.out \
	soil.16s.x.wgs.k20.kmers.m10.out \
	soil.16s.x.wgs.k20.kmers.m20.out \
	soil.16s.x.wgs.k20.kmers.m40.out \
	soil.16s.x.wgs.k20.kmers.m5.out \
	soil.16s.x.wgs.k32.kmers.out \
	soil.16s.x.wgs.k20.reads.out \
	soil.16s.x.wgs.k32.reads.out 

podar_analysis: podar.16s.x.16s.k32.kmers.out \
	podar.16s.x.16s.k20.kmers.out \
	podar.16s.x.16s.k20.reads.out \
	podar.16s.x.16s.k32.reads.out \
	podar.16s.x.wgs.k32.kmers.out \
	podar.16s.x.wgs.k20.reads.out \
	podar.16s.x.wgs.k32.reads.out \
	SRR606249_1.fastq.gz.keep \
	podar.16s.x.ref.kmers.out \
	podar.16s.x.sim.kmers.out \
	podar_16s.hist \
	podar.16s.x.wgs.k20.kmers.m2.out \
	podar.16s.x.wgs.k20.kmers.m10.out \
	podar.16s.x.wgs.k20.kmers.m5.out \
	podar.16s.x.wgs.k20.kmers.m40.out \
	podar.16s.x.wgs.k20.kmers.m20.out \
	podar.16s.x.sim.k20.kmers.m2.out \
	podar.16s.x.sim.k20.kmers.m10.out \
	podar.16s.x.sim.k20.kmers.m5.out \
	podar.16s.x.sim.k20.kmers.m40.out \
	podar.16s.x.sim.k20.kmers.m20.out \
	podar.v4arch.x.wgs.k20.kmers.m20.out \
	podar.v69.x.wgs.k20.kmers.m20.out \
	podar.v13.x.wgs.k20.kmers.m20.out \
	podar.contam.fa \
	podar.16s.x.contam.k20.kmers.m20.out \
	podar.c01.x.wgs.k20.kmers.m20.out \
	podar.c02.x.wgs.k20.kmers.m20.out \
	podar.c03.x.wgs.k20.kmers.m20.out \
	podar.c04.x.wgs.k20.kmers.m20.out \
	podar.c05.x.wgs.k20.kmers.m20.out

soil.16s.x.16s.k32.kmers.out:
	./saturate-by-kmers.py -k 32 soil/C2_16s.fa.gz soil/C2_16s.fa.gz soil.16s.x.16s.k32.kmers.out

soil.16s.x.16s.k20.kmers.out:
	./saturate-by-kmers.py -k 20 soil/C2_16s.fa.gz soil/C2_16s.fa.gz soil.16s.x.16s.k20.kmers.out

soil.16s.x.16s.k32.reads.out:
	./saturate-by-reads.py -k 32 soil/C2_16s.fa.gz soil/C2_16s.fa.gz soil.16s.x.16s.k32.reads.out

soil.16s.x.16s.k20.reads.out:
	./saturate-by-reads.py -k 20 soil/C2_16s.fa.gz soil/C2_16s.fa.gz soil.16s.x.16s.k20.reads.out

soil.16s.x.wgs.k20.kmers.m40.out:
	./saturate-by-kmers.py -k 20 -m 40 -s 1000000 -M 20000000 soil/C2_16s.fa.gz soil/C2_wgs.subset.fa.gz soil.16s.x.wgs.k20.kmers.m40.out

soil.16s.x.wgs.k20.kmers.m20.out:
	./saturate-by-kmers.py -k 20 -m 20 -s 1000000 -M 20000000 soil/C2_16s.fa.gz soil/C2_wgs.subset.fa.gz soil.16s.x.wgs.k20.kmers.m20.out

soil.16s.x.wgs.k20.kmers.m10.out:
	./saturate-by-kmers.py -k 20 -m 10 -s 1000000 -M 20000000 soil/C2_16s.fa.gz soil/C2_wgs.subset.fa.gz soil.16s.x.wgs.k20.kmers.m10.out

soil.16s.x.wgs.k20.kmers.m5.out:
	./saturate-by-kmers.py -k 20 -m 5 -s 1000000 -M 20000000 soil/C2_16s.fa.gz soil/C2_wgs.subset.fa.gz soil.16s.x.wgs.k20.kmers.m5.out

soil.16s.x.wgs.k20.kmers.m2.out:
	./saturate-by-kmers.py -k 20 -m 2 -s 1000000 -M 20000000 soil/C2_16s.fa.gz soil/C2_wgs.subset.fa.gz soil.16s.x.wgs.k20.kmers.m2.out

soil.16s.x.wgs.k32.kmers.out:
	./saturate-by-kmers.py -k 32 -s 1000000 soil/C2_16s.fa.gz soil/C2_wgs.subset.fa.gz soil.16s.x.wgs.k32.kmers.out

soil.16s.x.wgs.k20.reads.out:
	./saturate-by-reads.py -k 20 -s 1000000 soil/C2_16s.fa.gz soil/C2_wgs.subset.fa.gz soil.16s.x.wgs.k20.reads.out

soil.16s.x.wgs.k32.reads.out:
	./saturate-by-reads.py -k 32 -s 1000000 soil/C2_16s.fa.gz soil/C2_wgs.subset.fa.gz soil.16s.x.wgs.k32.reads.out

SRR606249_1.fastq.gz.keep: podar/SRR606249_1.fastq.gz
	normalize-by-median.py -C 10 -k 20 -x 2e9 -N 4 podar/SRR606249_1.fastq.gz podar/SRR606249_2.fastq.gz -R podar.wgs.report

podar.wgs.C1.report: podar/SRR606249_1.fastq.gz
	/u/t/dev/khmer/sandbox/saturate-by-median.py -C 1 -k 20 -x 2e9 -N 4 podar/SRR606249_1.fastq.gz -R podar.wgs.C1.report

podar.16s.x.16s.k32.kmers.out:
	./saturate-by-kmers.py -k 32 -s 1000 podar/SRR606370.fastq.gz podar/SRR606370.fastq.gz podar.16s.x.16s.k32.kmers.out

podar.16s.x.16s.k20.kmers.out:
	./saturate-by-kmers.py -k 20 -s 1000 podar/SRR606370.fastq.gz podar/SRR606370.fastq.gz podar.16s.x.16s.k20.kmers.out

podar.16s.x.16s.k32.reads.out:
	./saturate-by-reads.py -k 32 -s 1000 podar/SRR606370.fastq.gz podar/SRR606370.fastq.gz podar.16s.x.16s.k32.reads.out

podar.16s.x.16s.k20.reads.out:
	./saturate-by-reads.py -k 20 -s 1000 podar/SRR606370.fastq.gz podar/SRR606370.fastq.gz podar.16s.x.16s.k20.reads.out

podar.16s.x.wgs.k20.kmers.m2.out:
	./saturate-by-kmers.py -k 20 -m 2 -s 200000 -M 20000000 podar/SRR606370.fastq.gz podar/SRR606249_1.fastq.gz podar.16s.x.wgs.k20.kmers.m2.out

podar.16s.x.wgs.k20.kmers.m10.out:
	./saturate-by-kmers.py -k 20 -m 10 -s 200000 -M 20000000 podar/SRR606370.fastq.gz podar/SRR606249_1.fastq.gz podar.16s.x.wgs.k20.kmers.m10.out

podar.16s.x.wgs.k20.kmers.m5.out:
	./saturate-by-kmers.py -k 20 -m 5 -s 200000 -M 20000000 podar/SRR606370.fastq.gz podar/SRR606249_1.fastq.gz podar.16s.x.wgs.k20.kmers.m5.out

podar.16s.x.wgs.k20.kmers.m40.out:
	./saturate-by-kmers.py -k 20 -m 40 -s 200000 -M 20000000 podar/SRR606370.fastq.gz podar/SRR606249_1.fastq.gz podar.16s.x.wgs.k20.kmers.m40.out

podar.16s.x.wgs.k20.kmers.m20.out:
	./saturate-by-kmers.py -k 20 -m 20 -s 200000 -M 20000000 podar/SRR606370.fastq.gz podar/SRR606249_1.fastq.gz podar.16s.x.wgs.k20.kmers.m20.out

podar.v13.x.wgs.k20.kmers.m20.out:
	./saturate-by-kmers.py -k 20 -m 20 -s 200000 -M 20000000 podar/16s/v13.SRR606368.fastq.gz podar/SRR606249_1.fastq.gz podar.v13.x.wgs.k20.kmers.m20.out

podar.c0.x.wgs.k20.kmers.m20.out:
	./saturate-by-kmers.py -k 20 -m 20 -s 200000 -M 20000000 podar/otu/v13.list.cluster0000.fa podar/SRR606249_1.fastq.gz podar.c0.x.wgs.k20.kmers.m20.out

podar.c20.x.wgs.k20.kmers.m20.out:
	./saturate-by-kmers.py -k 20 -m 20 -s 200000 -M 20000000 podar/otu/v13.list.cluster0020.fa podar/SRR606249_1.fastq.gz podar.c20.x.wgs.k20.kmers.m20.out

podar.c01.x.wgs.k20.kmers.m20.out:
	./saturate-by-kmers.py -k 20 -m 20 -s 10000 -M 2000000 podar/otu/v13.list.cluster0001.fa podar/SRR606249_1.fastq.gz podar.c01.x.wgs.k20.kmers.m20.out

podar.c02.x.wgs.k20.kmers.m20.out:
	./saturate-by-kmers.py -k 20 -m 20 -s 10000 -M 2000000 podar/otu/v13.list.cluster0002.fa podar/SRR606249_1.fastq.gz podar.c02.x.wgs.k20.kmers.m20.out

podar.c03.x.wgs.k20.kmers.m20.out:
	./saturate-by-kmers.py -k 20 -m 20 -s 10000 -M 2000000 podar/otu/v13.list.cluster0003.fa podar/SRR606249_1.fastq.gz podar.c03.x.wgs.k20.kmers.m20.out

podar.c04.x.wgs.k20.kmers.m20.out:
	./saturate-by-kmers.py -k 20 -m 20 -s 10000 -M 2000000 podar/otu/v13.list.cluster0004.fa podar/SRR606249_1.fastq.gz podar.c04.x.wgs.k20.kmers.m20.out

podar.c05.x.wgs.k20.kmers.m20.out:
	./saturate-by-kmers.py -k 20 -m 20 -s 10000 -M 2000000 podar/otu/v13.list.cluster0005.fa podar/SRR606249_1.fastq.gz podar.c05.x.wgs.k20.kmers.m20.out

podar.c40.x.wgs.k20.kmers.m20.out:
	./saturate-by-kmers.py -k 20 -m 10 -s 200000 -M 20000000 podar/otu/v13.list.cluster0040.fa podar/SRR606249_1.fastq.gz podar.c40.x.wgs.k20.kmers.m20.out

podar.c60.x.wgs.k20.kmers.m20.out:
	./saturate-by-kmers.py -k 20 -m 10 -s 200000 -M 20000000 podar/otu/v13.list.cluster0060.fa podar/SRR606249_1.fastq.gz podar.c60.x.wgs.k20.kmers.m20.out

podar.v4arch.x.wgs.k20.kmers.m20.out:
	./saturate-by-kmers.py -k 20 -m 20 -s 200000 -M 20000000 podar/16s/v4arch.SRR606356.fastq.gz podar/SRR606249_1.fastq.gz podar.v4arch.x.wgs.k20.kmers.m20.out

podar.v69.x.wgs.k20.kmers.m20.out:
	./saturate-by-kmers.py -k 20 -m 20 -s 200000 -M 20000000 podar/16s/v69.SRR606375.fastq.gz podar/SRR606249_1.fastq.gz podar.v69.x.wgs.k20.kmers.m20.out

podar.16s.x.sim.k20.kmers.m2.out:
	./saturate-by-kmers.py -k 20 -m 2 -s 200000 -M 20000000 podar/SRR606370.fastq.gz podar/all.fa.reads podar.16s.x.sim.k20.kmers.m2.out

podar.16s.x.sim.k20.kmers.m10.out:
	./saturate-by-kmers.py -k 20 -m 10 -s 200000 -M 20000000 podar/SRR606370.fastq.gz podar/all.fa.reads podar.16s.x.sim.k20.kmers.m10.out

podar.16s.x.sim.k20.kmers.m5.out:
	./saturate-by-kmers.py -k 20 -m 5 -s 200000 -M 20000000 podar/SRR606370.fastq.gz podar/all.fa.reads podar.16s.x.sim.k20.kmers.m5.out

podar.16s.x.sim.k20.kmers.m40.out:
	./saturate-by-kmers.py -k 20 -m 40 -s 200000 -M 20000000 podar/SRR606370.fastq.gz podar/all.fa.reads podar.16s.x.sim.k20.kmers.m40.out

podar.16s.x.sim.k20.kmers.m20.out:
	./saturate-by-kmers.py -k 20 -m 20 -s 200000 -M 20000000 podar/SRR606370.fastq.gz podar/all.fa.reads podar.16s.x.sim.k20.kmers.m20.out

podar.16s.x.wgs.k32.kmers.out:
	./saturate-by-kmers.py -k 32 -m 20 -s 200000 -M 20000000 podar/SRR606370.fastq.gz podar/SRR606249_1.fastq.gz podar.16s.x.wgs.k32.kmers.out

podar.16s.x.wgs.k20.reads.out:
	./saturate-by-reads.py -k 20 -s 1000000 podar/SRR606370.fastq.gz podar/SRR606249_1.fastq.gz podar.16s.x.wgs.k20.reads.out

podar.16s.x.wgs.k32.reads.out:
	./saturate-by-reads.py -k 32 -s 1000000 podar/SRR606370.fastq.gz podar/SRR606249_1.fastq.gz podar.16s.x.wgs.k32.reads.out

podar.16s.x.ref.kmers.out: podar/all.fa
	./saturate-by-kmers.py -k 20 -s 1 podar/SRR606370.fastq.gz podar/all.fa podar.16s.x.ref.kmers.out

podar.16s.x.sim.kmers.out: podar/all.fa.reads
	./saturate-by-kmers.py -k 20 -s 1000 podar/SRR606370.fastq.gz podar/all.fa.reads podar.16s.x.sim.kmers.out

podar_16s.hist: podar/SRR606370.fastq.gz
	abundance-dist-single.py -k 20 -x 1e8 -N 4 podar/SRR606370.fastq.gz podar_16s.hist

podar.contam.fa.orig: reads-nobias.fa
	gunzip -c podar/SRR606249_1.fastq.gz | head -40000000 > podar.contam.fq.orig
	fastq-to-fasta.py podar.contam.fq.orig > podar.contam.fq.fa

podar.contam.fa: podar.contam.fq.fa
	sample-reads-randomly.py -N 1000000 -S 20 podar.contam.fq.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa reads-nobias.fa 
	cat podar.contam.fq.fa.subset.* > podar.contam.fa
	rm -f podar.contam.fq.fa.subset.*

podar.16s.x.contam.k20.kmers.m20.out: podar.contam.fa
	./saturate-by-kmers.py -k 20 -m 20 -s 200000 -M 20000000 podar/SRR606370.fastq.gz podar.contam.fa podar.16s.x.contam.k20.kmers.m20.out

beetle: beetle.kmers.m20.out

beetle.kmers.m20.out: beetle/combined_16S_18S.fastq beetle/WGS_beetle_gut_metagenome.fastq 
	./saturate-by-kmers.py -k 20 -m 20 -s 10000 beetle/combined_16S_18S.fastq beetle/WGS_beetle_gut_metagenome.fastq beetle.kmers.m20.out

lanier: lanier.wgs.C1.report lanier.16s1.x.wgs1.kmers.out

lanier.16s1.x.wgs.kmers.out:
	./saturate-by-kmers.py -k 20 -m 20 -s 100000 lanier/16s/SRR401324.fastq.gz lanier/lanier-combined.fastq.gz lanier.16s1.x.wgs.kmers.out

lanier.wgs.C1.report:
	/u/t/dev/khmer/sandbox/saturate-by-median.py -C 1 -k 20 -x 8e9 -N 4 lanier/*_1.fastq.gz lanier/*_2.fastq.gz -R lanier.wgs.C1.report
