function logInfo() {
    local caller_file="${BASH_SOURCE[1]}";
    local line_number=$1;
    local message=$2;
    logger -s "INFO [$caller_file: $line_number] $message" 2>> log.txt
}

function logError() {
    local caller_file="${BASH_SOURCE[1]}";
    local line_number=$1;
    local message=$2;
    logger -s "ERROR [$caller_file: $line_number] $message" 2>> log.txt
}

function logWarn() {
    local caller_file="${BASH_SOURCE[1]}";
    local line_number=$1;
    local message=$2;
    logger -s "WARN [$caller_file: $line_number] $message" 2>> log.txt
}
