.DEFAULT_GOAL:=help

.EXPORT_ALL_VARIABLES:

ifndef VERBOSE
.SILENT:
endif

# set default shell
SHELL=/usr/bin/env bash -o pipefail -o errexit

TAG ?= $(shell cat TAG)
POETRY_HOME ?= ${HOME}/.local/share/pypoetry
POETRY_BINARY ?= ${POETRY_HOME}/venv/bin/poetry
POETRY_VERSION ?= 1.3.2

help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: show-version
show-version:  ## Display version
	echo -n "${TAG}"

.PHONY: build
build: ## Build exercise-mvc package
	echo "[build] Build exercise-mvc package."
	${POETRY_BINARY} build

.PHONY: install
install:  ## Install exercise-mvc with poetry
	@build/install.sh

.PHONY: image
image:  ## Build exercise-mvc image
	@build/image.sh

.PHONY: metrics
metrics: install ## Run exercise-mvc metrics checks
	echo "[metrics] Run exercise-mvc PEP 8 checks."
	${POETRY_BINARY} run flake8 --select=E,W,I --max-line-length 80 --import-order-style pep8 --statistics --count exercise_mvc
	echo "[metrics] Run exercise-mvc PEP 257 checks."
	${POETRY_BINARY} run flake8 --select=D --ignore D301 --statistics --count exercise_mvc
	echo "[metrics] Run exercise-mvc pyflakes checks."
	${POETRY_BINARY} run flake8 --select=F --statistics --count exercise_mvc
	echo "[metrics] Run exercise-mvc code complexity checks."
	${POETRY_BINARY} run flake8 --select=C901 --statistics --count exercise_mvc
	echo "[metrics] Run exercise-mvc open TODO checks."
	${POETRY_BINARY} run flake8 --select=T --statistics --count exercise_mvc tests
	echo "[metrics] Run exercise-mvc black checks."
	${POETRY_BINARY} run black -l 80 --check exercise_mvc

.PHONY: unit-test
unit-test: install ## Run exercise-mvc unit tests
	echo "[unit-test] Run exercise-mvc unit tests."
	${POETRY_BINARY} run pytest tests/unit

.PHONY: integration-test
integration-test: install ## Run exercise-mvc integration tests
	echo "[unit-test] Run exercise-mvc integration tests."
	${POETRY_BINARY} run pytest tests/integration

.PHONY: coverage
coverage: install  ## Run exercise-mvc tests coverage
	echo "[coverage] Run exercise-mvc tests coverage."
	${POETRY_BINARY} run pytest --cov=exercise_mvc --cov-fail-under=90 --cov-report=xml --cov-report=term-missing tests

.PHONY: test
test: unit-test integration-test  ## Run exercise-mvc tests

.PHONY: docs
docs: install ## Build exercise-mvc documentation
	echo "[docs] Build exercise-mvc documentation."
	${POETRY_BINARY} run sphinx-build docs site
