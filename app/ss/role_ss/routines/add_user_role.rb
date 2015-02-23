class RoleSs::AddUserRole
  lev_routine

  protected

  def exec(user, role)
    fatal_error(:user_cannot_be_nil) if user.nil?
    fatal_error(:role_cannot_be_nil) if role.nil?

    ss_map = RoleSs::UserRoleMap.create(user: user, role: role)
    transfer_errors_from(ss_map, {type: :verbatim}, true)
  end
end
