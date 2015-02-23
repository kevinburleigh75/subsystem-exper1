require 'rails_helper'

describe 'RoleSs' do

  it 'can assign and retrieve roles for a given user' do
    target_user = User.create!

    result = RoleSs::GetRolesForUser.call(target_user)
    expect(result.errors).to be_empty
    expect(result.outputs.roles).to be_empty

    other_user = User.create!
    other_role = Role.create!
    RoleSs::AddUserRole.call(other_user, other_role)

    result = RoleSs::GetRolesForUser.call(target_user)
    expect(result.errors).to be_empty
    expect(result.outputs.roles).to be_empty

    target_role1 = Role.create!
    RoleSs::AddUserRole.call(other_user, target_role1)

    result = RoleSs::GetRolesForUser.call(target_user)
    expect(result.errors).to be_empty
    expect(result.outputs.roles).to be_empty

    RoleSs::AddUserRole.call(target_user, target_role1)

    result = RoleSs::GetRolesForUser.call(target_user)
    expect(result.errors).to be_empty
    expect(result.outputs.roles.size).to eq(1)
    expect(result.outputs.roles).to include(target_role1)

    target_role2 = Role.create!
    RoleSs::AddUserRole.call(target_user, target_role2)

    result = RoleSs::GetRolesForUser.call(target_user)
    expect(result.errors).to be_empty
    expect(result.outputs.roles.size).to eq(2)
    expect(result.outputs.roles).to include(target_role1)
    expect(result.outputs.roles).to include(target_role2)

    result = RoleSs::GetRolesForUser.call(other_user)
    expect(result.errors).to be_empty
    expect(result.outputs.roles.size).to eq(2)
    expect(result.outputs.roles).to include(other_role)
    expect(result.outputs.roles).to include(target_role1)
  end

end
