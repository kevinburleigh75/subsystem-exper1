class Ss::Role::GetRolesForUser
  lev_routine

  protected

  def exec(user)
    fatal_error(:user_cannot_be_nil) if user.nil?

    ss_maps = Ss::Role::UserRoleMap.where{user_id == user.id}
    role_ids = ss_maps.collect{|ss_map| ss_map.role_id}
    roles = Role.find(role_ids)
    outputs[:roles] = roles
  end
end
