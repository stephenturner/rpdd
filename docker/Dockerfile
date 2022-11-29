FROM alpine:3.15

ARG VERSION="0.1.0"

ADD assets /assets

RUN apk update && apk add --no-cache R
RUN Rscript -e "install.packages('/assets/rpdd_${VERSION}.tar.gz', type='source', repos=NULL)"

CMD ["/assets/rpdd.sh"]
