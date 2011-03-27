#
# Rails Project Template
#                by Radoslav Stankov
#
# usage:
# => rails new OpenFestDemo -J -T -G --skip-gemfile -m ~/.rails/template.rb
#

template_root = File.expand_path(File.join(File.dirname(__FILE__)))
source_paths << File.join(template_root, 'template')

inject_into_class 'config/application.rb', 'Application', <<-RUBY
    config.generators do |generate|
      generate.test_framework :rspec
    end

    config.autoload_paths += %W(\#{config.root}/lib)
    config.filter_parameters += [:password, :password_confirmation]
RUBY

copy_file 'overwrite/Gemfile', 'Gemfile', :force => true
copy_file 'overwrite/gitignore', '.gitignore', :force => true
copy_file 'overwrite/application.html.erb', 'app/views/layouts/application.html.erb', :force => true
copy_file 'bg.rails.yml', 'config/locales/bg.rails.yml', :force => true

run 'bundle install'

generate 'rspec:install'
generate 'cucumber:install'

# TODO -> match "/sprockets/:file" => "sprocketizer/sprockets#show"
copy_file 'sprockets/sprockets.rake', 'lib/tasks/sprockets.rake', :force => true
copy_file 'sprockets/sprockets.yml', 'config/sprockets.yml', :force => true

copy_file 'spec/spec_helper.rb', 'spec/spec_helper.rb', :force => true
copy_file 'spec/spec.opts', 'spec/spec.opts', :force => true
copy_file 'spec/rcov.opts', 'spec/rcov.opts', :force => true

copy_file 'compass/config.rb', 'config/compass.rb', :force => true
copy_file 'compass/initializer.rb', 'config/initializers/compass.rb', :force => true
copy_file 'compass/application.scss', 'app/stylesheets/application.scss', :force => true

copy_file 'cucumber/cucumber.yml', 'config/cucumber.yml', :force => true
copy_file 'cucumber/env.rb', 'features/env.rb', :force => true

remove_file 'README'
remove_file 'public/index.html'
remove_file 'public/images/rails.png'
remove_file 'public/favicon.ico'
run 'rm -R public/javascripts'

rake 'db:create'

git :init
git :add => '.'

git :submodule => 'init'
git :add => '.'
git :commit => "-a -m 'Initial commit"
