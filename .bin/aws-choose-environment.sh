#!/usr/bin/env bash

AWS_CONFIG="${AWS_CONFIG:-${HOME}/.aws/config}"

grep '^\[profile' "${AWS_CONFIG}" \
    | tr -ds ']' ' ' \
    | cut -d' ' -f2 \
    | grep --invert-match '\-SSO-Base$' \
    | fzf -i +m
