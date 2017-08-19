require "sinatra/activerecord/rake"
require_relative "./config/environment"


desc "drop into console"
task :console => :environment do
  def reload!
	load_all "lib"
  end

  Pry.start
end


task :environment do
  require_relative "./config/environment"
end
