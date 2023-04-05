def ProjectName(Project_name,Account,Password):
    from selenium import webdriver
    from selenium.webdriver.common.keys import Keys
    from selenium.webdriver.common.by import By
    from selenium.webdriver.support.ui import WebDriverWait
    from selenium.webdriver.support import expected_conditions as EC
    from selenium.webdriver.chrome.options import Options
    import time

    chrome_options = Options()
    chrome_options.add_argument('--headless')
    chrome_options.add_argument('--disable-extensions')
    chrome_options.add_argument('--disable-gpu')
    chrome_options.add_argument('--no-sandbox')
    chrome_options.add_argument('lang=zh_TW.UTF-8')
    chrome_options.add_argument('--user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36')
    driver = webdriver.Chrome(options=chrome_options)
    driver.get('https://twmail.askey.com/')
    driver.maximize_window()
    enter_Account = WebDriverWait(driver, 15).until(
        EC.presence_of_element_located((By.CSS_SELECTOR, '[id="username"]'))).send_keys(Account)
    enter_passs = WebDriverWait(driver, 15).until(
        EC.presence_of_element_located((By.CSS_SELECTOR, '[id="password"]'))).send_keys(Password)
    click_login = WebDriverWait(driver, 15).until(
        EC.element_to_be_clickable((By.CSS_SELECTOR, '[onclick="clkLgn()"]'))).click()
    driver.save_screenshot('./test.png')
    
    def select_mail():
        WebDriverWait(driver, 15).until(
            EC.element_to_be_clickable((By.CSS_SELECTOR, 'div[class="_db_j2"]'))).click()  # 篩選
        time.sleep(2)
        WebDriverWait(driver, 15).until(
            EC.presence_of_all_elements_located((By.CSS_SELECTOR, 'div[class="_fce_z ms-font-s ms-fwt-sl"]')))[
            2].click()  # 未讀取
        time.sleep(2)

    title = '【FOTA Management】Please confirm the creation of the project.'
    a = 0
    while a < 30:
        try:
            select_mail()

        except:
            driver.refresh()
            select_mail()

        search_title = WebDriverWait(driver, 20).until(
            EC.presence_of_all_elements_located(
                (By.CSS_SELECTOR, 'div[class="_lvv_J ms-font-s ms-fwt-sb ms-fcl-tp"] span span')))  # 找主旨
        for i in range(len(search_title)):
            if search_title[i].text == title:
                search_title[i].click()  # 點擊符合主旨
                time.sleep(2)
                click_link = WebDriverWait(driver, 15).until(
                    EC.element_to_be_clickable(
                        (By.CSS_SELECTOR, '[id="Item.MessageUniqueBody"] a:nth-child(2)'))).click()  # 點link
                time.sleep(2)
                windows = driver.window_handles
                # 切換到當前最新開啟的視窗
                driver.switch_to.window(windows[-1])
                search_project_name = WebDriverWait(driver, 15).until(
                    EC.presence_of_all_elements_located((By.CSS_SELECTOR, 'div[class="content-box"] span')))[
                    1].text  # 找 project name
                time.sleep(2)
                if Project_name == search_project_name:
                    click_Approve = WebDriverWait(driver, 15).until(
                        EC.presence_of_all_elements_located((By.CSS_SELECTOR, 'div[class="el-card__body"] ')))[
                        1].click()  # 點擊 Approve
                    time.sleep(2)
                    click_ok = WebDriverWait(driver, 15).until(
                        EC.presence_of_all_elements_located((By.CSS_SELECTOR, 'div[class="dialog-footer"] span')))[
                        0]
                    print('OK')
                    #driver.close()
                    a = a + 30
                    break
                else:
                    print('cant find project name')
                    driver.close()
                    windows = driver.window_handles
                    # 切換到當前最新開啟的視窗
                    driver.switch_to.window(windows[0])
                    continue
            else:
                print('cant find  title')

        time.sleep(10)
        a = a + 1


