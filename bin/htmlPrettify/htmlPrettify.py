#! /usr/bin/env python3

from bs4 import BeautifulSoup

html = input()
soup = BeautifulSoup(html, "html.parser")
print(soup.prettify())
