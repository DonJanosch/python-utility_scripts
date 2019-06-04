import os, datetime
timestamp = datetime.datetime.now().strftime('%Y%m%d-%H_%M_%S')
thisdir = os.getcwd()
print('Indexing {} please wait...'.format(thisdir))
folder_name = os.path.basename(thisdir)
file_list = ['','']
for r, d, f in os.walk(thisdir):
    for file in f:
        file_list.append(os.path.join(r.split(thisdir)[1], file))	
file_list[0] = 'Folgende Dateien ({}) sind am {} im Root-Verzeichniss "{}" enthalten:'.format(len(file_list),timestamp,thisdir)
file_path = os.path.join(thisdir,'{}_Inhaltsverzeichnis_{}.txt'.format(timestamp,folder_name))
with open(file_path,'w') as d:
    for f in file_list:
        d.write(f+'\n')
print('All Done. Produced scan-result-file "{}".'.format(file_path ))