check_logs() {
  echo "Checking logs for suspicious activity..."
 if grep "sshd.*Failed password" /var/log/auth.log || grep "sshd.*Accepted password" /var/log/auth.log; then
	 echo "$0"
 else
         echo "No Suspicious Activity Found. "
 fi
}

check_logs
