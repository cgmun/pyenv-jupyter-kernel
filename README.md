# pyenv-jupyter-kernel

Pyenv plugin to create a jupyter kernel for every installed pyenv version. Inspiration from [this gist](https://gist.github.com/thvitt/9072336288921f57ec8741eb4b8b024e)

## Installation

```shell
$ git clone https://github.com/cgmun/pyenv-jupyter-kernel $(pyenv root)/plugins/pyenv-jupyter-kernel
```
## bashrc
# Load pyenv-jupyter-kernel automatically by adding
# the following to ~/.bashrc:

# PYENV_JUPYTER is where pyenv virtual environment jupyterlab is installed
export PYENV_JUPYTER="jupyterlab"

export JUPYTER_DATA_DIR=$(PYENV_VERSION=$PYENV_JUPYTER jupyter --data-dir)
export JUPYTER_RUNTIME_DIR=$(PYENV_VERSION=$PYENV_JUPYTER jupyter --runtime-dir)
export JUPYTER_CONFIG_DIR=$(PYENV_VERSION=$PYENV_JUPYTER jupyter --config-dir)
note: JUPYTER_DATA_DIR is variable that pyenv-jupyter-kernel looks for before guessing.

## Usage

New kernels are automatically installed for every new version and virtualenv that you install. However, if you want to install the kernel for the current version (if using multiple versions, the top one) you can run:

```shell
$ pyenv register-kernel
```

Or to specify a specific version:

```shell
$ pyenv register-kernel <version_name>
```

To create a kernel for all versions you've already created in pyenv:

```shell
pyenv versions --bare | grep -v "/" | xargs -L 1 pyenv register-kernel
```

To start up an interactive shell using the kernel for your currently active `pyenv` version:

```shell
jupyter console --kernel=$(pyenv version-name)
```

It might be useful to add an alias in your init file:

```shell
alias ipy="jupyter console --kernel=$(pyenv version-name)"
```
