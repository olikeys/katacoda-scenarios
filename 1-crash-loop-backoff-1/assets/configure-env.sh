show_progress()
{
  echo -n "Starting"
  echo ""
  local -r pid="${1}"
  local -r delay='0.75'
  local spinstr='\|/-'
  local temp
  echo -n "Configuring environment, hold tight"
  while true; do 
    sudo grep -i "done" /root/katacoda-background-finished &> /dev/null
    if [[ "$?" -ne 0 ]]; then     
      temp="${spinstr#?}"
      printf " [%c]  " "${spinstr}"
      spinstr=${temp}${spinstr%"${temp}"}
      sleep "${delay}"
      printf "\b\b\b\b\b\b"
    else
      break
    fi
  done
  printf "    \b\b\b\b"
  echo ""
  echo "Configured"
}

show_progress
