#!/bin/zsh

SRC="${1:-/Applications}"
DST="${2:-/Applications/app}"

mkdir -p "$DST"

for app in "$SRC"/*.app; do
  [ -d "$app" ] || continue

  plist="$app/Contents/Info.plist"
  [ -f "$plist" ] || continue

  bundle_id=$(/usr/libexec/PlistBuddy -c "Print :CFBundleIdentifier" "$plist" 2>/dev/null)

  if [[ "$bundle_id" == com.apple.* ]]; then
    echo "跳过系统应用: $(basename "$app")"
    continue
  fi

  echo "移动第三方应用: $(basename "$app")"
  mv "$app" "$DST/"
done

echo "完成。第三方应用已移动到: $DST"