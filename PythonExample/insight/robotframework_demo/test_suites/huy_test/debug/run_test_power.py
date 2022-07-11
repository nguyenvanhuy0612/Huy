from handling import *

if not driver.current_url == url_power:
    driver.get(url_power)
    print(driver.current_url)

while start_page < 80:
    go_page(start_page)
    collect_data_power()
    write_dictionary_to_csv()
    start_page += 1
    if csv_data_dict['id'] == '00001':
        break
