#!/bin/sh
# cspell:words CODESPACES, CODESPACE_NAME

POETRY_SUBDIRECTORY=./src/python/hooks

poetry --version >/dev/null 2>&1 || {
	echo "Poetry is not installed. Please install poetry to continue."
	exit 1
}

echo $CODESPACE_NAME
echo $CODESPACE_NAME
echo $CODESPACE_NAME
echo $CODESPACES
echo $CODESPACES
echo $CODESPACES
echo "Hello world"
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
