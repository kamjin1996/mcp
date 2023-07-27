#!/bin/bash

show_help() {
    cat << EOF
Usage: $0 -s file1 file2 file3 -t dir1 dir2 [-f/--force] [-h/--help]
Options:
  -s, --sources   Specify source files to copy.
  -t, --targets   Specify target directories to copy files into.
  -f, --force     Force copy, overwrite destination files if they exist.
  -h, --help      Show this help message and exit.
EOF
}

log_error() {
    echo "Error: $1" >&2
}

#set -x

sources=()
targets=()
force_copy=false

while [[ $# -gt 0 ]]
do
    key="$1"

    case $key in
        -s|--sources)
            shift
            while [[ $# -gt 0 && ! "$1" == -* ]]; do
                sources+=("$1")
                shift
            done
            ;;
        -t|--targets)
            shift
            while [[ $# -gt 0 && ! "$1" == -* ]]; do
                targets+=("$1")
                shift
            done
            ;;
        -f|--force)
            force_copy=true
            shift
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        *)
            # Unknown option
            log_error "Unknown option: $key"
            show_help
            exit 1
            ;;
    esac
done

if [ -z "${sources}" ] || [ -z "${targets}" ]; then
    log_error "Both source and target options are required."
    show_help
    exit 1
fi

for source in "${sources[@]}"; do
    if [ ! -f "${source}" ]; then
        log_error "Source file '${source}' not found."
        exit 1
    fi
done

for target in "${targets[@]}"; do
    if [ ! -d "${target}" ]; then
        log_error "Target directory '${target}' not found."
        exit 1
    fi
done

multi_copy() {
    for source in "${sources[@]}"; do
        for target in "${targets[@]}"; do
            destination="${target}/$(basename "${source}")"
            if [ "$force_copy" = "true" ] || [ ! -e "${destination}" ]; then  # force copy or file not exist.
                echo "Copying '${source}' to '${destination}'"
                cp "${source}" "${destination}"
            else
                echo "File '$(basename "${source}")' already exists in '${target}', skipping."
            fi
        done
    done
}

multi_copy
#set +x
