from bs4 import BeautifulSoup

html = input()
soup = BeautifulSoup(html, "html.parser")
print(soup.prettify())
