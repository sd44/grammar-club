#!/usr/bin/env python
import re


def convert(str):
    result = re.sub(r'^[0-9]*\.', r'\\item', str, flags=re.M)
    result = re.sub(r'__', r'\\ttu', result)
    result = re.sub(r'\(A\)\n', r'\\begin{tasks}(2)\n  \\task ', result)
    result = re.sub(r'\([B-F]\)\n', r'  \\task ', result)
    result = re.sub(r'Show Answer', r'\\end{tasks}\n', result)
    return result


if __name__ == '__main__':
    with open("test.tex", mode="rb") as myfile,\
         open("result.tex",'wt') as outfile:
        str = myfile.read().decode("utf-8")
        str = '\\begin{enumerate}\n' + str
        str = convert(str)

        outfile.write(str + '\\end{enumerate}\n')
