require 'inifile'

config = IniFile.load("config.ini")
puts config["proxy"]["url"]
puts config["proxy"]["port"]
