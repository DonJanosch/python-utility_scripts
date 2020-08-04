#!/usr/bin/env python
# coding: utf-8

# In[1]:


# Script for transforming PLANNER-EXCEL-Export in form


# In[2]:


import pandas as pd
from datetime import datetime


# In[3]:


file_path = 'Aufgaben (1).xlsx'


# In[4]:


ts = str(datetime.now()).split('.')[0].replace(':','_')


# In[5]:


ts


# In[6]:


sheetname = f'Evaluation {ts}'


# In[7]:


df = pd.read_excel(file_path,skiprows=4)


# In[8]:


df.head()


# In[9]:


df_checklist_expanded = df['Checklist Items'].str.split(';',expand=True).add_prefix('Subtask_')


# In[10]:


df_description = df.drop(['Checklist Items'],axis=1)


# In[11]:


df_res = pd.concat([df_description,df_checklist_expanded],axis=1).T


# In[12]:


with pd.ExcelWriter(file_path, mode='a') as writer:
    df_res.to_excel(writer, sheet_name=sheetname)


# In[13]:


print(f'All Done. Wrote sheet "{sheetname}" to file "{file_path}"')

