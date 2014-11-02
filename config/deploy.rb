set :application, "lunchon"
set :repository,  "git@github.com:frazn-sol/lunchon.git"
set :deploy_to, '/var/rails/lunchon_staging'
set :user, 'lunchon'

set :scm, 'git'

role :web, "166.78.156.210"                          # Your HTTP server, Apache/etc
role :app, "166.78.156.210"                          # This may be the same as your `Web` server
role :db,  "166.78.156.210", :primary => true # This is where Rails migrations will run

set :branch, "master"
set :repository_cache, "copy"
set :deploy_via, :remote_cache

set :use_sudo, false
ssh_options[:forward_agent] = true

set :scm_passphrase, ""
set :port, 22

namespace :deploy do
  task :restart do
    run "touch /var/rails/lunchon_staging/current/tmp/restart.txt"
  end
end

after "deploy:update_code", :configure_database
after "deploy:update_code", :create_upload_symlink
after "deploy:update_code", :bundle_install, :precompile

desc "copy database.yml into the current release path"
task :configure_database, :roles => :app do
  db_config = "#{deploy_to}/shared/config/database.yml"
  run "cp #{db_config} #{release_path}/config/database.yml"
end  
 
desc "create symlinks for attachments"
task :create_upload_symlink, :roles => :app do
  run "ln -s #{shared_path}/uploads #{release_path}/public/uploads"
end  
task :bundle_install, :roles => :app do
  run "cd #{release_path} && bundle install --without test --without development --deployment"
end

task :precompile, :roles => :app, :except => { :no_release => true } do
  run "cd #{release_path} &&  bundle exec rake RAILS_ENV=production assets:precompile"
  #run "#{try_sudo} find #{shared_path}/assets -type f -exec chmod 664 {} \\;"
  #run "#{try_sudo} find #{shared_path}/assets -type d -exec chmod 775 {} \\;"
end

 #if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"


 #If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end

