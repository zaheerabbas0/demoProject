server '35.79.52.24', user: 'ubuntu', roles: %w{app db web}
set :ssh_options, {
   keys: %w(/home/zaheer/.ssh/id_rsa),
   forward_agent: false,
   user: 'user',
   auth_methods: %w(public_key)
 }