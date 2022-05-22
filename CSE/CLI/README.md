# Anaconda Prompt
## Upgrade pip
```sh
pip install --upgrade --user pip
```
## Create Virtual Environment
```sh
conda create --name tf2.3 python=3.7
```
## Install Jupyter Notebook
```sh
conda install jupyter
```
## Install nbextensions
```sh
pip install jupyter_contrib_nbextensions && jupyter contrib nbextension install
```
## Virtual Environment
```sh
python -m venv <virtual_environment_name>
source .../<virtual_environment_name>/bin/activate
```
```sh
pip install -r requirements.txt
```
### `virtualenv`
```sh
virtualenv venv --python=python3.7.4
```
- `pip is configured with locations that require tls/ssl` 해결 방법
	- libcrypto-1_1-x64.dll, libcrypto-1_1-x64.pdb, libssl-1_1-x64.dll, libssl-1_1-x64.pdb를 anaconda3/Library/bin 폴더 -> anaconda3/DLLs 폴더로 이동
	