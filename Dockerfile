FROM ubuntu:24.04

EXPOSE 50001-50005
COPY install.sh /install.sh
COPY virtuals-3.0.6-4004acb3.zip /virtuals-3.0.6-4004acb3.zip
RUN bash /install.sh && rm -f /install.sh
ENTRYPOINT exec "bash /virtuals/launch_virtual.sh"
