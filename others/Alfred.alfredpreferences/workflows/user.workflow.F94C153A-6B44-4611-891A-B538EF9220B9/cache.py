import urllib

# Writes JSSON response to cache
def write(cache_name, lines):
  try:
    f = open(cache_name, "w")
    try:
      f.writelines(lines)
    finally:
      f.close()
  except IOError:
    pass

# Retrieve cached contents for an ID
def read(cache_name):
  lines = None
  try:
    f = open(cache_name, "r")
    try:
      lines = f.readlines()
    finally:
      f.close()
  except IOError:
    pass
  return lines
  