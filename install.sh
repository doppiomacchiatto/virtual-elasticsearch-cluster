#!/bin/bash

# Install any dependencies for creating the virtual ElasticSearch cluster and
# create the machines on which the cluster runs.

install::check_dep() {
    if ! which -s "$1"
    then
        echo "Dependency '$1' not installed" >&2
        exit 2
    fi
}

install::run() {
    ansible-galaxy install -r requirements.yml
    vagrant up
}


install::check_dep 'vagrant'
install::check_dep 'ansible'
install::check_dep 'ansible-galaxy'

install::run
