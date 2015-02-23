require 'rails_helper'

describe Ss::Role::AddUserRole do
  it 'can add a role to a user' do
    user = User.create!
    role = Role.create!

    result = Ss::Role::AddUserRole.call(user,role)
    expect(result.errors).to be_empty

    ss_maps = Ss::Role::UserRoleMap.where{user_id == user.id}
    expect(ss_maps.size).to eq(1)
    expect(ss_maps.first.role_id).to eq(role.id)
  end
  it 'cannot add the same role twice to a user' do
    user = User.create!
    role = Role.create!

    result = Ss::Role::AddUserRole.call(user,role)
    expect(result.errors).to be_empty

    result = Ss::Role::AddUserRole.call(user,role)
    expect(result.errors).to_not be_empty

    ss_maps = Ss::Role::UserRoleMap.where{user_id == user.id}
    expect(ss_maps.size).to eq(1)
    expect(ss_maps.first.role_id).to eq(role.id)
  end
end
