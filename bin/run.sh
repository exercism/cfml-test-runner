#!/usr/bin/env bash

# Synopsis:
# Run the test runner on a solution.

# Arguments:
# $1: exercise slug
# $2: path to solution folder
# $3: path to output directory

# Output:
# Writes the test results to a results.json file in the passed-in output directory.
# The test results are formatted according to the specifications at https://github.com/exercism/docs/blob/main/building/tooling/test-runners/interface.md

# Example:
# ./bin/run.sh two-fer path/to/solution/folder/ path/to/output/directory/

set -euo pipefail

# If any required argument is missing, print the usage and exit
if [[ -z "$1" || -z "$2" || -z "$3" ]]; then
  echo "usage: ./bin/run.sh exercise-slug path/to/solution/folder/ path/to/output/directory/"
  exit 1
fi

slug="$1"
input_dir="${2%/}"
output_dir="${3%/}"
results_file="${output_dir}/results.json"

if ! mkdir -p "${output_dir}"; then
  jq -n '{"version": 2, "status": "error", "message": "The test runner failed to create the output directory for your test run. Please open a thread on the Exercism forums."}' > "${results_file}"
  exit 1
fi

echo "${slug}: testing..."

script_dir="${BASH_SOURCE[0]%/*}"

# Avoid DNS lookup since no network access in prod
echo "127.0.0.1 $(hostname)" > /tmp/hosts
export JAVA_TOOL_OPTIONS="-Djdk.net.hosts.file=/tmp/hosts"

# Need a writable home directory
export BOXLANG_HOME=/tmp/.boxlang

boxlang "${script_dir}/test-runner.bxs" "${input_dir}" "${output_dir}" > /dev/null 2>&1 || true

if [[ ! -f "${results_file}" ]]; then
  jq -n '{"version": 2, "status": "error", "message": "The test runner failed to run your tests. Please open a thread on the Exercism forums."}' > "${results_file}"
fi

jq . "${results_file}" > "${results_file}.tmp" && mv "${results_file}.tmp" "${results_file}"

echo "${slug}: done"
