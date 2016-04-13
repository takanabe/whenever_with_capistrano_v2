# See [Capistrano Integration](https://github.com/javan/whenever#capistrano-integration)
set :whenever_command, "bundle exec whenever"
require "whenever/capistrano"
set :whenever_roles, :app

set :application, 'my_app_name'
set :repository, 'https://github.com/takanabe/whenever_with_capistrano_v2.git'
set :branch, 'master'
set :deploy_to, '/home/vagrant/my_app_name'
set :scm, :git
set :user, 'vagrant'
set :ssh_options, {
  user: 'vagrant'
}


app_server = %w(
  192.168.33.10
)


role :app, *app_server

before 'deploy', 'deploy:app'

namespace :deploy do
  task :app, roles => :app do
    run "echo 'app' >> /home/vagrant/app.txt"
  end
end
