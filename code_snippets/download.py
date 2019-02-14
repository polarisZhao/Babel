# -*- coding:utf-8 -*-
from __future__ import print_function
import os, sys, urllib, zipfile, requests
from contextlib import closing

                
# Example: download a plane image
# >>> from download import download_image
# >>> download_image("http://imgsrc.baidu.com/forum/pic/item/502ad5a20cf431ad56c799864b36acaf2fdd9892.jpg", "plane.jpg")

def download_image(url, filename):
    headers = {'User-Agent':'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.64 Safari/537.11',
    'Accept':'text/html;q=0.9,*/*;q=0.8',
    'Accept-Charset':'ISO-8859-1,utf-8;q=0.7,*;q=0.3',
    'Accept-Encoding':'gzip',
    'Connection':'close',
    'Referer':None
    }
    with closing(requests.get(url, headers = headers, stream=True)) as response:
        # print(response.content)
        with open(filename, 'wb') as fd:
            for chunk in response.iter_content(128):
                fd.write(chunk)

# Example: download MNIST datasets
# >>> from download import download_dataset
# >>> download_dataset('http://yann.lecun.com/exdb/mnist/train-images-idx3-ubyte.gz')

def download_dataset(url, dirpath = "./"):
    """
        Download Datasets form url; Code Modification of
        "https://github.com/stanfordnlp/treelstm/blob/master/scripts/download.py"
    """
    filename = url.split('/')[-1]
    filepath = os.path.join(dirpath, filename)
    # u = urllib.urlopen(url) # python 2
    u = urllib.request.urlopen(url)  # python 3
    with open(filepath, 'wb') as f:
        filesize = int(u.headers["Content-Length"])
        print("Downloading: %s Bytes: %s" % (filename, filesize))

        downloaded = 0
        block_sz = 8192
        status_width = 70
        while True:
            buf = u.read(block_sz)
            if not buf:
                print('')
                break
            else:
                print('', end='\r')
            downloaded += len(buf)
            f.write(buf)
            status = (("[%-" + str(status_width + 1) + "s] %3.2f%%") %
                ('=' * int(float(downloaded) / filesize * status_width) + '>', downloaded * 100. / filesize))  # 显示状态条
            print(status, end='')
            sys.stdout.flush()
    return filepath