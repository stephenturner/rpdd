FROM alpine:3.15

ADD assets /assets

RUN apk update && apk add --no-cache R
RUN Rscript -e "install.packages('/assets/rpdd.tar.gz', type='source', repos=NULL)"

CMD ["/assets/rpdd.sh"]
