# Generated from verified release v3.0.2, source 7948f35fb43c103000ed560063b51ff4ac3419b8.
class Wafmeow < Formula
  desc "Identify WAF fingerprints in HTTP responses or saved captures"
  homepage "https://github.com/Lu1sDV/wafmeow"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Lu1sDV/wafmeow/releases/download/v3.0.2/wafmeow_v3.0.2_darwin_arm64.tar.gz"
      sha256 "e9e66f74579aa3784aedaad38c50c4bf5f4ad54cbdf33d9d05ef39aca60376ed"
    end
    on_intel do
      url "https://github.com/Lu1sDV/wafmeow/releases/download/v3.0.2/wafmeow_v3.0.2_darwin_amd64.tar.gz"
      sha256 "7c548879ccc9aa9c5f29b206edf18c2726fb42461cdac36ce3740898185aad86"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Lu1sDV/wafmeow/releases/download/v3.0.2/wafmeow_v3.0.2_linux_arm64.tar.gz"
      sha256 "d35f1f1fe28b46d7633619ffd4de0c5a7bdfe9d3dc231124dd90fd7e8644b831"
    end
    on_intel do
      url "https://github.com/Lu1sDV/wafmeow/releases/download/v3.0.2/wafmeow_v3.0.2_linux_amd64.tar.gz"
      sha256 "b8de45f89be19c63b509709525e14b5c9c4471a73e9c2db7c4385c57e1d43a8a"
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
