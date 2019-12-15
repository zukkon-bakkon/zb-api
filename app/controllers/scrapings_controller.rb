class ScrapingsController < ApplicationController
  def index

    require 'selenium-webdriver'
    require 'pry'
    puts "スクレイピングを開始しますか?(yes / no)"            
    answer = STDIN.gets.chomp
  if answer === "yes"
      @wait_time = 3 
      @timeout = 4

      # Seleniumの初期化
      # class ref: https://www.rubydoc.info/gems/selenium-webdriver/Selenium/WebDriver/Chrome
      Selenium::WebDriver.logger.output = File.join("./", "selenium.log")
      Selenium::WebDriver.logger.level = :warn
      driver = Selenium::WebDriver.for :chrome
      driver.manage.timeouts.implicit_wait = @timeout
      wait = Selenium::WebDriver::Wait.new(timeout: @wait_time)

      driver.get("https://www.dto.jp/shibuya/shop-list")

      # ちゃんと開けているか確認するため、sleepを入れる
      sleep 2

        begin

              shop_names = driver.find_elements(:css, '.com_shop_list.style1 .shop > a') 
              shops = shop_names.map {|name| {name: name.text,url: name.attribute("href")}}
              shops.each do |shop|
                driver.get(shop[:url])
                name = driver.find_element(:css, '.com_body > h2') 
                table_elements = driver.find_elements(:css, 'div.com_td.style2') 
                trip_area = driver.find_element(:css, 'div.com_td.style3') 
                title = driver.find_element(:css, '.messages > h3') 
                if  driver.find_elements(:css, 'div.text_folder_inner2').size > 0
                  description =  driver.find_element(:css, 'div.text_folder_inner2').text
                else 
                  description =  nil
                end

                fees = driver.find_elements(:css, '.list .style2') 
                if driver.find_elements(:css, '.shop_title_image2').size > 0
                  image_url =  driver.find_element(:css, '.shop_title_image2').style(:backgroundImage)[/\"(.+)\"/, 1] 
                elsif driver.find_elements(:css, '.shop_title_image img').size > 0
                  image_url = "https://www.dto.jp" +  driver.find_element(:css, '.shop_title_image img').attribute("src")
                else
                  image_url = nil
                end
                

                
                shop_one = Shop.new(name: name.text, image_url: image_url,tell_number: table_elements[0].text,trip_area: trip_area.text, holiday: table_elements[3].text,open_time: table_elements[5].text, title: title.text, description: description, admission:  fees[0].text == "無料"  ?  0 : fees[0].text.delete("円").delete(",").to_i, designation_fee: fees[1].text == "無料" ? 0 :fees[1].text.delete("円").delete(",").to_i )
                shop_one.save


                girls = driver.find_elements(:css, '.scheduled')

                girls.each do |girl| 
                  image_url = girl.find_element(:css, ".item").style(:backgroundImage)[/\"(.+)\"/, 1] 
                  name = girl.find_element(:css, ".text .item.name").text
                  # text = girl.find_elements(:css, ".text .item")[1].text
                 newGirl =  Girl.new(name: name, shop_id: shop_one.id, image_url: image_url)
                 newGirl.save
                end
                
              #  Girl.create(shop_id: shop_one.id)
              end

        
        rescue Selenium::WebDriver::Error::NoSuchElementError
          p 'no such element error!!'
        end

      # ドライバーを閉じる
      driver.quit

  else
    return
  end
end

end
