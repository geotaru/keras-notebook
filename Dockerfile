FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04
MAINTAINER geotaru <geotaru.dev@gmail.com>

# 一部のライブラリをインストールするときに
# スクリプトが止まらないように下記の環境変数を設定する
ENV DEBIAN_FRONTEND=noninteractive

# Pythonをソースからコンパイルするのに必要なライブラリをインストール
RUN apt-get update -y && apt-get upgrade -y && \
apt-get install -y git \
build-essential \
graphviz \
make \
build-essential \
libssl-dev \
zlib1g-dev \
libbz2-dev \
libreadline-dev \
libsqlite3-dev \
wget \
curl \
llvm \
libncurses5-dev \
libncursesw5-dev \
xz-utils \
tk-dev \
libffi-dev

# Python
WORKDIR /opt
RUN wget https://www.python.org/ftp/python/3.6.6/Python-3.6.6.tgz && \
tar xf Python-3.6.6.tgz

WORKDIR /opt/Python-3.6.6
RUN ./configure && \
make && \
make install && \
rm /opt/Python-3.6.6.tgz

# 欲しいライブラリをインストール
RUN pip3 install --upgrade pip && \
pip3 install numpy \
scipy \
pandas \
h5py \
scikit-learn \
imbalanced-learn \
nose \
xgboost \
lightgbm \
tensorflow-gpu \
keras \
seaborn \
matplotlib \
plotly \
jupyter \ 
tqdm \
cython \
jupyter_contrib_nbextensions \
pydot \
graphviz \
pydot3 \
pydot-ng \
folium \
autopep8 \
line_profiler \
memory_profiler \
rise

# Jupyter NotebookのExtensionの設定
RUN jupyter contrib nbextension install --user && \
: "Jupyter NotebookのキーバインドをVim風に設定" && \
mkdir -p $(jupyter --data-dir)/nbextensions && \
cd $(jupyter --data-dir)/nbextensions && \
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding &&  \
jupyter nbextension enable vim_binding/vim_binding && \
: "Jupyter Notebookでプレゼンをするためのライブラリ" && \
jupyter-nbextension install rise --py --sys-prefix && \
jupyter-nbextension enable rise --py --sys-prefix && \
: "セルごとに実行時間を測定" && \
jupyter-nbextension enable execute_time/ExecuteTime  && \
jupyter nbextension enable move_selected_cells/main && \
jupyter nbextension enable toggle_all_line_numbers/main && \
jupyter nbextension enable code_prettify/code_prettify && \
jupyter nbextension enable scratchpad/main

WORKDIR /notebooks
EXPOSE 8888
ENTRYPOINT ["jupyter", "notebook", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
