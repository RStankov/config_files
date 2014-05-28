import urllib
import json
import cache

CACHE_NAME = "omdb_cache"

# Retrieves information for a movie
def get_movie(the_id):
  cached = read_from_cache(the_id)
  if cached is not None:
    response = json.loads(cached)
    return response
  else:
    url = "http://www.omdbapi.com/?plot=full&i=%s" % (the_id)
    contents = contents_of_url(url)
    response = json_response(contents)
    if response is not None:
      write_to_cache(the_id, contents)
      return response
  return None
  
# Tries to parse contents to JSON. Returns 'None' if not successful.
def json_response(contents):
  try:
    result = json.loads(contents)
  except ValueError:
    result = None
  return result

# Loads the contents of a URL.
def contents_of_url(url):
  request = urllib.urlopen(url)
  contents = request.read()
  return contents
  
# Writes JSSON response to cache
def write_to_cache(the_id, response):
  global CACHE_NAME
  lines = "%s\n%s" % (the_id, response)
  cache.write(CACHE_NAME, lines)

# Retrieve cached contents for an ID
def read_from_cache(the_id):
  global CACHE_NAME
  lines = cache.read(CACHE_NAME)
  if lines is not None and lines[0].strip() == the_id:
    return lines[1]
  return None