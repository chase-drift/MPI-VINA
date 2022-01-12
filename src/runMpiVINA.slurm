#!/bin/bash
#SBATCH --job-name="VS Test"
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=4
#SBATCH --ntasks=8
#SBATCH --exclusive
#SBATCH --export=ALL
#SBATCH --time=01:00:00
#SBATCH -A 2112141420

#!/bin/bash
module load apps/autodock-vina/autodock-vina-1_1_2-spack
module load compilers/devtoolset/7
module load mpi/openmpi/3.1.3-gnu

#Run the application.
echo "MPI-Vina is running..."
mpirun -np 4 mpiVINA > Output/MpiVina.log
echo "Processing has finished"
echo "See the MpiVina.log file."

#Result analysis.
echo "Analysizing the results..."
cd Output
grep " 1 " *.txt | cut -c1-12,35-42 > result
#grep " 1 " *.txt | cut -c1-7,30-35 > result
echo "See the 'result' file in the 'Output' directory."
#cat result

echo "Sorting the results..."
sort -n +1 -2 result -o SortedResult
echo "See the 'SortedResult' file in the 'Output' directory."
#cat SortedResult
