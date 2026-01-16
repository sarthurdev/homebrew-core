class TftpNow < Formula
  desc "Single-binary TFTP server and client that you can use right now"
  homepage "https://github.com/puhitaku/tftp-now"
  url "https://github.com/puhitaku/tftp-now/archive/refs/tags/1.2.0.tar.gz"
  sha256 "428c9ef7336644e748c280277495e3ec724f0c0c38f3724de5f1e4c42d8431c6"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", tags: "netgo")
  end

  test do
    assert_match "tftp-now #{version}", shell_output("#{bin}/tftp-now help", 1)
  end
end
