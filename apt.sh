#!/bin/bash -e

# vim: set ft=sh ff=unix fileencoding=utf-8 expandtab ts=4 sw=4 :

# --------------
# TEMPLATE START
# --------------

source env.source

if [ "${USER}" != "" ] && [ "${PASS}" != "" ]; then
    MY_USER_PASS="${USER}:${PASS}@"
else
    if [ "${USER}" != "" ] && [ "${PASS}" == "" ]; then
        echo "validation error : PASS is undefined"
        exit 1
    fi
    if [ "${USER}" == "" ] && [ "${PASS}" != "" ]; then
        echo "validation error : USER is undefined"
        exit 1
    fi
fi

MY_HTTP_PROXY="http://${MY_USER_PASS}${PROXY_URL}:${PROXY_PORT}/"

# --------------
# TEMPLATE END
# --------------

APT_CONF_PATH=/etc/apt/apt.conf
if [ -e ${APT_CONF_PATH} ]; then
    echo "Acquire::http::proxy \"${MY_HTTP_PROXY}\";" | sudo tee -a ${APT_CONF_PATH}
else
    echo "${APT_CONF_PATH} is not found"
    exit 1
fi
