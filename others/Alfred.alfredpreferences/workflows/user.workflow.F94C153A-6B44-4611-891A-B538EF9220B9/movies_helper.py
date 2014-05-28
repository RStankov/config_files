import imdb
import omdb
import webbrowser
import re
import json
import os
import htmlentitydefs
from MLStripper import MLStripper
from Feedback import Feedback

# Performs an action
def action(query):
  args = json.loads(query.replace("'", "\""))
  print args
  if args is None or len(args) == 0:
    return
  elif args["command"] == "imdb_movie":
    open_url(("http://www.imdb.com/title/%s" % (args["id"])))
  elif args["command"] == "imdb_actor":
    open_url(("http://www.imdb.com/name/%s" % (args["id"])))
  elif args["command"] == "lucky_imdb":
    open_url(("http://www.google.com/search?btnI=I'm+Feeling+Lucky&q=site:imdb.com %s" % args["query"]))
  elif args["command"] == "quicklook_text":
    command = "echo \"%s\" > plot.txt; qlmanage -p plot.txt" % (args["text"])
    run_command(command)
  elif args["command"] == "trailer":
    open_url(("http://www.google.com/search?btnI=I'm+Feeling+Lucky&q=site:youtube.com %s" % args["query"]))
  elif args["command"] == "quicklook_poster":
    command = "curl \"%s\" > poster.jpg; qlmanage -p poster.jpg" % (args["url"])
    run_command(command)
    
# Helper method, initially called from Alfred
def helper(query):
  id_regex = re.compile("^tt[0-9]{7}")
  id_matches = id_regex.match(query)
  if id_matches is not None:
    the_id = id_matches.group(0)
    if query.endswith("actors"):
      return display_actors(the_id)
    else:
      return display_movie_info(the_id)
  else:
    return display_search_results(query)
  
# Returns search results as feedback for Alfred
def display_search_results(query):
  feedback = Feedback()
  results = imdb.search(query)
  feedback = add_to_feedback(feedback, results, "popular")
  feedback = add_to_feedback(feedback, results, "exact")
  feedback = add_to_feedback(feedback, results, "substring")
  # feedback = add_to_feedback(feedback, results, "approx")
  return feedback

# Returns movie as feedback for Alfred
def display_movie_info(the_id):
  feedback = Feedback()
  movie = omdb.get_movie(the_id)
  title_args = json_args({ "command": "imdb_movie", "id": the_id })
  if "Title" in movie and "Year" in movie and "Runtime" in movie and "imdbRating" in movie:
    feedback.add_item(("%s (%s)" % (movie["Title"], movie["Year"])), ("%s, Rating: %s" % (movie["Runtime"], movie["imdbRating"])), title_args, "yes", "", "images/imdb.png")
  elif "Title" in movie and "Year" in movie and "Runtime" in movie:
    feedback.add_item(("%s (%s)" % (movie["Title"], movie["Year"])), ("%s" % (movie["Runtime"])), title_args, "yes", "", "images/imdb.png")
  elif "Title" in movie and "Year" in movie and "imdbRating" in movie:
    feedback.add_item(("%s (%s)" % (movie["Title"], movie["Year"])), ("Rating: %s" % (movie["imdbRating"])), title_args, "yes", "", "images/imdb.png")
  elif "Title" in movie and "Year" in movie:
    feedback.add_item(("%s (%s)" % (movie["Title"], movie["Year"])), "Title", title_args, "yes", "", "images/imdb.png")
  elif "Title" in movie:
    feedback.add_item(movie["Title"], "Title", title_args, "yes", "", "images/imdb.png")
  if "Genre" in movie:
    feedback.add_item(movie["Genre"], "Genre", "", "no", the_id, "images/genre.png")
  if "Released" in movie:
    feedback.add_item(movie["Released"], "Release date", "", "no", the_id, "images/release_date.png")
  if "Director" in movie and movie["Director"] != "" and movie["Director"] != "N/A":
    feedback.add_item(movie["Director"], "Director", json_args({ "command": "lucky_imdb", "query": movie["Director"] }), "yes", "", "images/director.png")
  if "Writer" in movie and movie["Writer"] != "" and movie["Writer"] != "N/A":
    feedback.add_item(movie["Writer"], "Writer", json_args({ "command": "lucky_imdb", "query": movie["Writer"] }), "yes", "", "images/writer.png")
  if "Actors" in movie:
    feedback.add_item("Show actors...", movie["Actors"], "", "no", ("%s actors" % (the_id)), "images/actors.png")
  if "Plot" in movie and movie["Plot"] != "" and movie["Plot"] != "N/A":
    escaped_plot = movie["Plot"].replace("'", "").replace("\"", "")
    feedback.add_item("Show plot...", movie["Plot"], json_args({ "command": "quicklook_text", "text": escaped_plot }), "yes", "", "images/plot.png")
  if "Poster" in movie:
    feedback.add_item("Show poster...", "", json_args({ "command": "quicklook_poster", "url": movie["Poster"] }), "yes", "", "images/poster.png")
  if "Title" in movie:
    trailer_query = "%s official trailer" % (movie["Title"])
    feedback.add_item("View trailer...", "", json_args({ "command": "trailer", "query": trailer_query }), "yes", "", "images/youtube.png")
  feedback.add_item("Show on IMDb...", "", title_args, "yes", "", "images/imdb.png")
  return feedback
  
# Returns actors as feedback for Alfred
def display_actors(the_id):
  feedback = Feedback()
  movie = omdb.get_movie(the_id)
  feedback.add_item("Back...", "", "", "no", the_id, "images/back.png")
  if "Actors" in movie:
    actors = movie["Actors"].split(", ")
    for actor in actors:
      feedback.add_item(actor, "Show on IMDb...", json_args({ "command": "lucky_imdb", "query": actor }), "yes", "", "images/imdb.png")
  return feedback
  
# Opens an entry with the specified ID in the users browser.
def open_id(the_id):
  if the_id[:2] == "tt":
    open_url(("http://www.imdb.com/title/%s" % (the_id)))
  elif the_id[:2] == "nm":
    open_url(("http://www.imdb.com/name/%s" % (the_id)))
  
# Append results for a specific key to the feedback. Returns new feedback.
def add_to_feedback(feedback, results, key):
  title_key = "title_%s" % (key)
  name_key = "name_%s" % (key)
  if title_key in results:
    for result in results[title_key]:
      feedback.add_item(unescape(result["title"]), strip_tags(unescape(result["title_description"])).replace("  ", ""), "", "no", result["id"])
  if name_key in results:
    for result in results[name_key]:
      feedback.add_item(unescape(result["name"]), "", json_args({ "command": "imdb_actor", "id": result["id"] }), "yes", "", "images/imdb.png")
  return feedback

# Strip tags from a string containing HTML tags.
def strip_tags(html):
  s = MLStripper()
  s.feed(html)
  return s.get_data()
  
# Opens a URL.
def open_url(url):
  if url is not None:
    webbrowser.open(url)
    
# Creates single quoted JSON arguments from a list.
# Single quotes are used instead of double quotes because for some reason
# it doesn't work with double quotes through Alfred.
def json_args(args):
  return json.dumps(args).replace("\"", "'")
  
# Runs a command in the bash
def run_command(cmd):
  os.system(cmd)
  
# Unescapes HTML entities
def unescape(text):
    def fixup(m):
        text = m.group(0)
        if text[:2] == "&#":
            # character reference
            try:
                if text[:3] == "&#x":
                    return unichr(int(text[3:-1], 16))
                else:
                    return unichr(int(text[2:-1]))
            except ValueError:
                pass
        else:
            # named entity
            try:
                text = unichr(htmlentitydefs.name2codepoint[text[1:-1]])
            except KeyError:
                pass
        return text # leave as is
    return re.sub("&#?\w+;", fixup, text)