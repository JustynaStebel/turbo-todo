require 'rails_helper'

RSpec.describe TodoItem, type: :model do
  subject { described_class.new(content: 'Test item', completed_at: nil) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a content' do
    subject.content = nil
    expect(subject).to_not be_valid
  end
end
