require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before do
    @testy = User.create(
    first_name: 'Deckard',
    last_name: 'Cain',
    email: cain@gmail.com,
    password: 'pass1234',
    password_confirmation: 'pass1234')
  end

  it 'should return true if passwords match' do
    expect(@testy.password).to eq(@testy.password_confirmation)
  end
end
