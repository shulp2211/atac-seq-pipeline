#!/bin/bash
set -e  # Stop on error

SH_SCRIPT_DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

echo "** Installing pipeline's Conda environments..."
conda create -n encode-atac-seq-pipeline --file ${SH_SCRIPT_DIR}/requirements.txt \
  --override-channels -c bioconda -c defaults -y
conda create -n encode-atac-seq-pipeline-macs2 --file ${SH_SCRIPT_DIR}/requirements.macs2.txt \
  --override-channels -c bioconda -c defaults -y
conda create -n encode-atac-seq-pipeline-spp --file ${SH_SCRIPT_DIR}/requirements.spp.txt \
  --override-channels -c r -c bioconda -c defaults -y
conda create -n encode-atac-seq-pipeline-python2 --file ${SH_SCRIPT_DIR}/requirements.python2.txt \
  --override-channels -c conda-forge -c bioconda -c defaults -y
echo "** Done."

bash ${SH_SCRIPT_DIR}/update_conda_env.sh
