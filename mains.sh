
TG_BOT_TOKEN="YOUR_NEW_BOT_TOKEN"
TG_CHAT_ID="YOUR_CHAT_ID"
ENABLE_STATS="true"

send_stats() {
    [[ "$ENABLE_STATS" == "false" ]] && return 0
    [[ -z "$TG_BOT_TOKEN" || -z "$TG_CHAT_ID" ]] && return 0

    local country
    local os_info
    local cpu_arch
    local hostname
    local status="$1"

    country=$(curl -fsS --max-time 3 \
        https://ipinfo.io/country 2>/dev/null || echo "Unknown")

    os_info=$(
        grep '^PRETTY_NAME=' /etc/os-release 2>/dev/null |
        cut -d '=' -f2 | tr -d '"'
    )

    cpu_arch=$(uname -m)
    hostname=$(hostname)

    local message
    message="Windows 11 Installer

Server: ${hostname}
Country: ${country}
OS: ${os_info}
Architecture: ${cpu_arch}
Target: Windows 11 Pro
Language: English (en-us)
Status: ${status}
Time: $(date -u '+%Y-%m-%d %H:%M UTC')"

    curl -fsS --max-time 5 \
        -X POST \
        "https://api.telegram.org/bot${TG_BOT_TOKEN}/sendMessage" \
        --data-urlencode "chat_id=${TG_CHAT_ID}" \
        --data-urlencode "text=${message}" \
        >/dev/null 2>&1 || true
}
