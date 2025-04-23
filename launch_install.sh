#! /bin/bash

# get the environmental variables from config.sh
source ./config.sh

# 01A_install_chapel: first job - no dependencies
job1=$(sbatch -A ${ACCOUNT} -p ${PARTITION} -t ${TIME} --cpus-per-task=${CPUS_PER_TASK} --mem-per-cpu=${MEM_PER_CPU} ${SCRIPTS_DIR}/01A_install_chapel.sh)
echo "sbatch -A ${ACCOUNT} -p ${PARTITION} -t ${TIME} --cpus-per-task=${CPUS_PER_TASK} --mem-per-cpu=${MEM_PER_CPU} ${SCRIPTS_DIR}/01A_install_chapel.sh"
jid1=$(echo $job1 | sed 's/^Submitted batch job //')
echo "01A_install_chapel: $jid1: `date`" >> job_ids.txt
