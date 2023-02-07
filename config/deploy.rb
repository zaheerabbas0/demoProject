set :application, "demoProject_production"
set :repo_url, "git@github.com:zaheerabbas0/demoProject.git"
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :rvm_ruby_version, '2.5.7'
set :passenger_restart_with_touch, true
server "35.79.52.24", user: 'ubuntu',port: "5432", roles: [:app, :web, :db], :primary => true 
