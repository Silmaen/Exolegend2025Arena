echo "Basculer vers terrain : $1"
rm field/coins.fld
rm field/walls.lbt
cp field/coins-$1.fld
cp field/walls-$1.lbt