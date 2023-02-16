WHY DOESN'T THIS DOCKERFILE RUN!!!!

```dockerfile
FROM python:3.10
WORKDIR /home/
RUN mkdir foo foo/aa foo/cc
RUN echo "from foo.cc import dd" >> foo/aa/bb.py
RUN python foo/aa/bb.py
```

Output attempt to build:
```sh
(base) ➜  wtf-python-issue git:(dev) ✗ docker build -t ttt .
[+] Building 0.3s (8/8) FINISHED
 => [internal] load build definition from Dockerfile    0.0s
 => => transferring dockerfile: 176B                    0.0s
 => [internal] load .dockerignore                       0.0s
 => => transferring context: 2B                         0.0s
 => [internal] load metadata for docker.io/library/python:3.10    0.0s
 => [1/5] FROM docker.io/library/python:3.10            0.0s
 => CACHED [2/5] WORKDIR /home/                         0.0s
 => CACHED [3/5] RUN mkdir src src/aa src/cc            0.0s
 => CACHED [4/5] RUN echo "from src.cc import dd" >> src/aa/bb.py    0.0s
 => ERROR [5/5] RUN python src/aa/bb.py                 0.3s
------
 > [5/5] RUN python src/aa/bb.py:
#8 0.244 Traceback (most recent call last):
#8 0.244   File "/home/src/aa/bb.py", line 1, in <module>
#8 0.244     from src.cc import dd
#8 0.244 ModuleNotFoundError: No module named 'src'
------
executor failed running [/bin/sh -c python src/aa/bb.py]: exit code: 1
```