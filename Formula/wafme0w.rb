# Generated from verified release v2.0.0, source 5a1866d6e5021fddf5972d4a6d3c020ff08538b1.
class Wafme0w < Formula
  desc "Identify WAF fingerprints in HTTP responses or saved captures"
  homepage "https://github.com/Lu1sDV/wafme0w"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Lu1sDV/wafme0w/releases/download/v2.0.0/wafme0w_v2.0.0_darwin_arm64.tar.gz"
      sha256 "2dc6777c72353945c4d55bc234c3827ae8dd5897ec238e04a3c763c77a80db87"
    end
    on_intel do
      url "https://github.com/Lu1sDV/wafme0w/releases/download/v2.0.0/wafme0w_v2.0.0_darwin_amd64.tar.gz"
      sha256 "b0df1408363342b7a1b3a5b8e5e93d75fb94df1a45c8374f2b4559b8d07b5943"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Lu1sDV/wafme0w/releases/download/v2.0.0/wafme0w_v2.0.0_linux_arm64.tar.gz"
      sha256 "11bd1c78692a378323bdb01fc501d58dff64c7009708ff7f11235e79d32dec11"
    end
    on_intel do
      url "https://github.com/Lu1sDV/wafme0w/releases/download/v2.0.0/wafme0w_v2.0.0_linux_amd64.tar.gz"
      sha256 "4d98dfb82b6f4d622cf5b23ef74c96891c7795f6fd04580f4d6b3c91d328effd"
    end
  end

  def install
    bin.install "wafme0w"
    prefix.install "LICENSE.md"
    pkgshare.install "assets/demo/captures.jsonl"
  end

  test do
    assert_match "wafme0w ", shell_output("#{bin}/wafme0w --version")
    output = shell_output("#{bin}/wafme0w --evidence #{pkgshare}/captures.jsonl --jsonl --silent")
    assert_equal 3, output.lines.length
    assert_match "synthetic-cloudflare", output
  end
end
