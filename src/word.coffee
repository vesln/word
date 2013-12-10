# Dependencies.
lingo = require 'lingo'
extend = require 'super'
slug = require 'slug'
en = lingo.en

# The main namespace
module.exports = word = extend {}, lingo

# Strips slashes from a string.
word.stripSlashes = (str) ->
  str = str.replace /\\'/g, '\''
  str = str.replace /\\"/g, '"'
  str = str.replace /\\0/g, '\0'
  str = str.replace /\\\\/g, '\\'

# Strips quotes.
word.stripQuotes = (str) ->
  str = str.replace /\'/g, ''
  str = str.replace /\"/g, ''

# Converts quotes to entities.
word.quotesEntities = (str) ->
  str = str.replace /\'/g, '&#39;'
  str = str.replace /\"/g, '&quot;'

# Returns random string with given length.
word.random = (length) ->
  chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
  random = ''
  i = 0

  while i < length
    random += chars.charAt(Math.floor(Math.random() * chars.length))
    i++

  random

# Repeats word n times.
word.repeat = (str, times) ->
  new Array(times + 1).join(str)

# Censors given words.
word.censor = (str, bad, replace) ->
  bad = [bad] if not Array.isArray bad
  for text in bad
    regExp = new RegExp('\\b' + text + '\\b', 'g')
    str = str.replace regExp, replace
  str

# Strips links from string.
word.stripLinks = (str) ->
  str = str.replace /<a\s+[^>]+>/im, ''
  str = str.replace /<\/a>/im, ''

# Converts url addresses to clickable links.
word.autoLink = (str) ->
  str.replace /((http|https|ftp):\/\/[\w?=&.\/-;#~%-]+(?![\w\s?&.\/;#~%"=-]*>))/g, '<a href="$1">$1</a>'

# Extracts an excerpt from string
word.excerpt = (str, length, ending = '...') ->
  return str if str.length <= length
  str.substring(0, length) + ending

# Limits text to n words.
word.limit = (str, count) ->
  words = str.split /\s+/g
  return str if words.length <= count
  words.slice(0, count).join ' '

# Word wrap to given width.
#
# (c) Copyright James Padolsey
# http://james.padolsey.com/javascript/wordwrap-for-javascript/
word.wrap = (str, width, br = '\n', cut = false) ->
  reg = '.{1,' + width + '}(\\s|$)'

  if cut is true
    reg += '|.{' + width + '}|.+$'
  else
    reg += '|\\S+?(\\s|$)'

    str.match(new RegExp(reg, 'g')).join(br)

# Pluralizes a word if count is not 1.
word.pluralize = (count, singular, plural = null) ->
  return singular if count == 1
  plural = en.pluralize(singular) if not plural
  plural

# Joins words
word.join = (words, last) ->
  words = words.split /\s+/g if Array.isArray(words) is false
  lingo.join words, last

# Converts string to slug
word.slug = slug

# Exporting version number.
module.exports.version = require('../package.json').version
