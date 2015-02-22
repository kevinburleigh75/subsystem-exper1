require 'rails_helper'

describe Ss::Role::GetRolesForUser do
  context 'there are no roles for the given user' do
    it 'returns no roles' do
      user = User.create!
      result = Ss::Role::GetRolesForUser.call(user)
      expect(result.errors).to be_empty
      expect(result.outputs.roles).to be_empty
    end
  end
  context 'there is one role for the given user' do
    xit 'returns that role' do
    end
  end
  context 'there are multiple roles for the given user' do
    xit 'returns all the roles' do
    end
  end
end
