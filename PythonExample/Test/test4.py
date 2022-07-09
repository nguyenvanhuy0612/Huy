from bs4 import BeautifulSoup
import re
import os
from pathlib import Path
import csv


with open("gia.html", "br") as f:
    data = f.read()

soup = BeautifulSoup(data, features='html.parser')
# print(soup.prettify())

list_data = soup.find(id='list_sale_price')


def save_file(content, path):
    output_file = Path(path)
    output_file.parent.mkdir(exist_ok=True, parents=True)
    content = (content + '\n').encode('utf-8')
    with open(path, "ab+") as f:
        f.write(content)


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


data = {}
for group in groups:
    header = group.find(name='div', class_="group-name", recursive=False).get_text().replace("/", "")
    #print(header)
    #print(header.encode('utf-8'))
    hData = []
    for rows in group.find_all(name='div', class_="table-row", recursive=False):
        #rowData = ""
        cur_row = []
        list_row = rows.find_all(name='div', class_=re.compile("tb-col-"))
        for row in list_row:
            row_text = row.get_text()
            if (row_text is None):
                row_text = ""
            cur_row.append(row_text)
        hData.append(cur_row)
    data[header] = hData

for header, list_row in data.items():
    new_file_object = open("data/" + header + ".tsv", "a+", encoding="utf-8")
    file_writer = csv.writer(new_file_object, delimiter='\t')
    file_writer.writerow(['', header, '', ''])
    for row in list_row:
        file_writer.writerow(row)
    new_file_object.close()