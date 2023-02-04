# config valid for current version and patch releases of Capistrano
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
# Default deploy_to directory is /var/www/my_app_name
lock "~> 3.17.1"
set :application, "demoProject"
set :repo_url, "git@github.com:zaheerabbas0/demoProject.git"
set :branch, :main
set :deploy_to, "/home/demoProject/"
set :format, :airbrussh
set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto
set :pty, true
set :linked_files, "config/database.yml", 'config/master.key'
set :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage"
set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :local_user, -> { `git config user.name`.chomp }
set :keep_releases, 5
set :rvm_ruby_version, 'ruby-2.5.7'
set :ssh_options, verify_host_key: :secure
set :passenger_restart_with_touch, true