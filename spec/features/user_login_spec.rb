require 'rails_helper'

RSpec.feature "userLogIn", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "when user authentication succesful they are logged in" do
    # ACT
    visit root_path
    find('button', text: 'Add', match: :first).click
    sleep(1)
    # DEBUG / VERIFY
    save_screenshot('add_to_cart.png')

    expect(page).to have_css('a', text: 'My Cart (1)')
  end

end