#! /bin/bash

# Create a virtualenv for running Ansible.

project_dir=$(dirname "$0")
virtualenv "$project_dir/virtualenv"

source "$project_dir/virtualenv/bin/activate"

pip install -r "$project_dir/requirements.txt"
