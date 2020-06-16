require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(username: 'oscar', email: 'oscar@mail.com', fullname: "Oscar Mier", password: '123456') }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a username' do
    subject.username = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  it 'should have many opinions' do
    t = User.reflect_on_association(:opinions)
    expect(t.macro).to eq(:has_many)
  end
  it 'should have many followers' do
    t = User.reflect_on_association(:followers)
    expect(t.macro).to eq(:has_many)
  end
  it 'should have many followeds' do
    t = User.reflect_on_association(:followeds)
    expect(t.macro).to eq(:has_many)
  end
  it 'should have many follower_users' do
    t = User.reflect_on_association(:follower_users)
    expect(t.macro).to eq(:has_many)
  end
  it 'should have many followed_users' do
    t = User.reflect_on_association(:followed_users)
    expect(t.macro).to eq(:has_many)
  end
end
