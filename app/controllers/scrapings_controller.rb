class ScrapingsController < ApplicationController
  def index

    require 'selenium-webdriver'
    require 'pry'

@wait_time = 3 
@timeout = 4

# Seleniumの初期化
# class ref: https://www.rubydoc.info/gems/selenium-webdriver/Selenium/WebDriver/Chrome
Selenium::WebDriver.logger.output = File.join("./", "selenium.log")
Selenium::WebDriver.logger.level = :warn
driver = Selenium::WebDriver.for :chrome
driver.manage.timeouts.implicit_wait = @timeout
wait = Selenium::WebDriver::Wait.new(timeout: @wait_time)

# Yahooを開く
driver.get("https://www.dto.jp/shibuya/shop-list")

# ちゃんと開けているか確認するため、sleepを入れる
sleep 2

#**
  # ブラウザでさせたい動作を記載する

  # ex. 検索欄に'Ruby'と入力して、検索ボタンを押す処理

  # 検索欄/検索ボタン取得
  begin

        shop_names = driver.find_elements(:css, '.shop > a') 
        shops = shop_names.map {|name| {name: name.text,url: name.attribute("href")}}
        shops.each do |shop|
         driver.get(shop[:url])
         name = driver.find_element(:css, '.com_body > h2') 
         table_elements = driver.find_elements(:css, 'div.com_td.style2') 
         shop_one = Shop.new(name: name.text, tell_number: table_elements[0].text )
         shop_one.save
        end

   
  rescue Selenium::WebDriver::Error::NoSuchElementError
    p 'no such element error!!'
  end

#   # 入力欄に'Ruby'を入力し、検索ボタンを押下
#   search_box.send_keys 'Ruby'
#   search_btn.click
#**

# ドライバーを閉じる
driver.quit
  end
end
