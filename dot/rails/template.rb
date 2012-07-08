#
# Rails Project Template
#                by Radoslav Stankov
#
# usage:
# => rails new NewProject --skip-test-unit --skip-git --skip-javascript --skip-gemfile -m ~/.rails/template.rb
# => rails-new NewProject
#

inject_into_class 'config/application.rb', 'Application', <<-RUBY
    config.autoload_paths += %W(\#{config.root}/lib)
    config.filter_parameters += [:password, :password_confirmation]
RUBY

templates_dir = File.expand_path(File.join(File.dirname(__FILE__), 'template'))
source_paths << templates_dir

remove_file 'Gemfile'
remove_file 'app/assets/javascripts/application.js'
remove_file 'app/assets/stylesheets/application.css'
remove_file 'app/views/layouts/application.html.erb'
remove_file 'doc/README_FOR_APP'
remove_file 'public/index.html'
remove_file 'README.rdoc'

Dir[File.join templates_dir, '**', '*'].
  select { |file_name| File.file? file_name }.
  map    { |file_name| file_name.gsub(templates_dir + '/', '') }.
  each  do |file_name|
    if file_name =~ /vendor/
      copy_file file_name, :force => true
    else
      template file_name
    end
  end

run 'rm -rf doc'
run 'rm -rf vendor/plugins'
run 'rm -rf vendor/assets/stylesheets'

git :init
git :add => '.'
git :commit => '-am "Initial commit"'
