#!/bin/sh

POETRY_SUBDIRECTORY=./src/python/hooks

poetry --version >/dev/null 2>&1 || {
	echo "Poetry is not installed. Please install poetry to continue."
	exit 1
}

if [ "$GITHUB_ACTIONS" = "true" ]; then
	echo "Skipping the poetry check since we're running in a GitHub Actions environment."
	exit 0
fi

exit 1

cd $POETRY_SUBDIRECTORY || exit 1

poetry check --quiet || {
	echo "Poetry check failed. Please run $(poetry install -C src/python/hooks) to continue."
	exit 1
}

pre-commit --version >/dev/null 2>&1 || {
	echo "Pre-commit is not installed. Please install pre-commit to continue."
	exit 1
}

exit 0
