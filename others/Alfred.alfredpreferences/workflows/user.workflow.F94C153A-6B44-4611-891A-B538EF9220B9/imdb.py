import urllib, urllib2
import json

# Searches for both actors and movies
def search(query):
  query = urllib.quote_plus(query)
  url = "http://www.imdb.com/xml/find?json=1&nr=1&tt=on&nm=on&q=%s" % (query)
  contents = json_at_url(url)
  return contents
  
# Searches for movies
def search_movies(query):
  query = urllib.quote_plus(query)
  url = "http://www.imdb.com/xml/find?json=1&nr=1&tt=on&q=%s" % (query)
  contents = json_at_url(url)
  return contents
  
# Searches for actors
def search_actors(query):
  query = urllib.quote_plus(query)
  url = "http://www.imdb.com/xml/find?json=1&nr=1&nm=on&q=%s" % (query)
  contents = json_at_url(url)
  return contents
  
# Tries to parse contents at URL into Python. Returns 'None' if not successful.
def json_at_url(url):
  contents = contents_of_url(url)
  try:
    result = json.loads(contents)
  except ValueError:
    result = None
  return result

# Loads the contents of a URL.
def contents_of_url(url):
  request = urllib2.urlopen(url)
  contents = request.read()
  return contents