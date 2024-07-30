ARG NGINX_VERSION=nginx:1.19.1-alpine
FROM ${NGINX_VERSION}

ARG TZ=Asia/Shanghai
ARG NGINX_VERSION=nginx:1.19.1-alpine
ARG CONTAINER_PACKAGE_URL=mirrors.ustc.edu.cn
ARG NGINX_INSTALL_APPS

ENV INSTALL_APPS=",${NGINX_INSTALL_APPS},"

RUN if [ "${CONTAINER_PACKAGE_URL}" != "" ] ; then sed -i "s/dl-cdn.alpinelinux.org/${CONTAINER_PACKAGE_URL}/g" /etc/apk/repositories ; fi

RUN if [ -z "${INSTALL_APPS##*,certbot,*}" ]; then \
        echo "---------- Install certbot ----------"; \
        apk add --no-cache certbot; \
    fi

WORKDIR /www
