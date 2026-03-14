class Xcodecli < Formula
  desc "Go CLI wrapper around xcrun mcpbridge"
  homepage "https://github.com/oozoofrog/xcodecli"
  url "https://github.com/oozoofrog/xcodecli/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "e264bc2dee7f51d9db197829b1881bab37392845a79fb058d7f8bbdfaa01599b"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"xcodecli", ldflags: "-s -w -X main.cliVersion=v#{version}"), "./cmd/xcodecli"
  end

  test do
    output = shell_output("#{bin}/xcodecli help")
    assert_match "xcodecli wraps xcrun mcpbridge", output
    assert_match "v#{version}", shell_output("#{bin}/xcodecli version")
  end
end
