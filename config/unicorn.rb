# -*- config: utf-8 -*-

# Unicornのプロセスがリスンするアドレスとポートを指定
listen "/tmp/unicorn.sock"
# pid fileの位置を指定する
# Rails.rootを指定するとアプリ内箇所になる
ROOT = File.dirname(File.dirname(__FILE__))
pid "#{ROOT}/tmp/pids/unicorn.pid"

# ワーカーの数を指定する
worker_processes 2

# リクエストのタイムアウト秒を指定する
timeout 15

# ダウンタイムなくすため、アプリをプレロード
preload_app true

# Unicronのログ出力先を指定
stdout_path "#{ROOT}/log/unicorn-stdout.log"
stderr_path "#{ROOT}/log/unicorn-stderr.log"

# before_fork, after_forkでは、Unicornのプロセスがフォークする前後の
# 挙動を指定できる。以下のおまじないの詳細は
# ドキュメントを参考にすること
before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

	old_pid = "#{server.config[:pid]}.oldbin"
	if old_pid != server.pid
	  begin
	    sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
	    Process.kill(sig, File.read(old_pid).to_i)
	  rescue Errno::ENOENT, Errno::ESRCH
	  end
	end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
