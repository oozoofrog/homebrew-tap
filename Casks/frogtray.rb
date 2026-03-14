cask "frogtray" do
  version "1.4"
  sha256 "7e244ae0aaa3c41d57a5ccc8728eacdb6974f7c2c10b23f603ce4cd62e1797b7"

  url "https://github.com/oozoofrog/FrogTray/releases/download/v#{version}/FrogTray-#{version}.dmg"
  name "FrogTray"
  desc "macOS menu bar system monitor"
  homepage "https://github.com/oozoofrog/FrogTray"

  depends_on macos: ">= :ventura"

  app "FrogTray.app"

  zap trash: [
    "~/Library/Preferences/com.oozoofrog.macos.FrogTray.plist",
  ]
end
