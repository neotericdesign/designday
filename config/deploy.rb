require 'bundler/capistrano'

# The name of the application, must be in valid folder name format
set :application, "designday"

# Full path, with protocol, to git repository
set :repository,  "git://github.com/neotericdesign/designday.git"

# The address to the server. Can use IP if necessary
set :server_address, "216.246.14.130"

# The username to deploy with
set :user, 'ndnet'

# Path to app on the server
set :deploy_to, "/home/#{user}/#{application}/rails/"
#set :newrelic_api, "ec88d11d959b82feda4238f51698f9947c63a92853081b8"
#set :newrelic_account, "105417"

set :rails_env, 'production'
set :scm, :git
set :branch, (ENV["DEPLOY_BRANCH"] || 'master')
set :git_enable_submodules, 1
set :deploy_via, :remote_cache
set :use_sudo, false

default_run_options[:pty] = true

role :web, server_address
role :app, server_address
role :db,  server_address, :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  desc "Symlink shared configs and folders on each release."
  task :symlink_shared do
    # Uncomment the relevant ones below
    # run "cp #{shared_path}/db/#{application}_production.sqlite3 #{shared_path}/bak/production.#{Time.now.to_i}.bak.sqlite3"
    # run "ln -nfs #{shared_path}/assets #{release_path}/public/assets"
    # run "ln -nfs #{shared_path}/assets_c #{release_path}/public/assets_c"
    # run "ln -nfs #{shared_path}/projectshop #{release_path}/public/projectshop"
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    # run "ln -nfs #{shared_path}/temp #{release_path}/public/temp"
    # run "ln -nfs #{shared_path}/db/#{application}_production.sqlite3 #{release_path}/db/#{application}_production.sqlite3"
    # run "ln -nfs #{shared_path}/config/newrelic.yml #{release_path}/config/newrelic.yml"
    # run "ln -nfs #{shared_path}/config/initializers/hoptoad.rb #{release_path}/config/initializers/hoptoad.rb"
    # run "ln -nfs #{shared_path}/config/initializers/newrelic.rb #{release_path}/config/initializers/newrelic.rb"
  end
  
  
end

desc "Run a Rake task remotely. Set the task with RAKE_TASK='your task here'"
task :rake do
  if ENV["RAKE_TASK"]
    run "cd #{current_path} && rake RAILS_ENV=#{rails_env} #{ENV["RAKE_TASK"]}"
  else
    puts "You need to set a task with RAKE_TASK='task here'"
  end
end

task :logs, :roles => :app do
  run "#{try_sudo} tail -f #{File.join(current_path,'log','production.log')}"
end

namespace :newrelic do
  desc "Disable NewRelic pinging"
  task :disable_pinging do
    run "curl https://rpm.newrelic.com/accounts/18924/applications/#{newrelic_account}/ping_targets/disable -X POST -H \"X-Api-Key: #{newrelic_api}\""
  end
  
  desc "Enable NewRelic pinging"
  task :enable_pinging do
    run "curl https://rpm.newrelic.com/accounts/18924/applications/#{newrelic_account}/ping_targets/enable -X POST -H \"X-Api-Key: #{newrelic_api}\""
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'
#after 'deploy:update_code', 'newrelic:enable_pinging'
#before 'deploy', 'newrelic:disable_pinging'


# Dir[File.join(File.dirname(__FILE__), '..', 'vendor', 'gems', 'hoptoad_notifier-*')].each do |vendored_notifier|
#   $: << File.join(vendored_notifier, 'lib')
# end

# require 'hoptoad_notifier/capistrano'

#require 'hoptoad_notifier/capistrano'