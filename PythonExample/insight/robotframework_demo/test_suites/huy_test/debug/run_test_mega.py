from handling import *


if not driver.current_url == url_mega:
    driver.get(url_mega)
start_page = 0
while start_page < 90:
    go_page(start_page)
    collect_data_mega()
    write_dictionary_to_csv()
    if csv_data_dict['id'] == '00001':
        break
    start_page += 1
close_browser()
