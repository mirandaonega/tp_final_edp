FROM bash:4.4


COPY ./scripts  /scripts
COPY ./textos  /textos
COPY "menu.sh" /
COPY "opciones.txt" /

WORKDIR /

ENTRYPOINT ["./menu.sh"]

