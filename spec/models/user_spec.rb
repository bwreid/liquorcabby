# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  photo           :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe User do
  describe '.new' do
    it 'creates an instance of User' do
      user = User.new
      expect(user).to be_an_instance_of(User)
    end
    it 'has name, email, password and password_confirmation' do
      user = User.new(name: 'Xavier', email: 'xavier@gmail.com', password: 'a', password_confirmation: 'a')
      expect(user.name).to eq 'Xavier'
      expect(user.email).to eq 'xavier@gmail.com'
      expect(user.password).to eq 'a'
      expect(user.password_confirmation).to eq 'a'
    end
  end
  describe '.create' do
    it 'has an id' do
      user = User.create(name: 'xavier', email: 'xavier@gmail.com', password: 'a', password_confirmation: 'a')
      expect(user.id).to_not be nil
    end
    it 'fails validation if name or email is blank while supplying password' do
      user = User.create(password: 'a', password_confirmation: 'a')
      expect(user.id).to be nil
    end
  end
end
