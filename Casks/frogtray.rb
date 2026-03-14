cask "frogtray" do
  version "1.5"
  sha256 "118f0cb9bd2e87899842701101b78a993d6d64371d5f4791c1f3fa2b9c2eb171"

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
