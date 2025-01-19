import json

with open('/conf/serviceindex.json', 'r') as app_config:
	conf = app_config.read()
	print(conf)