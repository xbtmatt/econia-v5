#!/bin/sh

POETRY_SUBDIRECTORY=./src/python/hooks

poetry --version >/dev/null 2>&1 || {
	echo "Poetry is not installed. Please install poetry to continue."
	exit 1
}

poetry check -C $POETRY_SUBDIRECTORY

poetry install -C $POETRY_SUBDIRECTORY

pre-commit --version >/dev/null 2>&1 || {
	echo "Pre-commit is not installed. Please install pre-commit to continue."
	exit 1
}
