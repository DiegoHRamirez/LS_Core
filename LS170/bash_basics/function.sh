greeting () {
  echo Hello $1
}

greeting 'Peter'


greeting2 () {
  echo "Hello $1"
  echo "Hello $2"
}

greeting2 'Diego' 'Rafa'