file=$1
path=$(pwd)

if [ -f "${path}/${file}" ]
then
    lex "${path}/${file}"
    gcc "${path}/lex.yy.c"
    echo "done."
fi