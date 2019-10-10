FROM tensorflow/tensorflow:0.12.1-gpu

RUN apt update && apt install -y git

COPY non-tensorflow-requirements.txt /
RUN pip install -r /non-tensorflow-requirements.txt

COPY neuralgpu /neuralgpu
COPY neural_gpu_trainer.py /
