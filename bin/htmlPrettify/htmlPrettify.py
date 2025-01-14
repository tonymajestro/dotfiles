from bs4 import BeautifulSoup
import sys

lines = sys.stdin.readlines()
html = "".join(lines)
soup = BeautifulSoup(html, "html.parser")

print(soup.prettify())
