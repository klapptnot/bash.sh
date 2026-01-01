if [ -v TERMUX_APP__PACKAGE_NAME ]; then
  # barg.sh regex is not valid for bionic glibc
  grep -lr 'include barg.sh' | sed 's#.*/##' | head -n-1
  printf '%s\n' lpwa web-kiosk-wrap
else
  grep -lr '^# termux only$' | sed 's#.*/##'
fi
