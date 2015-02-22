module Ss
  module Role
    class UserRoleMap < ActiveRecord::Base
      belongs_to :user
      belongs_to :role

      validates_presence_of :user
      validates_presence_of :role

      validates_uniqueness_of :role, scope: :user
    end
  end
end
