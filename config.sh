# Edit this config file to set the install directories and SLURM req.
# set the installation directories
export INSTALL_DIR=/xdisk/bhurwitz/chapel

# set up directories
export SCRIPTS_DIR="./run_scripts"
export LOGS="./logs"

# set the chapel version 
VERSION="2.4.0"

# setting the SLURM requirements
CPUS_PER_TASK=28 # CPUs for install required
MEM_PER_CPU="5gb" # memory per CPU required
TIME="24:00:00"
PARTITION="standard"
ACCOUNT="bhurwitz"

# --------------------------------------------------
function create_dir {
    for dir in $*; do
        if [[ ! -d "$dir" ]]; then
          echo "$dir does not exist. Directory created"
          mkdir -p $dir
        fi
    done
}
