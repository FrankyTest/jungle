require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    before do
      @testy = User.create(
        first_name: 'Deckard',
        last_name: 'Cain',
        email: 'cain@gmail.com',
        password: 'pass1234',
        password_confirmation: 'pass1234')

      @me = User.create(
        first_name: 'Anton',
        last_name: 'Taranenko',
        email: 'taranenko.anton@gmail.com',
        password: 'gg4e',
        password_confirmation: 'gg4e')

      @me2 = User.create(
        first_name: 'Anton2',
        last_name: 'Taranenko2',
        email: 'taranenko.ANTON@gmail.com',
        password: 'gg4ee',
        password_confirmation: 'gg4ee')

      @bob = User.create(
        first_name: 'Bob',
        last_name: 'Who',
        email: 'bob@gmail.com',
        password: 'gg4',
        password_confirmation: 'gg4')
    end

    it 'should validate all testy user fields' do
      expect(@testy).to be_valid
    end

    it 'should return false if passwords do not match' do
      @testy.password_confirmation = 'pass123'

      expect(@testy).to be_invalid
    end

    it 'should validate email uniqueness' do
      expect(@me).to be_valid
    end

    it 'should return false for similar (case sensitive) emails' do
      expect(@me2).to be_invalid
    end

    it 'should return false when email is not unique' do
      @me.email = 'cain@gmail.com'
      expect(@me).to be_invalid
    end

    it 'should return false when password is short' do
      expect(@bob).to be_invalid
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'should pass when the user exists' do
      @alan = User.create(
        first_name: 'Alan',
        last_name: 'Parsons',
        email: 'alan@Gmail.com',
        password: 'pass12345',
        password_confirmation: 'pass12345')

      expect(User.authenticate_with_credentials('alan@gMail.com ', 'pass12345')).to eq(@alan)
    end
  end
end
