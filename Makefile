clean:
	@rm -rf ./lib/

test:
	@./node_modules/.bin/hydro

build:
	@./node_modules/.bin/coffee -o lib -c src/*.coffee

.PHONY: test
