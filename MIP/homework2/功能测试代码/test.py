from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from time import sleep

driver = webdriver.Chrome()
driver.get("https://you.163.com/?_stat_area=nav_1")
elem = driver.find_element_by_class_name("yx-cp-searchInput")
div = driver.find_element_by_class_name("yx-cp-searchDefaultKeyword")
print("输入框中默认搜索关键词：")
print("\t" + div.text)
print()

elem.click()
li = driver.find_elements_by_xpath('//*[@id="j-yx-cp-m-top"]/div[2]/div/div[3]/div[3]/ul/li')
print("激活输入框后的推荐搜索关键词：")
for item in li:
    print("\t" + item.text)
print()

elem.send_keys("手机")
elem.click()
suggest2 = driver.find_elements_by_class_name("yx-cp-hl-item")
print("输入关键词“手机”后，推荐的搜索关键词：")
for item in suggest2:
    print("\t" + item.text)
print()
sleep(3)

elem.send_keys(Keys.RETURN)
sleep(5)
print("搜索关键词“手机”后的结果：")
items = driver.find_elements_by_class_name("name")
for item in items[2:40]:
    print("\t" + item.text)