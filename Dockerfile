FROM nvcr.io/nvidia/tritonserver:21.05-py3

COPY ./python_backend python_backend
RUN cd python_backend \
    && /usr/bin/python3 -m pip install --upgrade pip \
    && pip install --no-cache-dir torch==1.8.1

WORKDIR python_backend

CMD ["tritonserver", "--model-repository", "./models"]