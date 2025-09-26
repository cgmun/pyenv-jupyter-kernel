#!/usr/bin/env bash

if [[ -z "$JUPYTER_DATA_DIR" ]]; then
    echo "Jupyter not found. Please install jupyter in one of your pyenv versions." >&2
    jupyter_root=$(pyenv whence jupyter|tail -1)
    jupyter=${PYENV_ROOT}/versions/${jupyter_root}/bin/jupyter
else
    echo "Using Jupyter data directory: $JUPYTER_DATA_DIR"
fi
if declare -Ff after_uninstall >/dev/null; then
    after_uninstall "rm -rf ${JUPYTER_DATA_DIR}/kernels/pyenv_${VERSION_NAME}"
else
    echo "pyenv: pyenv-jupyter-kernel plugin requires pyenv v0.1.0 or later" >&2
fi