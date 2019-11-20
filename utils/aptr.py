# utility to add problem statement to readme
import os
import re

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
README_TEMPLATE = os.path.join(BASE_DIR, 'utils/readme_template.md')
LEX_FILES = list(
    filter(lambda file: re.match(r'.*.lex', file), os.listdir(BASE_DIR)))

LEX_FILES.sort(key=lambda file: int(file[1:-4]) if '_' not in file else int(file.split('_')[0][1:]))

ps = dict()

for file in LEX_FILES:
    with open(os.path.join(BASE_DIR, file)) as t:
        lines = list(map(lambda line: line.replace("\n", ""), t.readlines()))
        if not lines[3].lstrip().lstrip('//').split():
            ps[lines[0].lstrip().lstrip('//').split()
               [2]] = lines[2].lstrip().lstrip('// Problem: ')
        else:
            if lines[0].lstrip().lstrip('//').split()[2] not in ps:
                ps[lines[0].lstrip().lstrip('//').split()[2]] = [
                    lines[2].lstrip().lstrip('// Problem: '),
                    lines[3].lstrip().lstrip('//').split()[1]
                ]
            else:
                ps[lines[0].lstrip().lstrip('//').split()[2]].append(
                    lines[3].lstrip().lstrip('//').split()[1])

formatted_ps = list()

for k, v in ps.items():
    if type(v) is str:
        formatted_ps.append(f'{k}. [{v}](p{k}.lex)\n')
    else:
        temp = ""
        for i in v[1:]:
            temp += f'\t* [approach {i}](p{k}_{i}.lex)\n'
        formatted_ps.append(f'{k}. {v[0]}\n' + temp)

formatted_ps[-1] = re.sub(r'\n$', '', formatted_ps[-1])

with open(README_TEMPLATE) as t:
    contents = t.read().format(statements=''.join(formatted_ps))

with open(f'{BASE_DIR}/README.md', 'w') as t:
    t.writelines(contents)