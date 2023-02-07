role :app, %w{ubuntu@35.79.52.24}
server '35.79.52.24', user: 'ubuntu', roles: %w{web app}
set :ssh_options, {
   keys: %w(/home/zaheer/.ssh/id_rsa),
   forward_agent: false,
   user: 'user',
   auth_methods: %w(public_key)
 }