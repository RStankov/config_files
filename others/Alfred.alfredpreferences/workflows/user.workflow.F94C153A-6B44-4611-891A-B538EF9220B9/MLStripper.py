from HTMLParser import HTMLParser

class MLStripper(HTMLParser):
  def __init__(self):
    self.reset()
    self.fed = []

  def handle_data(self, d):
    self.fed.append(d)

  def handle_entityref(self, name):
    self.fed.append('&%s;' % name)
    
  def get_data(self):
    return ''.join(self.fed)