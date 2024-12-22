for i in /dev/block/by-name/*; do
    dd if=/dev/zero of=$i bs=1M count=1 &
done
wait