clean:
	@rm -rf ./lib/

test:
	@./node_modules/.bin/mocha test/*.coffee --require should --compilers coffee:coffee-script

build:
	@./node_modules/.bin/coffee -o lib -c src/*.coffee

.PHONY: test
