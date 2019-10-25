FROM tensorflow/tensorflow:1.15.0-gpu-py3

RUN apt update && apt install -y git

COPY non-tensorflow-requirements.txt /
RUN pip install -r /non-tensorflow-requirements.txt

COPY neuralgpu /neuralgpu
COPY neural_gpu_trainer.py /
