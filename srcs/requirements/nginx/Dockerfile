FROM alpine:3.16
RUN	apk update && apk upgrade && apk add --no-cache nginx openssl

COPY ./requirements/nginx/conf/entry.sh /entry.sh

RUN chmod +x /entry.sh
EXPOSE 443
CMD ["/entry.sh"]
