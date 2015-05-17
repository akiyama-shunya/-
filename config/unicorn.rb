rails_root = File.expand_path('../../', __FILE__)
worker_processes 2

working_directory rails_root

listen "#{rails_root}/tmp/sockets/unicorn.sock"

pid    "#{rails_root}/tmp/pids/unicorn.pid"

stderr_path "#{rails_root}/log/unicorn_error.log"
stdout_path "#{rails_root}/log/unicorn_stdout.log"

preload_app true

before_fork do |server, worker|
defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

old_pid = "#{ server.config[:pid] }.oldbin"
unless old_pid == server.pid
 begin
Process.kill :QUIT, File.read(old_pid).to_i
rescue Errno::ENOENT, Errno::ESRCH
end
end
end

after_fork do |server, worker|
defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end