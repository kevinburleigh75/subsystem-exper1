require 'rails_helper'

describe Ss::Role::GetRolesForUser do
  context "there are no roles for the given user" do
    it "returns no roles" do
      target_user = User.create!

      other_user  = User.create!
      other_role  = Role.create!
      Ss::Role::UserRoleMap.create!(user: other_user, role: other_role)

      result = Ss::Role::GetRolesForUser.call(target_user)

      expect(result.errors).to be_empty
      expect(result.outputs.roles).to be_empty
    end
  end
  context "there is one role for the given user" do
    it "returns the user's role" do
      target_user = User.create!
      target_role = Role.create!
      Ss::Role::UserRoleMap.create!(user: target_user, role: target_role)

      other_user  = User.create!
      other_role  = Role.create!
      Ss::Role::UserRoleMap.create!(user: other_user, role: other_role)

      result = Ss::Role::GetRolesForUser.call(target_user)

      expect(result.errors).to be_empty
      expect(result.outputs.roles.size).to eq(1)
      expect(result.outputs.roles).to include(target_role)
    end
  end
  context "there are multiple roles for the given user" do
    it "returns all the user's roles" do
      target_user  = User.create!
      target_role1 = Role.create!
      Ss::Role::UserRoleMap.create!(user: target_user, role: target_role1)

      other_user  = User.create!
      other_role  = Role.create!
      Ss::Role::UserRoleMap.create!(user: other_user, role: other_role)

      target_role2 = Role.create!
      Ss::Role::UserRoleMap.create!(user: target_user, role: target_role2)

      result = Ss::Role::GetRolesForUser.call(target_user)

      expect(result.errors).to be_empty
      expect(result.outputs.roles.size).to eq(2)
      expect(result.outputs.roles).to include(target_role1)
      expect(result.outputs.roles).to include(target_role2)
    end
  end
end
