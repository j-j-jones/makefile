setup:
	python3 -m venv ~/.myrepo

install:
	pip install -r requirements.txt

test:
	python -m pytest -vv --cov=myrepolib tests/*.py
	python -m pytest --nbval notebook.ipynb
	
validate-circleci:
        circleci config process .circleci/config.yml

run-circleci-local:
         circleci local execute

lint: # This line should already be there with regular pylint
        hadolint path/to/Dockerfile


lint:
	pylint --disable=R,C myrepolib cli web

all: install lint test
