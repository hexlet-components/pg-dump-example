FROM postgres:18

RUN apt-get update && apt-get install -yq --no-install-recommends make \
    && rm -rf /var/lib/apt/lists/*
