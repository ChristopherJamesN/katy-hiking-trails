# commands used to deploy a Rails application
namespace :fly do
  # BUILD step:
  #  - changes to the filesystem made here DO get deployed
  #  - NO access to secrets, volumes, databases
  #  - Failures here prevent deployment
  task :build => 'assets:precompile'

  # RELEASE step:
  #  - changes to the filesystem made here are DISCARDED
  #  - full access to secrets, databases
  #  - failures here prevent deployment
  task :release do
    #sh 'rake db:migrate'
    #sh 'rake db:seed:replant'
    sh 'rake db:reset'
    # Trying to do this causes errors like:
    #    INFO [fly api proxy] listening at /.fly/api
    # 2023/10/01 03:23:46 listening on [fdaa:0:b6f5:a7b:162:35e6:b277:2]:22 (DNS: [fdaa::3]:53)
    # rake db:reset
    # (5015.3ms)  DROP DATABASE IF EXISTS "katy_hiking_trails"
    # PG::ObjectInUse: ERROR:  database "katy_hiking_trails" is being accessed by other users
    # DETAIL:  There is 1 other session using the database.
    # Couldn't drop database 'katy_hiking_trails'
    # rake aborted!
    # ActiveRecord::StatementInvalid: PG::ObjectInUse: ERROR:  database "katy_hiking_trails" is being accessed by other users
    # DETAIL:  There is 1 other session using the database.
    # /app/vendor/bundle/ruby/3.1.0/gems/activerecord-7.0.4/lib/active_record/connection_adapters/postgresql/database_statements.rb:48:in `exec'
  end

  # SERVER step:
  #  - changes to the filesystem made here are deployed
  #  - full access to secrets, databases
  #  - failures here result in VM being stated, shutdown, and rolled back
  #    to last successful deploy (if any).
  task :server => :swapfile do
    sh 'bin/rails server'
  end

  # optional SWAPFILE task:
  #  - adjust fallocate size as needed
  #  - performance critical applications should scale memory to the
  #    point where swap is rarely used.  'fly scale help' for details.
  #  - disable by removing dependency on the :server task, thus:
  #        task :server do
  task :swapfile do
    sh 'fallocate -l 512M /swapfile'
    sh 'chmod 0600 /swapfile'
    sh 'mkswap /swapfile'
    sh 'echo 10 > /proc/sys/vm/swappiness'
    sh 'swapon /swapfile'
  end
end
