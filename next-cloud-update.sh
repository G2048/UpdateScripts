GIT_RELEASE_VERSION=$(curl https://api.github.com/repos/nextcloud-releases/server/releases/latest 2>/dev/null | jq -r '.tag_name')
GIT_DOWNLOAD_URL=$(curl https://api.github.com/repos/nextcloud-releases/server/releases/latest 2>/dev/null | jq -r '.assets[] | .browser_download_url' | grep 'zip$')

