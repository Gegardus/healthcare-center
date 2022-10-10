require 'rails_helper'

RSpec.describe Doctor, type: :model do
  subject do
    create(:category)
    Doctor.new(full_name: 'Vahan', phone: '8889995678', category: @category, image: 'doc1.png', email: 'doc@mail.com',
               password: 'docdoc', category_id: '1')        
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a full_name' do
    subject.full_name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a phone number' do
    subject.phone = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a category' do
    subject.category_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid if the phone number is not 10 chars' do
    expect(subject.phone.length).to eq(10)
  end

  it 'is not valid if the phone number is not all digits' do
    expect(subject.phone.match?(/\A-?\d+\Z/)).to eq(true)
  end
end
