TESTS = test/*.test.coffee

test:
	@NODE_ENV=test ./node_modules/.bin/mocha \
	--require should \
	--reporter spec \
	$(TESTS)

.PHONY: test clean