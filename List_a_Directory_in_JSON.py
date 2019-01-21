# Added some change for testing

import os, json, time

def _walk(path,rootPath=None,getFileNumberBelow=False):
    files, folders = [], []
    for DirDic in os.scandir(path):
        if DirDic.is_dir():
            folders.append(DirDic.path)
        else:
            files.append(DirDic.name)

    files_in_folder = len(files)
    files_below = 0

    dict_object = {'_files_':files}
    dict_object['_subDirectories_'] = folders

    for folder in folders:
        if rootPath == None:
            num_files_from_subfolder, dict_object[folder.split(path)[1]] = _walk(folder,path,getFileNumberBelow=True)
        else:
            num_files_from_subfolder, dict_object[folder.split(rootPath)[1]] = _walk(folder,path,getFileNumberBelow=True)
        files_below += num_files_from_subfolder
    num_files_in_branch = files_in_folder + files_below

    dict_object['_numFilesInBranch_'] = num_files_in_branch

    if getFileNumberBelow:
        return (num_files_in_branch, dict_object)
    else:
        return dict_object

def create_index():
    rootPath = ''
    while len(rootPath)<1:
        rootPath = input('Please specify a root-path to start the scan.\nType ./ to use the current path:\n')
    resultsFileName = os.path.join(os.path.abspath(rootPath),'dir_inventory.json')
    print(f'Now: Listing all Documents recursively from the root-path "{rootPath}"')
    indexObject = {
        'scanRoot':os.path.abspath(rootPath),
        'scanTimeUnix':int(time.time()),
        'scanResult': {
            '.':_walk(rootPath),
        }
    }
    print(f'Now: Writing the Results to file, see: \n{resultsFileName}\nCan be viewed in a browser.')
    with open(resultsFileName,'w') as f:
        json.dump(indexObject,f)

    print('All Done!')

print('Creating a JSON-file listing all Documents found recursively starting from the root-directory.')
create_index()
