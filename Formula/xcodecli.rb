class Xcodecli < Formula
  desc "Go CLI wrapper around xcrun mcpbridge"
  homepage "https://github.com/oozoofrog/xcodecli"
  url "https://github.com/oozoofrog/xcodecli/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "0c30902750be2943cd7cc2bbbce101875eb18aa74518de3771d49a7616dd7f33"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"xcodecli", ldflags: "-s -w -X main.cliVersion=v#{version} -X main.cliBuildChannel=release"), "./cmd/xcodecli"
  end

  test do
    output = shell_output("#{bin}/xcodecli help")
    assert_match "xcodecli wraps xcrun mcpbridge", output
    assert_match "v#{version}", shell_output("#{bin}/xcodecli version")
  end
end
