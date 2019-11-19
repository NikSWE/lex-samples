# utility to add problem statement to readme
import os
import re

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
README_TEMPLATE = os.path.join(BASE_DIR, 'utils/readme_template.md')
LEX_FILES = list(
    filter(lambda file: re.match(r'.*.lex', file), os.listdir(BASE_DIR)))

ps = dict()

for file in LEX_FILES:
    with open(os.path.join(BASE_DIR, file)) as t:
        lines = list(map(lambda line: line.replace("\n", ""), t.readlines()))
        ps[str(lines[0].lstrip().lstrip('//').split()[2])] = str(
            lines[2].lstrip().lstrip('// Problem: '))

formatted_ps = list()

for k, v in ps.items():
    formatted_ps.append(f'{k}. [{v}](p{k}.lex)\n')

formatted_ps[-1] = formatted_ps[-1].replace('\n', '')

with open(README_TEMPLATE) as t:
    contents = t.read().format(statements=''.join(formatted_ps))

with open(f'{BASE_DIR}/README.md', 'w') as t:
    t.writelines(contents)