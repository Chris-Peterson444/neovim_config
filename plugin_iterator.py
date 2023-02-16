import re
import sys
from typing import List
# single_line = re.compile(r"use\s*[({]+['\"]([\.a-zA-Z/-]*)['\"][,)}]+")
all = re.compile(r"['\"]([a-zA-Z\.\-0-9]*/[a-zA-Z\.\-0-9]*)['\"]")


def write_readme(packages_list: List[str]) -> None:
    packages = set(packages_list)
    extension_list = './extensions_list.tmp'
    content = ''
    for p in packages:
        content += f'- [{p}](https://www.github.com/{p})\n'
    with open(extension_list, 'w') as file:
        file.write(content)

    return None


def main() -> int:

    with open('lua/vincen/packer.lua', 'r') as packer_file:
        contents = packer_file.read()
        packages = all.findall(contents)
        # this is really expensive but I'm being lazy right now
        used_packages = []
        for p in packages:
            using = True
            for line in contents.splitlines():
                if p in line and '-- disabled' in line:
                    using = False
                    break
            if using:
                used_packages.append(p)

        write_readme(used_packages)

    return 0


if __name__ == "__main__":
    sys.exit(main())
