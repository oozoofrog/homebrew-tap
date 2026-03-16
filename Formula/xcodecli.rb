class Xcodecli < Formula
  desc "Go CLI wrapper around xcrun mcpbridge"
  homepage "https://github.com/oozoofrog/xcodecli"
  url "https://github.com/oozoofrog/xcodecli/archive/refs/tags/v0.5.3.tar.gz"
  sha256 "2d3bcb977e13ceaebafeae675fe8dd378f15550676e38addc88ab2e45fd28395"
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
