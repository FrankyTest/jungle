require 'rails_helper'

RSpec.feature "Visitor navigates to the home page", type: :feature, js: true do
  # SETUP
  before(:each) do
    @category = Category.create!(name: 'Apparel')

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "and clicks on the product detail tag" do
    visit root_path

    save_screenshot

    # within('nav.navbar') do
    #   find('li a i.fa-shopping-cart').click

    #   sleep 5

    #   save_screenshot

    #   expect(page).to have_content 'My Cart'
    # end

    find('.btn[href="/products/10"]').click

    sleep 5

    save_screenshot

    expect(page).to have_content @category.products.find(10).description
  end
end
