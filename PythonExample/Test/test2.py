import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from unicodedata import normalize

table_MN = pd.read_html('https://tinhocngoisao.com/bang-gia-ban')

print(table_MN)

df = table_MN[0]
df.head()