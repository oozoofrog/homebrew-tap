cask "frogtray" do
  version "1.2"
  sha256 "01fa844b59c11fd732d700c7e133e132f623532c0df50d169d9e356b3d076b5d"

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
