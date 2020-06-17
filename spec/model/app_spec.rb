require 'rails_helper'

RSpec.describe App, type: :model do
  let(:user1) { User.create(username: 'oscar', email: 'oscar@mail.com', fullname: 'Oscar Mier', password: '123456') }
  let(:app1) { App.create(name: 'Google docs', url: 'docs.google.com', description: 'For making DOCS.') }
  subject { App.create(name: 'Google docs', url: 'docs.google.com', description: 'For making DOCS.') }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a url' do
    subject.url = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'should return 0% positive feedback with 0 opinions' do
    expect(subject.positive).to eq(0)
  end

  it 'should return 0% negative feedback with 0 opinions' do
    expect(subject.negative).to eq(0)
  end

  it 'should return 100% positive feedback with 1 positive opinion' do
    subject.opinions.create(text: 'Good app', author: user1, app: app1, sentiment: true)
    expect(subject.positive).to eq('100.00')
  end

  it 'should return 100% negative feedback with 1 negative opinion' do
    subject.opinions.create(text: 'Good app', author: user1, app: app1, sentiment: false)
    expect(subject.negative).to eq('100.00')
  end

  it 'should return 50% negative feedback with 1 negative opinion and 1 positive opinion' do
    subject.opinions.create(text: 'Good app', author: user1, app: app1, sentiment: true)
    subject.opinions.create(text: 'Good app', author: user1, app: app1, sentiment: false)
    expect(subject.negative).to eq('50.00')
  end

  it 'should return 50% positive feedback with 1 negative opinion and 1 positive opinion' do
    subject.opinions.create(text: 'Good app', author: user1, app: app1, sentiment: true)
    subject.opinions.create(text: 'Good app', author: user1, app: app1, sentiment: false)
    expect(subject.positive).to eq('50.00')
  end
end
