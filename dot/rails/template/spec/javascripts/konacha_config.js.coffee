# set the Mocha test interface
# see http:#visionmedia.github.com/mocha/#interfaces
Konacha.mochaOptions.ui = 'bdd'

# ignore the following globals during leak detection
Konacha.mochaOptions.globals = ['app']

# set slow test timeout in ms
Konacha.mochaOptions.timeout = 5
