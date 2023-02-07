FROM python:3.10
WORKDIR /home/
RUN mkdir src src/aa src/cc
RUN echo "from src.cc import dd" >> src/aa/bb.py
RUN python src/aa/bb.py