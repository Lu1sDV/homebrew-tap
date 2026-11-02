# Generated from verified release v3.1.0, source 04a9ff9268da31c19ecbfec8622753459f102504.
class Wafmeow < Formula
  desc "Identify WAF fingerprints in HTTP responses or saved captures"
  homepage "https://github.com/Lu1sDV/wafmeow"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Lu1sDV/wafmeow/releases/download/v3.1.0/wafmeow_v3.1.0_darwin_arm64.tar.gz"
      sha256 "496209412f21baef2b90e852fd82791b41fcb8995e9704db4eed9bc35f5cb264"
    end
    on_intel do
      url "https://github.com/Lu1sDV/wafmeow/releases/download/v3.1.0/wafmeow_v3.1.0_darwin_amd64.tar.gz"
      sha256 "1ffd6289ecc2f8843118d2d1e74c64a4be6e95564e1540f94fc9122842f70916"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Lu1sDV/wafmeow/releases/download/v3.1.0/wafmeow_v3.1.0_linux_arm64.tar.gz"
      sha256 "7c4e2bf7915ebedb90835162b661bcdc14f5bb6972312e2377b15682f463a902"
    end
    on_intel do
      url "https://github.com/Lu1sDV/wafmeow/releases/download/v3.1.0/wafmeow_v3.1.0_linux_amd64.tar.gz"
      sha256 "8b1fc1eafac0b8bc38d9f3ff9ef7ed4021aaaf486d2171e51a5c4cd0b5b009fd"
    end
  end

  def install
    bin.install "wafmeow"
    prefix.install "LICENSE.md"
    pkgshare.install "assets/demo/captures.jsonl"
  end

  test do
    assert_match "wafmeow ", shell_output("#{bin}/wafmeow --version")
    output = shell_output("#{bin}/wafmeow --evidence #{pkgshare}/captures.jsonl --jsonl --silent")
    assert_equal 3, output.lines.length
    assert_match "synthetic-cloudflare", output
  end
end
