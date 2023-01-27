ARG VERSION_ALPINE=3.17
FROM alpine:${VERSION_ALPINE}

ADD assets /assets

RUN apk update && apk add --no-cache R wget make gcc musl-dev zlib-dev

RUN Rscript -e "install.packages('/assets/rpdd.tar.gz', type='source', repos=NULL)"

ARG VERSION_SEQTK=1.3
RUN wget https://github.com/lh3/seqtk/archive/refs/tags/v${VERSION_SEQTK}.tar.gz && \
    tar xvf v${VERSION_SEQTK}.tar.gz && \
    cd seqtk-${VERSION_SEQTK} && \
    make && \
    make install && \
    cd .. && \
    rm -rf seqtk-${VERSION_SEQTK} V{VERSION_SEQTK}.tar.gz

# CMD ["/assets/rpdd.sh"]
