#! /usr/bin/env bash
# Time-stamp: <>
################################################################################
# ${1:$$(replace-regexp-in-string "_" " " (file-name-nondirectory (file-name-sans-extension(buffer-file-name))))} - $0
#
# Usage: see `(replace-regexp-in-string "_" " " (file-name-nondirectory (file-name-sans-extension(buffer-file-name))))` -h
################################################################################
# set -o nounset -o errexit -o pipefail
set -o errexit -o pipefail
#set -x

# Local variables
#SCRIPTDIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#TOP_DIR="$(  cd "$( dirname "${BASH_SOURCE[0]}" )" && git rev-parse --show-toplevel)"
CMD_PREFIX="echo"
OPTS=

################################################################################
warning() { echo -e "/!\\ WARNING: $*"; }
error() { echo -e "*** ERROR *** $*"; }
print_error_and_exit() {
  error "$*"
  exit 1
}
usage() {
  cat <<EOF
$(basename "$0"):

USAGE
  $0 [-x]

OPTIONS:
  -n --dry-run    Dry run mode (**DEFAULT** mode): echo the commands to be run
  -x --exec       Really execute the commands, i.e. don't just echo them

EXAMPLE
  $(basename "$0")  # Dry-run: show commands to be executed 
  $(basename "$0") -x 
EOF
}
################################################################################
###
# print warning when running in echo mode (default behaviour)
##
warning_dry_run() {
  if [ -n "${CMD_PREFIX}" ]; then
    echo ""
    warning "DRY-RUN MODE!!! Suffix with '-x' to REALLY execute the commands, i.e. use:"
    warning "   $0 [...] -x"
    exit 0
  fi
}
####
# ask to continue. exit 1 if the answer is no
##
really_continue() {
  echo -e -n "[${COLOR_VIOLET}/!\\ WARNING:${COLOR_RESET}] Are you sure you want to continue? [Y|n] "
  read -r ans
  case $ans in
  n* | N*) exit 1 ;;
  esac
}

################################################################################
#[ $UID -gt 0 ] && print_error_and_exit "You must be root to execute this script (current uid: $UID)"
[[ "$*" =~ [[:space:]]"-x" ]] && CMD_PREFIX=
# Check for options
while [ $# -ge 1 ]; do
  case $1 in
  -h | --help)
    usage
    exit 0
    ;;
  -n | --dry-run) CMD_PREFIX="echo" ;;
  -x | --exec) CMD_PREFIX= ;;
  *)
    OPTS="$*"
    break
    ;;
  esac
  shift
done

# Safeguards
# [...]

# Let's go
CMD="whoami ${OPTS}"

#################################################
warning "about to execute the following command:"
# shellcheck disable=SC2001
echo "${CMD}" | sed 's/\s-/\n\t\t-/g'
warning_dry_run
really_continue
${CMD}
