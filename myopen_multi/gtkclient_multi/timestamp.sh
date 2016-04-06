while read -r line
do
    newline="[t$(date +%N)] $line"
    echo $newline >> log
done
