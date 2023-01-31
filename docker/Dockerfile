# Parent image: Alpine 3.17 https://www.alpinelinux.org/about/
ARG VERSION_ALPINE=3.17
FROM alpine:${VERSION_ALPINE}

# Install basic dependencies needed to compile stuff
RUN apk update && apk add --no-cache R wget make gcc musl-dev zlib-dev

# Get Heng Li's seqtk
ARG VERSION_SEQTK=1.3
RUN wget https://github.com/lh3/seqtk/archive/refs/tags/v${VERSION_SEQTK}.tar.gz && \
    tar xvf v${VERSION_SEQTK}.tar.gz && \
    cd seqtk-${VERSION_SEQTK} && \
    make && \
    make install && \
    cd .. && \
    rm -rf seqtk-${VERSION_SEQTK} V{VERSION_SEQTK}.tar.gz

# Install the R package you built and moved to src
ADD src /src
RUN Rscript -e "install.packages('/src/rpdd.tar.gz', type='source', repos=NULL)"

ENTRYPOINT ["/src/rpdd.sh"]
