#!/bin/sh

set -e

SUBMIT_CHROME=false
SUBMIT_FIREFOX=false
SUBMIT_OPERA=false

#Print warning
function warn() {
    echo -e "\e[33m$1\033[0m"
}

# Set submit vars depending on supplied env vars
function set_submit_vars() {
    #Check chrome env vars
    if [[ -n "$WEXT_SHIPIT_CHROME_EXTENSION_ID" && -n "$WEXT_SHIPIT_CHROME_CLIENT_ID" && -n "$WEXT_SHIPIT_CHROME_CLIENT_SECRET" && -n "$WEXT_SHIPIT_CHROME_REFRESH_TOKEN" ]]; then
        SUBMIT_CHROME=true
    else
        warn "Note: chrome credentials were not correctly set..."
    fi

    # Check firefox env vars
    if [[ -n "$WEXT_SHIPIT_FIREFOX_JWT_ISSUER" && -n "$WEXT_SHIPIT_FIREFOX_JWT_SECRET" ]]; then
        SUBMIT_FIREFOX=true
    else
        warn "Note: firefox credentials were not correctly set..."
    fi

    # Check opera env vars
    if [[ -n "$WEXT_SHIPIT_OPERA_EMAIL" && -n "$WEXT_SHIPIT_OPERA_EXTENSION_ID" && -n "$WEXT_SHIPIT_OPERA_PASSWORD" ]]; then
        SUBMIT_OPERA=true
    else
        warn "Note: opera credentials were not correctly set..."
    fi
}

function submit_to_stores() {
    if [ "$SUBMIT_CHROME" = true ]; then
        shipit chrome "$WEXT_CHROME_SRC"
    fi

    if [ "$SUBMIT_FIREFOX" = true ]; then
        shipit firefox "$WEXT_FIREFOX_SRC"
    fi

    if [ "$SUBMIT_OPERA" = true ]; then
        shipit opera "$WEXT_OPERA_SRC"
    fi
}

# First check env vars
set_submit_vars

# Submit to stores
submit_to_stores
