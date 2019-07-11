FROM jupyter/scipy-notebook:6c3390a9292e

USER root
RUN apt update
RUN apt install -y git man-db wget

USER jovyan

CMD ["start-notebook.sh", "--NotebookApp.custom_display_url=http://localhost:8900"]

RUN pip install bash_kernel
RUN python -m bash_kernel.install


RUN mkdir -p /home/jovyan/.jupyter/custom/
ADD custom.css /home/jovyan/.jupyter/custom/custom.css

RUN pip install jupyter_contrib_nbextensions
RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable exercise2/main

USER root
COPY *.ipynb ${HOME}/
RUN chown -R jovyan ${HOME}/
USER jovyan
