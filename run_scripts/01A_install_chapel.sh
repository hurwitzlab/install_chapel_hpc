#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --output=./logs/01A_install_chapel-%a.out
#SBATCH --error=./logs/01A_install_chapel-%a.err

# This script will install chapel on an HPC that doesn't allow for 
# an install on the head node

# load environment
pwd; hostname; date
source $SLURM_SUBMIT_DIR/config.sh

# get the version of chapel in the config
cd ${INSTALL_DIR}
#wget https://github.com/chapel-lang/chapel/releases/download/${VERSION}/chapel-${VERSION}.tar.gz
#tar -xvf chapel-${VERSION}.tar.gz
export CHPL_HOME="${INSTALL_DIR}/chapel-${VERSION}"
export CHPL_LLVM="bundled"
export CHPL_HOST_COMPILER=gnu
export CHPL_TARGET_COMPILER=llvm

# print the settings to the outfile
source $CHPL_HOME/util/setchplenv.bash
$CHPL_HOME/util/printchplenv --all

cd $CHPL_HOME
./configure --prefix=${CHPL_HOME}
make -j ${CPUS_PER_TASK}
make -j ${CPUS_PER_TASK} install
