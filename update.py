#!/usr/bin/env python3

from hashlib import sha256
from os import remove, rename
from re import sub
from urllib.request import urlretrieve
from sys import argv

URL_TEMPLATE = 'https://github.com/{}/{}/archive/refs/tags/{}.zip'


def download_zip(url: str) -> str:
    path, _ = urlretrieve(url, '.download.zip')
    return path


def hash_zip(path: str) -> str:
    with open(path, 'rb') as file:
        sha256_hash = sha256(file.read()).hexdigest()
    remove(path)
    return sha256_hash


def update(url: str, formula: str, sha256_hash: str):
    with open(f'{formula}', 'r') as input:
        with open(f'{formula}.tmp', 'w') as output:
            for line in input:
                if 'url' in line:
                    new_url = f'    url "{url}"\n'
                    output.write(new_url)
                elif 'sha256' in line:
                    new_line = sub(r'sha256\s"[a-z0-9]{64}"', f'sha256 "{sha256_hash}"', line)
                    output.write(new_line)
                else:
                    output.write(line)

    remove(formula)
    rename(f'{formula}.tmp', formula)


def main(user: str, app: str, version: str):
    url = URL_TEMPLATE.format(user, app, version)
    formula = f'Formula/{app}/{app}.rb'

    sha256_hash = hash_zip(download_zip(url))
    update(url, formula, sha256_hash)


if __name__ == '__main__':
    command = argv[1:]
    match command:
        case [user, app, version]: main(user, app, version)
