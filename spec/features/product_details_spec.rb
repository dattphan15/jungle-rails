require 'rails_helper'

RSpec.feature "Visitor navigates to home page and clicks on product to see product details", type: :feature, js: true do
  
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


    scenario "They see all products on home page" do
      # ACT
      visit root_path
      
      # DEBUG / VERIFY
      save_screenshot
  
      # since each _product partial renders an article with class product, we are expecting to find at least one on the page.
      expect(page).to have_css 'article.product', count: 10
    end


    scenario "They see see product details after clicking on product from home page" do
      # ACT
      visit root_path
      find(:xpath, '/html/body/main/section/div/article[1]/footer/a').click
      
      # DEBUG / VERIFY
      save_screenshot
  
      # since each _product partial renders an article with class product, we are expecting to find at least one on the page.
      expect(page).to have_css 'article.product-detail'
      save_screenshot

    end


end
