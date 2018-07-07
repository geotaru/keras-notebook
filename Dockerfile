FROM tensorflow/tensorflow:latest-gpu-py3
MAINTAINER asami

RUN apt-get update -y && apt-get upgrade -y && \
apt-get install -y git \
build-essential \
wget \
curl \
graphviz

RUN pip install keras \
numpy \
scikit-learn \
pandas \
scipy \
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
RISE


RUN jupyter contrib nbextension install --user && \
mkdir -p $(jupyter --data-dir)/nbextensions && \
cd $(jupyter --data-dir)/nbextensions && \
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding &&  \
jupyter nbextension enable vim_binding/vim_binding && \
jupyter-nbextension install rise --py --sys-prefix && \
jupyter-nbextension enable rise --py --sys-prefix

WORKDIR /notebooks
