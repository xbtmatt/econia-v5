#!/bin/sh
# cspell:words realpath, autoflake, isort, mypy

source ./poetry-check.sh

RELATIVE_PATHS=""

# Convert all paths to relative paths.
for path in "$@"; do
	RELATIVE=$(realpath --relative-to="$POETRY_SUBDIRECTORY" "$path")
	RELATIVE_PATHS="$RELATIVE_PATHS $RELATIVE"
done

# Run all linters and formatters, making changes in place.
poetry run autoflake -i --remove-all-unused-imports --remove-unused-variables --ignore-init-module-imports $RELATIVE_PATHS
poetry run black $RELATIVE_PATHS
poetry run flake8 $RELATIVE_PATHS
poetry run isort $RELATIVE_PATHS
poetry run mypy $RELATIVE_PATHS
