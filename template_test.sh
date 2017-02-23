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

echo ${MY_HTTP_PROXY}

