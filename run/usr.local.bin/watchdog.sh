#!/bin/bash


# define sleep period between loops
sleep_period_secs=30

# define sleep period between incoming port checks
sleep_period_incoming_port_secs=1800

# sleep period counter - used to limit number of hits to external website to check incoming port
sleep_period_counter_secs=0

# while loop to check ip and port
while true; do

	# reset triggers to negative values
	privoxy_running="false"
	ip_change="false"


	# run script to get all required info
	source /usr/local/bin/preruncheck.sh

	# if vpn_ip is not blank then run, otherwise log warning
	if [[ ! -z "${vpn_ip}" ]]; then

		if [[ "${ENABLE_PRIVOXY}" == "yes" ]]; then

			# check if privoxy is running, if not then skip shutdown of process
			if ! pgrep -fa "/usr/sbin/privoxy" > /dev/null; then

				echo "[info] Privoxy not running"

			else

				# mark as privoxy as running
				privoxy_running="true"

			fi

		fi

		if [[ "${ENABLE_PRIVOXY}" == "yes" ]]; then

			if [[ "${privoxy_running}" == "false" ]]; then

				# run script to start privoxy
				source /usr/local/bin/privoxy.sh

			fi

		fi

	else

		echo "[warn] VPN IP not detected, VPN tunnel maybe down"

	fi

	if [[ "${DEBUG}" == "true" ]]; then

		echo "[debug] VPN IP is ${vpn_ip}"

	fi

	# increment sleep period counter - used to limit number of hits to external website to check incoming port
	sleep_period_counter_secs=$((sleep_period_counter_secs+"${sleep_period_secs}"))

	sleep "${sleep_period_secs}"s

done
