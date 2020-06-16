require 'rails_helper'

RSpec.describe User, type: :model do
  subject { App.new(name: 'Google docs', url: 'docs.google.com', description: 'For making DOCS.') }
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
end
