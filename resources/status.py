from robotlibcore import keyword
import requests


@keyword("Get Status")
def get_status(url):
    r = requests.get(url)
    return r.status_code