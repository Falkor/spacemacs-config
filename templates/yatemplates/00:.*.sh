#! /usr/bin/env bash
# Time-stamp: <Sat 2025-11-15 13:13 svarrette>
################################################################################
# ${1:$$(replace-regexp-in-string "_" " " (file-name-nondirectory (file-name-sans-extension(buffer-file-name))))} - $0
#
# Usage: see `(replace-regexp-in-string "_" " " (file-name-nondirectory (file-name-sans-extension(buffer-file-name))))` -h
################################################################################
# set -o nounset -o errexit -o pipefail
set -o errexit -o pipefail
#set -x

# cosmetics
COLOR_BOLD="\033[1m"
COLOR_VIOLET="\033[0;35m"
COLOR_RESET="\033[0m"

# Local variables
#SCRIPTDIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#TOP_DIR="$(  cd "$( dirname "${BASH_SOURCE[0]}" )" && git rev-parse --show-toplevel)"
CMD_PREFIX="echo"
FORCE=
OPTS=

################################################################################
info()    { echo -e "\${COLOR_BOLD}$*\${COLOR_RESET}"; }
error()   { echo -e "\${COLOR_BOLD}*** ERROR *** $*\${COLOR_RESET}"; }
# error() { echo -e "*** ERROR *** $*"; }
warning() { echo -e "\${COLOR_VIOLET}/!\\ WARNING:\${COLOR_RESET} $*"; }
# warning() { echo -e "/!\\ WARNING: $*"; }
print_error_and_exit() { error "$*"; exit 1; }
usage() {
  cat <<EOF
$(basename "\$0"):

USAGE
  $(basename "\$0") [-f] [-x]

OPTIONS:
  -f --force      Force mode (don't ask anything)
  -n --dry-run    Dry run mode (**DEFAULT** mode): echo the commands to be run
  -x --exec       Really execute the commands, i.e. don't just echo them

EXAMPLE
  $(basename "\$0")    # Dry-run: show commands to be executed
  $(basename "\$0") -x
EOF
}
################################################################################
###
# print warning when running in echo mode (default behaviour)
##
warning_dry_run() {
  if [ -n "\${CMD_PREFIX}" ]; then
    echo ""
    warning "DRY-RUN MODE!!! Suffix with '-x' to REALLY execute the commands, i.e. use:"
    warning "   \$0 [...] -x"
    exit 0
  fi
}
###
# Ask for a question - return 0 (true) if Yes is answered (default value)
##
ask(){
  [ -n "\${FORCE}" ] && return 0 # aka don't ask...
  echo -n -e "\${COLOR_VIOLET}/!\ WARNING:\${COLOR_RESET} $* [Y|n] "
  read                                          #   0: true     1:false
  [[ -z "$REPLY" || $REPLY =~ ^[Yy].*$ ]] && return 0 || return 1
}
# As above, but return 0 (true) if No is answered
avoid(){
  [ -n "\${FORCE}" ] && return 0 # aka don't ask...
  echo -n -e "\${COLOR_VIOLET}/!\ WARNING:\${COLOR_RESET} $* [y|N] "
  read                                          #   0: true     1:false
  [[ -z "$REPLY" || $REPLY =~ ^[Nn].*$ ]] && return 0 || return 1
}
####
# ask to continue. exit 1 if the answer is no
##
really_continue() { ask "Are you sure you want to continue?" || exit 1; }

################################################################################
#[ $UID -gt 0 ] && print_error_and_exit "You must be root to execute this script (current uid: $UID)"
[[ "$*" =~ [[:space:]]"-x" ]] && CMD_PREFIX=
# Check for options
while [ $# -ge 1 ]; do
  case \$1 in
  -h | --help) usage; exit 0;;
  -n | --dry-run) CMD_PREFIX="echo" ;;
  -x | --exec)    CMD_PREFIX= ;;
  *) OPTS="$*"; break;;
  esac
  shift
done

# Safeguards
# check availability of the used commands
# for cmd in python3; do
#   [ ! -x "$(command -v \${cmd} 2>/dev/null)" ] && print_error_and_exit "Unable to find the command \${cmd}. Exiting"
# done
# [...]

# Let's go
CMD="whoami"
# [...]
CMD+=" \${OPTS}" # don't forget ' '
# Alternative usage: just prefix all your commands with \{CMD_PREFIX}. Ex: \{CMD_PREFIX} whoami
#
#################################################
warning "about to execute the following command:"
# shellcheck disable=SC2001
echo "\${CMD}" | sed 's/\s-/\n\t\t-/g'
warning_dry_run
really_continue

\${CMD}
