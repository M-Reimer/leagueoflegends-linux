#!/bin/sh
##########################################
# Original authors of this script: #
# https://www.reddit.com/user/FakedCake/ #
# https://gist.github.com/ldericher #
# https://gist.github.com/ObserverOfTime #
##########################################

#############
# CONSTANTS #
#############

UX_NAME='LeagueClientUx.exe'

#############
# FUNCTIONS #
#############

die() {
    printf 'ERROR: %s\n' "${1}"
    exit 1
}

wait_for() {
    timeout "${1}" sh -c "until ${2}; do sleep 1; done"
}


########
# MAIN #
########

# find pid of LeagueClientUx process
printf 'Waiting for process of "%s" ... ' "${UX_NAME}"
ux_pid=$(wait_for 2m "pidof '${UX_NAME}'")
printf 'OK\n'

if [ -z "${ux_pid}" ]; then
    die "Could not find processes of '${UX_NAME}'"
fi

printf '%s pid found: %d\n' "${UX_NAME}" "${ux_pid}"

# find port of LeagueClientUx process
ux_port=$(sed -rn 's/.*--app-port=([0-9]+).*/\1/p' "/proc/${ux_pid}/cmdline")

if [ -z "${ux_port}" ]; then
    die "Could not find port of '${UX_NAME}' process!"
fi

printf '%s port found: %d\n' "${UX_NAME}" "${ux_port}"

# pause LeagueClientUx process
kill -STOP "${ux_pid}"

printf 'Waiting for port %s ... ' "${ux_port}"
wait_for 5m "printf 'Q\n' | openssl s_client -connect ':${ux_port}' >/dev/null 2>&1"
printf 'OK\n'

# continue LeagueClientUx process
kill -CONT "${ux_pid}"

# finalize
printf '%s continues, my job is done!\n' "${UX_NAME}"
