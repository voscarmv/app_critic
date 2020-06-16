require 'rails_helper'

RSpec.describe Opinion, type: :model do
  let(:user1) { User.new(username: 'oscar', email: 'oscar@mail.com', fullname: "Oscar Mier", password: '123456') }
  let(:app1) { App.new(name: "Google docs", url: "docs.google.com", description: "For making DOCS.") }
  subject { Opinion.new(text: 'Good app', author: user1, app: app1, sentiment: true) }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without an author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end
  it 'is valid without an app' do
    subject.app = nil
    expect(subject).to be_valid
  end
  it 'should belong to author' do
    t = Opinion.reflect_on_association(:author)
    expect(t.macro).to eq(:belongs_to)
  end
  it 'should belong to app' do
    t = Opinion.reflect_on_association(:app)
    expect(t.macro).to eq(:belongs_to)
  end
end
