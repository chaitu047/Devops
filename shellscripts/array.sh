arr=()

for ((i=0;i<=10;i++))
do
    arr+=("x-user-$i")
done

for j in $arr
do
    echo $j
done