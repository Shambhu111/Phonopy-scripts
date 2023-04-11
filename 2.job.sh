#!/bin/bash -l

#$ -l h_rt=40:10:0

#$ -l mem=8G

#$ -l threads=1

#$ -N Multi-threaded_Job

#$ -pe mpi 100

#$ -cwd

# vasp 6
module unload -f compilers mpi
module load compilers/intel/2019/update5
module load mpi/intel/2019/update5/intel
module load vasp/6.3.0-24Jan2022/intel-2019-update5

for folder in disp-*; do
  cd "$folder"
gerun  vasp_std
  cd ..
done
