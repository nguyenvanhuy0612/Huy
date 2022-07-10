from bs4 import BeautifulSoup
import re
import os
from pathlib import Path
import csv

#
# with open("gia.html", "br") as f:
#     raw_data = f.read()
#
raw_file = open('thns.html', mode='r', encoding='utf-8')
raw_data = raw_file.read()
raw_file.close()


soup = BeautifulSoup(markup=raw_data, features='html.parser', from_encoding='utf-8')
# print(soup.prettify())

list_data = soup.find(id='list_sale_price')


def save_file(content, path):
    file_object = Path(path)
    file_object.parent.mkdir(exist_ok=True, parents=True)
    file_object.write_text(content, encoding='utf-8', newline='')


groups = list_data.find_all(attrs={"class": "group-product"})

data_file = "datafile.tsv"
for group in groups:
    header = group.find(name='div', class_="group-name", recursive=False).get_text().replace("/", "")
    print(header)
    new_file = "data4/" + header + ".tsv"
    if os.path.exists(new_file):
        os.remove(new_file)
    output_file = Path(new_file)
    output_file.parent.mkdir(exist_ok=True, parents=True)
    output_file.write_text("\t" + header + "\t" + "\t", newline=True)
    save_file("\t" + header + "\t" + "\t", new_file)
    rows = group.find_all(name='div', class_="table-row", recursive=False)
    for row in rows:
        rData1 = row.find(name='div', class_="tb-col-1", recursive=False).get_text()
        rData2 = row.find(name='div', class_="tb-col-2", recursive=False).find('a').get_text()
        rData3 = row.find(name='div', class_="tb-col-3", recursive=False).get_text()
        rData4 = row.find(name='div', class_="tb-col-4", recursive=False).get_text()
        rData1 = "" if rData1 is None else rData1
        rData2 = "" if rData2 is None else rData2
        rData3 = "" if rData3 is None else rData3
        rData4 = "" if rData4 is None else rData4
        rowData = rData1 + "\t"+ rData2 + "\t"+ rData3 + "\t"+ rData4
        #print(rowData)
        save_file(rowData, new_file)


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

for header, list_row in data_result.items():
    new_file_object = open("data/" + header + ".tsv", "w", encoding="utf-8")
    file_writer = csv.writer(new_file_object, delimiter='\t')
    file_writer.writerow(['', header, '', ''])
    for row in list_row:
        file_writer.writerow(row)
    new_file_object.close()