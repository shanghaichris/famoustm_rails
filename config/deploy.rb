default_run_options[:pty] = true
#set :repository,  "git://github.com/shanghaichris/famoustm_rails.git"
#set :scm, "git"
set :scm_passphrase, "" #This is your custom users password
set :user, "chris"

set :branch, "master"

set :deploy_via, :remote_cache
set :git_shallow_clone, 1
set :git_enable_submodules, 1

################################

set :application, "famoustm_rails"
set :repository,  "git://github.com/shanghaichris/famoustm_rails.git"
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "211.144.95.141"                          # Your HTTP server, Apache/etc
role :app, "211.144.95.141"                          # This may be the same as your `Web` server
role :db,  "211.144.95.141", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"
set :deploy_to, "/usr/local/system/www/#{application}"
# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end