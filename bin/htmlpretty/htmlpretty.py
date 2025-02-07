from bs4 import BeautifulSoup
import sys


def getParser():
    supportedParsers = {
        "xml": "lxml",
        "lxml": "lxml",
        "html": "html.parser",
        "html.parser": "html.parser",
    }

    if len(sys.argv) > 1:
        parser = sys.argv[1]
    else:
        parser = "html.parser"

    if parser not in supportedParsers:
        print("Parser not supported: " + parser)
        sys.exit(1)

    return supportedParsers[parser]


if __name__ == "__main__":
    parser = getParser()

    lines = sys.stdin.readlines()
    html = "".join(lines)
    soup = BeautifulSoup(html, parser)

    print(soup.prettify())
