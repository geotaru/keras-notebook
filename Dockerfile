FROM tensorflow/tensorflow:1.9.0-gpu-py3
MAINTAINER geotaru

RUN apt-get update -y && apt-get upgrade -y && \
apt-get install -y git \
build-essential \
wget \
curl \
graphviz

RUN pip install keras \
numpy \
scikit-learn \
imbalanced-learn \
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
autopep8 \
rise


RUN jupyter contrib nbextension install --user && \
mkdir -p $(jupyter --data-dir)/nbextensions && \
cd $(jupyter --data-dir)/nbextensions && \
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding &&  \
jupyter nbextension enable vim_binding/vim_binding && \
jupyter-nbextension install rise --py --sys-prefix && \
jupyter-nbextension enable rise --py --sys-prefix && \
jupyter-nbextension enable execute_time/ExecuteTime  && \
jupyter nbextension enable move_selected_cells/main && \
jupyter nbextension enable toggle_all_line_numbers/main && \
jupyter nbextension enable code_prettify/code_prettify && \
jupyter nbextension enable scratchpad/main


WORKDIR /notebooks
