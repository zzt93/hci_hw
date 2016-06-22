a=13
for i in *.jpeg; do
  new=$(printf "branch%d.jpeg" "$a") #04 pad to length of 4
  mv -- "$i" "$new"
  let a=a+1
done

