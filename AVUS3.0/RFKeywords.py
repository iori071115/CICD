'''
# -*- coding: utf-8 -*-

Created on 2021年8月30日

@author: henry.zhu
'''
from selenium import webdriver
import os

def get_chrome_options():
    '''
    自定义Chrome启动参数
    param downloads_path:设置默认的文件下载路径
    '''
    path = os.getcwd()
    pathfile = path + "\\downfile"
    options = webdriver.ChromeOptions()
    #关闭密码弹窗
    prefs = {"":""}
    prefs["credentials_enable_service"] = False
    prefs["profile.password_manager_enabled"] = False
    prefs["download.default_directory"] = r"${pathfile}"
    '''
    #解决使用Ride在Chrome中无法自动允许运行flash的问题
    options.add_argument("--disable-features=EnableEphemeralFlashPermission")
    prefs = {"profile.default_content_setting_values.plugins": 1,
             "profile.content_settings.plugin_whitelist.adobe-flash-player": 1,
             "profile.content_settings.exceptions.plugins.*,*.per_resource.adobe-flash-player": 1}
    '''
    options.add_experimental_option("prefs", prefs)
    # 谷歌文档提到需要加上这个属性来规避bug
    options.add_argument('–disable-gpu')
    #chrome 76及以上版本禁用Chrome受自动软件控制
    options.add_experimental_option("useAutomationExtension", False)
    options.add_experimental_option("excludeSwitches", ["enable-automation"])
    #设置Chrome启动语言为英文
    options.add_argument("--lang=en-US.UTF-8")
    return options