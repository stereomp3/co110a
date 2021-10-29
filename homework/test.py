import requests
from lxml import etree
import json

response = requests.get(
    "https://newhouse.591.com.tw/home/housing/search?rid=1&sid=&page=1",
    headers={
        'user-agent': 'Mozilla/5.0 (Macintosh Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36'
    }
)
content = response.content.decode()
# str to json
json_data = json.loads(content)
# 印出第一個
print(json_data["data"]["items"][0])