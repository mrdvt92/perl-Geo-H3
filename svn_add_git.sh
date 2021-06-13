echo "SVN: Adding ^? Files"
for F in `svn st  |grep '^?' | cut -c2- `
do
  echo "SVN: Adding $F"
  svn add $F
done
