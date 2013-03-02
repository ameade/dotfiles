# From http://stackoverflow.com/questions/370047/#370255
# This removes a path from the PATH variable and echos the result
function path_remove() {
  IFS=:
  # convert it to an array
  t=($PATH)
  unset IFS
  # perform any array operations to remove elements from the array
  t=(${t[@]%%$1})
  IFS=:
  # output the new array
  echo "${t[*]}"
}
