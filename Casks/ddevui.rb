cask "ddevui" do
  arch arm: "arm64", intel: "x64"

  version "0.2.4"
  sha256 arm:   "c1dcd4db51b40cc7cb881e7b8891c7e1e6fcb290cf01de31a37ac3109c5ebaf6",
         intel: "e9c281c491eefe5696ae463013f74c274deaf92b8f932483644a4f4d5972177a"

  url "https://github.com/shiv122/ddev-ui/releases/download/v#{version}/ddevui-#{version}-mac-#{arch}.dmg",
      verified: "github.com/shiv122/ddev-ui/"
  name "DDevUI"
  desc "Desktop UI for managing DDEV local development environments"
  homepage "https://github.com/shiv122/ddev-ui"

  depends_on macos: :big_sur

  app "DDevUI.app"

  # The app is ad-hoc signed but not notarized (no Apple Developer ID), so it
  # cannot pass Gatekeeper's notarization check. Strip the quarantine flag that
  # Homebrew applies on download so the app launches without a security prompt.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/DDevUI.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/ddevui",
    "~/Library/Preferences/com.zaraffasoft.ddevui.plist",
    "~/Library/Saved Application State/com.zaraffasoft.ddevui.savedState",
  ]
end
