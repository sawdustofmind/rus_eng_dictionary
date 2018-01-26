class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Postgres Or Sqlite specific
  # TODO: move literal to configs
  DATABASE_RANDOM_FUNCTION = 'Random ()'
end
