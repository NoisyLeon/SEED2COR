#!/bin/bash

#SBATCH -J S2C
#SBATCH -o S2C_%j.out
#SBATCH -e S2C_%j.err
#SBATCH -N 1
#SBATCH --ntasks-per-node=12
#SBATCH --time=24:00:00
#SBATCH --mem=8gb
module load gcc/gcc-4.9.1 
module load fftw
#module load intel
s2corexe=/projects/life9360/code/SEED2COR_Tian/Seed2Cor
cd /lustre/janus_scratch/life9360/for_Weisen/COR_US_RECENT
date1=$(date +"%s")
export OMP_NUM_THREADS=12; $s2corexe parameters_7D.txt <<- END
Y
END
date2=$(date +"%s")
diff=$(($date2-$date1))
echo "$(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."
