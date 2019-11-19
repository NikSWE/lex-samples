file=$1
cd $(pwd)

if [ -f $file ]
then
    lex $file
    gcc lex.yy.c
    echo "running."
    ./a.out
fi