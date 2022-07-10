from bs4 import BeautifulSoup
import re
import os
from pathlib import Path
import csv


def save_file(content, path):
    file_object = Path(path)
    file_object.parent.mkdir(exist_ok=True, parents=True)
    file_object.write_text(content, encoding='utf-8', newline='')


def read_data(file_name):
    raw_file = open(file_name, mode='r', encoding='utf-8')
    raw_data = raw_file.read()
    raw_file.close()
    soup_data = BeautifulSoup(markup=raw_data, features='html.parser', from_encoding='utf-8')
    return soup_data


def read_data2(file_name):
    with open(file_name, mode='rb') as f:
        raw_data = f.read()
    soup_data = BeautifulSoup(markup=raw_data, features='html.parser')
    return soup_data


def process_data(soup_data):
    list_data = soup_data.find(id='list_sale_price')
    groups = list_data.find_all(attrs={"class": "group-product"})
    data_result = {}
    for group in groups:
        header = group.find(name='div', class_="group-name", recursive=False).get_text().replace("/", "")
        row_data = []
        for rows in group.find_all(name='div', class_="table-row", recursive=False):
            cell_data = []
            for cell in rows.find_all(name='div', class_=re.compile("tb-col-")):
                cell_text = cell.get_text()
                cell_text = cell_text if cell_text is not None else ''
                cell_data.append(cell_text)
            row_data.append(cell_data)
        data_result[header] = row_data
    return data_result


def save_to_file(data_result: dict):
    for header, list_row in data_result.items():
        new_file_object = open("data2/" + header + ".tsv", "w", encoding="utf-8", newline='')
        file_writer = csv.writer(new_file_object, delimiter='\t')
        file_writer.writerow(['', header, '', ''])
        for row in list_row:
            file_writer.writerow(row)
        new_file_object.close()


if __name__ == '__main__':
    file = 'thns.html'
    soup = read_data2(file)
    result = process_data(soup)
    save_to_file(result)
