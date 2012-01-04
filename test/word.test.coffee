# Word - Text this.
#
# Author: Veselin Todorov <hi@vesln.com>
# Licensed under the MIT License.

word = require '../'

describe 'word', ->
  it 'should have version', ->
		word.version.should.be.ok
	
	it 'should == object', ->
		(word is Object(word)).should.be.ok
		
	describe 'stripSlashes', ->
		it 'should strip slashes', ->
			word.stripSlashes("O\\'reilly").should.eql "O'reilly"
			
	describe 'stripQuotes', ->
		it 'should strip quotes', ->
			word.stripQuotes("foo ' bar").should.eql "foo  bar"
			word.stripQuotes("foo \" bar").should.eql "foo  bar"
			
	describe 'quotesEntities', ->
		it 'should convert quotes to entities', ->
			word.quotesEntities("foo ' bar").should.eql "foo &#39; bar"
			word.quotesEntities("foo \" bar").should.eql "foo &quot; bar"
			
	describe 'random', ->
		it 'should return random string with given length', ->
			word.random(5).length.should.eql(5)
			word.random(7).should.match /^[a-zA-Z0-9]{7}$/
			
	describe 'repeat', ->
		it 'should repeat word n times', ->
			word.repeat('foo', 3).should.eql 'foofoofoo'
			
	describe 'censor', ->
		it 'should censor given words', ->
			word.censor('foo', 'foo', '***').should.eql '***'
			word.censor('foo bar foo fooobar', 'foo', '***').should.eql '*** bar *** fooobar'
			word.censor('foo bar baz', ['foo', 'bar'], '***').should.eql '*** *** baz'
			
	describe 'stripLinks', ->
		it 'should strip html links', ->
			link = 'foo bar baz <a href="http://example.com" class="foobar">Foo</a> bar'
			word.stripLinks(link).should.eql 'foo bar baz Foo bar'
			
	describe 'autoLink', ->
		it 'should convert url to link', ->
			link = 'foo http://example.com/bar/#baz bar'
			word.autoLink(link).should.eql 'foo <a href="http://example.com/bar/#baz">http://example.com/bar/#baz</a> bar'
	
	describe 'excerpt', ->
		it 'should extract an excerpt from string', ->
			word.excerpt('foo', 3).should.eql 'foo'
			word.excerpt('fo', 3).should.eql 'fo'
			word.excerpt('foobar', 3).should.eql 'foo...'
			word.excerpt('foobar', 3, '___').should.eql 'foo___'
	
	describe 'limit', ->
		it 'should limit text to n words', ->
			word.limit('foo bar baz. Adsadsa, bla bla', 3).should.eql 'foo bar baz.'
			word.limit('boo bar', 3).should.eql 'boo bar'
			
	describe 'wrap', ->
		it 'should wrap text to given length', ->
			word.wrap('foooo bar baz', 3).should.eql 'foooo \nbar \nbaz'
			word.wrap('foooo bar baz', 3).should.eql word.wrap('foooo bar baz', 1)
			
	describe 'pluralize', ->
		it 'should pluralize word if count is not 1', ->
			word.pluralize(1, 'foo').should.eql 'foo'
			word.pluralize(0, 'cat').should.eql 'cats'
			word.pluralize(2, 'dog').should.eql 'dogs'
			word.pluralize(3, 'developer', 'drunk people').should.eql 'drunk people'
			word.pluralize(1, 'developer', 'drunk people').should.eql 'developer'
			
	describe 'join', ->
		it 'should join words', ->
			word.join('foo bar baz').should.eql 'foo, bar and baz'
			word.join(['foo', 'bar', 'baz']).should.eql 'foo, bar and baz'
			
	describe 'camelcase', ->
		it 'should camel-case given string', ->
			word.camelcase('foo bar').should.eql 'fooBar'
			
	describe 'capitalize', ->
		it 'should capitalize the first word of str', ->
			word.capitalize('foo bar').should.eql 'Foo bar'
			
	describe 'slug', ->
		it 'should slugify string', ->
			word.slug('foo bar').should.eql 'foo-bar'