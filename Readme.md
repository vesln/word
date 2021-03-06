[![Build Status](https://secure.travis-ci.org/vesln/word.png)](http://travis-ci.org/vesln/word)

# Important Notice

I'm no longer actively maintaining this project. If you are interested supporting it - [ping me on twitter](https://twitter.com/vesln).
The only thing that I will ask you is to not change the API drastically. If you are planning on doing that - better start a brand new project.

If you want me to transfer you only the name on npm, I'd be happy to only if the project **does not have any downloads on npm lately**. In case it's being
downloaded, there are people that depend on it and might step up and start maintaining, so I will not transfer it to you, regardless if you want to release
a new major version etc.

If you have any other questions, let me know.

Thanks!

Veselin

# word

![screenshot](http://img545.imageshack.us/img545/3503/wordlogo.png)

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

## Install

```bash
$ npm install word
```

## Tests

```
$ npm install
$ make test
```

## License

MIT License
