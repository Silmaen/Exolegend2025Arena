FROM ubuntu:24.04

USER root
EXPOSE 50002-50005
COPY install.sh /install.sh
COPY virtuals-3.0.6/ /virtuals/
RUN bash /install.sh && rm -f /install.sh
ENTRYPOINT ["/bin/bash", "/virtuals/launch_virtual.sh"]
WORKDIR /virtuals
VOLUME ["/virtuals/config", "/virtuals/logs"]
