IS_ROOT=([[ $EUID -eq 0 ]])
eval $IS_ROOT || echo "You must be root!" && eval $IS_ROOT || exit 12

# REPO_JSON=$(curl https://api.github.com/repos/ziglang/zig/releases/latest 2>/dev/null)
# REPO_VERSION=$(echo $REPO_JSON | jq -r ".tag_name")
# REPO_TAR_URL=$(echo $REPO_JSON | jq -r ".tarball_url")

CURRENT_VERSION=$(zig version 2>/dev/null || echo 0)
echo "CURRENT_VERSION=$CURRENT_VERSION"
echo
# echo "REPO_VERSION=$REPO_VERSION"
# echo "REPO_TAR_URL=$REPO_TAR_URL"

# Временное решение
REPO_VERSION="master"
FOLDER_NAME="zig-x86_64-linux-${REPO_VERSION}"
TAR_NAME="${FOLDER_NAME}.tar.xz"
STR_JQ=".\"${REPO_VERSION}\"".'"x86_64-linux".tarball'

ZIG_JSON=$(curl -s https://ziglang.org/download/index.json)
ZIG_URL_NEW_VERSION=$(echo $ZIG_JSON | jq -r $STR_JQ)
echo "ZIG_URL_NEW_VERSION=$ZIG_URL_NEW_VERSION"

echo "Download..."
curl -L $ZIG_URL_NEW_VERSION --output $TAR_NAME
echo "Unpacking ${TAR_NAME}"
tar -xvf $TAR_NAME

TAR_FOLDER_NAME=$(tar --list --file $TAR_NAME | head -n 1)
echo
echo "Moving ${TAR_FOLDER_NAME} to /usr/lib/zig"
mkdir -p /usr/lib/zig
# mv $TAR_FOLDER_NAME/* /usr/lib/zig
# ln -fs /usr/lib/zig/zig /usr/bin/zig
# rm $TAR_NAME

echo "Installed new version of zig: $(zig version)"
