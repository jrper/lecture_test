FROM jupyter/scipy-notebook

USER root
RUN apt update
RUN apt install git
RUN apt install -y man-db wget





USER jovyan

CMD ["start-notebook.sh", "--NotebookApp.allow_remote_access=True", "--NotebookApp.custom_display_url=http://localhost:8888"]

RUN pip install bash_kernel
RUN python -m bash_kernel.install

RUN mkdir -p /home/jovyan/.jupyter/custom/

ADD custom.css /home/jovyan/.jupyter/custom/custom.css