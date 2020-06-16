require 'rails_helper'

RSpec.describe Following, type: :model do
  let(:sender1) { User.create(username: 'oscar', email: 'oscar@mail.com', fullname: "Oscar Mier", password: '123456') }
  let(:receiver1) { User.create(username: 'alexis', email: 'alexis@mail.com', fullname: "Alexis Sanchez", password: '123456') }
  subject { Following.create(followerid: sender1.id, followedid: receiver1.id) }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a sender' do
    subject.followerid = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a receiver' do
    subject.followedid = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid if the sender and receiver are the same' do
    subject.followedid = sender1.id
    expect(subject).to_not be_valid
  end
  it 'is not valid if it takes an already created sender and receiver combination' do
    Following.create(followerid: sender1.id, followedid: receiver1.id) 
    expect(subject).to_not be_valid
  end
  it 'belongs to followed_user' do
    t = Following.reflect_on_association(:followed_user)
    expect(t.macro).to eq(:belongs_to)
  end
  it 'belongs to follower_user' do
    t = Following.reflect_on_association(:follower_user)
    expect(t.macro).to eq(:belongs_to)
  end
end