class Xcodemcp < Formula
  desc "Go CLI wrapper around xcrun mcpbridge"
  homepage "https://github.com/oozoofrog/xcodemcp-cli"
  url "https://github.com/oozoofrog/xcodemcp-cli/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "8ef2338d13920b00cf5f78b4ac75723210c92ec0bcae78ea928b02ed2877e252"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"xcodemcp"), "./cmd/xcodemcp"
  end

  test do
    output = shell_output("#{bin}/xcodemcp help")
    assert_match "xcodemcp wraps xcrun mcpbridge", output
  end
end
