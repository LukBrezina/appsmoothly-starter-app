# How Appsmoothly runs this app — plain Ruby, executed in each session's private
# workspace. Inside blocks: sh("...") runs a shell command and stops on failure;
# `app`, `session` and `port` identify this workspace; any Ruby works.

setup do
  sh "bundle install"        # when a session starts — gems
  sh "bin/rails db:prepare"  # create/migrate this workspace's own database
end

server do
  sh "bin/dev"               # the test server — must listen on ENV["PORT"]
end
