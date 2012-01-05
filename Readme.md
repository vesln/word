[![Build Status](https://secure.travis-ci.org/vesln/word.png)](http://travis-ci.org/vesln/word)

# word - Text this.

http://github.com/vesln/word

## Description
	
Word contains functions that assist in working with strings.

## Features

- strip slashes
- strip quotes
- quotes to entities
- random strings
- repeat string
- censor words in text
- strip links
- auto links
- excerpts
- word limit
- pluralize
- join
- capitalize
- camel-case
- slug

## Synopsis

Word is written in CoffeeScript, but you can use it in your non-coffee app.

```coffeescript

word = require 'word'

result = null

result = word.stripSlashes "O\\'reilly" # strips slashes.

result = word.stripQuotes "foo ' bar" # strips quotes

result = word.quotesEntities "foo ' bar" # quotes to entities

result = word.random 5 # returns random string with length of 5

result = word.repeat 'foo', 3 # repeats n times a string

result = word.censor 'foo', 'foo', '***' # censors bad words.

result = word.censor 'foo bar baz', ['foo', 'bar'], '***'

result = word.stripLinks 'baz <a href="http://example.com" class="foobar">Foo</a>' # strips links

result = word.autoLink "http://example.com/" # links -> a + href

result = word.excerpt 'foobar', 3 # extracts an excerpt from string

result = word.limit 'foo bar baz bar foo.', 3 # limits text to n words.

result = word.wrap 'foooo bar baz', 3 # wraps text to given length.

result = word.pluralize 2, 'dog' # pluralize or not, depends on supplied count.

```

Want to use it as helper in your express app? Sure.

```javascript

var express = require('express');
var word = require('word');
var app = express.createServer();

app.helpers({ word: word });

```

## Requirements

- NPM (http://npmjs.org/)
- Node.js 0.6 (http://nodejs.org/)

## Install

	$ npm install word

## Tests

	$ npm install
	$ cake test

## Credits and Acknowledgments

Special thanks to indexzero (https://github.com/indexzero) for the following advice https://github.com/vesln/word/issues/1
Now you don't have to install coffee-script as a dep in order to use the library.

## License

MIT License

Copyright (C) 2012 Veselin Todorov

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.