#! /bin/bash

# Bundles the files in this repository up for release.
#
# Usage: ./scripts/make-release.sh [--update-sources]
#
# The version is taken from typst.toml. With --update-sources, the
# `@preview/<PACKAGE>:<VERSION>` imports in README.md and template/main.typ
# are also updated in place to match it.
#
# The resulting release package will be in release/preview/<PACKAGE>/<VERSION>.

set -euo pipefail

UPDATE_SOURCES=${1:-}

if [[ -n "$UPDATE_SOURCES" && "$UPDATE_SOURCES" != "--update-sources" ]]; then
    echo "Unknown option: $UPDATE_SOURCES"
    echo "Usage: ./scripts/make-release.sh [--update-sources]"
    exit 1
fi

PACKAGE=$(sed -n 's/^name = "\(.*\)"/\1/p' typst.toml | head -n 1)
VERSION=$(sed -n 's/^version = "\(.*\)"/\1/p' typst.toml | head -n 1)

if [ -z "$PACKAGE" ]; then
    echo "Could not determine package name from typst.toml."
    exit 1
fi

if [ -z "$VERSION" ]; then
    echo "Could not determine package version from typst.toml."
    exit 1
fi

RELEASE_DIR="release/preview/$PACKAGE/$VERSION"

replace_version_refs() {
    local file=$1

    sed -i.bak -E \
        -e "s/@preview\/$PACKAGE:[0-9]+\.[0-9]+\.[0-9]+/@preview\/$PACKAGE:$VERSION/g" \
        "$file"
    rm -f "$file.bak"
}

if [[ "$UPDATE_SOURCES" == "--update-sources" ]]; then
    echo "Updating source files to version $VERSION."
    replace_version_refs README.md
    replace_version_refs template/main.typ
fi

rm -rf "$RELEASE_DIR"
mkdir -p "$RELEASE_DIR/logos/rgb" "$RELEASE_DIR/template"

cp lib.typ "$RELEASE_DIR/lib.typ"
cp README.md "$RELEASE_DIR/README.md"
cp LICENSE "$RELEASE_DIR/LICENSE"
cp thumbnail.png "$RELEASE_DIR/thumbnail.png"
cp logos/rgb/uds-logo.png "$RELEASE_DIR/logos/rgb/uds-logo.png"
cp template/main.typ "$RELEASE_DIR/template/main.typ"
cp template/custom.bib "$RELEASE_DIR/template/custom.bib"
cp typst.toml "$RELEASE_DIR/typst.toml"

replace_version_refs "$RELEASE_DIR/README.md"
replace_version_refs "$RELEASE_DIR/template/main.typ"

echo "Package $PACKAGE $VERSION is ready for release in $RELEASE_DIR."
