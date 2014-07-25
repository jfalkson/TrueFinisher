SSHKit.config.command_map[:rake]  = "bundle exec rake" 
SSHKit.config.command_map[:rails] = "bundle exec rails"


application="TrueFinisher"
set :application, application
user="ec2-user"
set :user, user

set :migration_role, 'app' # Defaults to 'db'
set :assets_roles, [:app] # Defaults to [:web]

set :scm, :git
set :repo_url,  "git@github.com:jfalkson/TrueFinisher.git"
set :branch, "master"
set :deploy_to, "/home/ec2-user/TrueFinisher"
set :pty, true


set :ssh_options, {
  forward_agent: true,
  port: 3456
}

set :log_level, :debug

set :linked_files, %w{config/database.yml config/config.yml}
set :linked_dirs, %w{bin log tmp vendor/bundle public/system}




set :keep_releases, 20

namespace :deploy do

  desc "Restart application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join("tmp/restart.txt")
    end
  end

  after :finishing, "deploy:cleanup"

end