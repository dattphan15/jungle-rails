require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
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

    scenario "Item was added to cart" do
      # ACT
      visit root_path
      # DEBUG / VERIFY
      save_screenshot

      first('article.product').find_button('Add').click()
     
      expect(find_link('My Cart (1)'))
      save_screenshot
    end

end
