require "bundler"
Bundler.require

require_all "lib/pieces/concerns/"
require_all "lib/pieces/"
require_all "lib"
require_all "model"

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/chess.sqlite"
)
