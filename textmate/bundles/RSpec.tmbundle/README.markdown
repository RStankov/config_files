# RSpec TextMate Bundle

## Installation

    mkdir -p ~/Library/Application\ Support/TextMate/Bundles/
    cd ~/Library/Application\ Support/TextMate/Bundles/
    git clone git://github.com/rspec/rspec-tmbundle.git RSpec.tmbundle
    osascript -e 'tell app "TextMate" to reload bundles'

## Support for both RSpec-1 and RSpec-2

This RSpec.tmbundle works with both rspec-1 and rspec-2. Given that they work
differently, the RSpec.tmbundle tries its best to figure out which one you're
using in each project when you try to run RSpec examples. There are two
separate parts to this process, and you have some control over how each one
works.

### Load Path

The first thing that happens is that the RSpec.tmbundle prepares the Load Path
as follows:

If a Gemfile is present, it assumes you want to use Bundler to prepare the Load Path,
so it requires 'bundler' and runs `Bundler.setup` (this can be overridden - see below).

If not using Bundler, then it looks to see if rspec is in vendor/plugins or vendor/gems,
in which cases it adds its lib directory to the Load Path.

### RSpec-version

Once the Load Path is prepared, the bundle tries to determine which version of
RSpec to invoke as follows:

First, it looks for a ./rspec-tm file in the project root directory. If this
is present, it looks to see if it contains a setting for the RSpec version. To
use this, just add `.rspec-tm` to the project root with:

    --rspec-version 2.0.0

or which ever version you are using. This is the one fool proof way to ensure
that the right version is invoked, but you don't really need to do this in most
cases.

If the version is not configured, it then checks to see if rspec was found in
vendor/gems or vendor/plugins. If so, it figures out which version to invoke
based on files present in that rspec directory.

If no version is configured, and no rspec directory is found in vendor, then
it just tries to require 'rspec/core' (for RSpec-2) and then 'spec/autorun' (for
RSpec-1).

### Which approach should I use?

The effectiveness of each approach is dependent, in part, upon how you manage
your gem environment. The simplest approach to choosing is to first see if it
just works, and if not, then configure the version you want in the .rspec-tm file.

## Rubygems

The RSpec TextMate bundle does not `require "rubygems"` so that users who
choose other packaging mechanisms can still use it. If you _are_ using Rubygems
as your package manager, then the simplest thing to do is

* open up TextMate Preferences
* go to the Advanced tab
* add a variable named `RUBYOPT` with the value `rubygems`

## Options

You can set the following options in an .rspec-tm file in the root directory of
your project:

### --rspec-version
see RSpec-version, above.

### --bundler
Tell the TMBundle to use Bundler, even if there is no Gemfile (in which case
you should have the BUNDLER_GEMFILE environment variable set).

### --skip-bundler
Tell the TMBundle _not_ to use Bundler, even if there is a Gemfile.

## TextMate shell variables

In addition to the standard TextMate shell variables, the RSpec TextMate bundle
supports the following:

### TM_RSPEC_FORMATTER
Use to set a custom formatter other than RSpec's textmate formatter. Use the
full classname e.g. 'Spec::Core::Formatters::WebKit'

### TM_RSPEC_OPTS
Use this to set RSpec options just as you would in a .rspec file.

### TM_RSPEC_HOME
If you're hacking on rspec yourself, point this to the rspec-core project
directory for rspec-2, or the rspec directory for rspec-1.

## History
Parts of RSpec.tmbundle is based on Florian Weber's TDDMate.

## License
The license of RSpec.tmbundle is the same as [RSpec](http://github.com/rspec/rspec/blob/master/License.txt)'s.

