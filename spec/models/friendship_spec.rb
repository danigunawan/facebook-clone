require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let!(:user) do
    User.create(first_name: 'Test', last_name: 'Da Silva', email: 'test@test.com',
                password: 'password', password_confirmation: 'password')
  end

  let!(:user2) do
    User.create(first_name: 'Test-2', last_name: 'Da Silva', email: 'test-2@test.com',
                password: 'password', password_confirmation: 'password')
  end

  describe 'Creates and destroys friendships' do
    it 'creates and confirm friendship' do
      Friendship.create(user_id: user.id, friend_id: user2.id)
      expect(Friendship.count).to eql(1)
      expect(user.friend?(user2)).to be_falsey
      expect(user2.friend?(user)).to be_falsey

      user2.confirm_friend(user)
      user = User.first
      user2 = User.last

      expect(user2.friend?(user)).to be true
      expect(user.friend?(user2)).to be true
    end

    it 'cancels friendships' do
      Friendship.create(user_id: user.id, friend_id: user2.id)

      user = User.first
      user2 = User.last

      expect(Friendship.count).to eql(1)
      expect(user.friend?(user2)).to be_falsey
      expect(user2.friend?(user)).to be_falsey

      user2.confirm_friend(user)
      user = User.first
      user2 = User.last

      expect(user2.friend?(user)).to be true
      expect(user.friend?(user2)).to be true

      friendship = Friendship.where('user_id = ? and friend_id = ?', user.id, user2.id).first
      friendship.destroy
      expect(Friendship.count).to eql(0)

      user = User.first
      user2 = User.last

      expect(user2.friend?(user)).to be false
      expect(user.friend?(user2)).to be false
    end
  end
end
