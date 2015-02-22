module Ss
  module Role
    class GetRolesForUser
      lev_routine

      protected

      def exec(user)
        fatal_error(:user_cannot_be_nil) if user.nil?

        roles = Ss::Role::UserRoleMap.where{user_id == user.id}
        outputs[:roles] = roles
      end
    end
  end
end
