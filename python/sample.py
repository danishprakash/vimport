import vim
import json
import requests

def _get(url, response_type):
    response = requests.get(url)
    return response.json() if response_type == 'json' else response.text

def _get_country():
    ip = _get('http://ipinfo.io/ip', 'text').rstrip()
    json_location_data = _get('http://api.ip2country.info/ip?{}'.format(ip), 'json')
    return json_location_data['countryName']

def print_country():
    print('You are in {}'.format(_get_country()))

def insert_country():
    row, column = vim.current.window.cursor
    current_line = vim.current.buffer[row-1]
    new_line = current_line[:column] + _get_country() + current_line[column:]
    vim.current.buffer[row-1] = new_line
