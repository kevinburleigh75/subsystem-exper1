class RoleSs::GetRolesForUser
  lev_routine

  protected

  def exec(user)
    fatal_error(:user_cannot_be_nil) if user.nil?

    ss_maps = RoleSs::UserRoleMap.includes(:role).where{user_id == user.id}
    roles = ss_maps.collect{|ss_map| ss_map.role}
    outputs[:roles] = roles
  end
end
