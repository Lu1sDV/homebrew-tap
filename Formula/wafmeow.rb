# Generated from verified release v3.0.1, source 70d33356e7c7b4998f4dce01ee300703c229ef1d.
class Wafmeow < Formula
  desc "Identify WAF fingerprints in HTTP responses or saved captures"
  homepage "https://github.com/Lu1sDV/wafmeow"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Lu1sDV/wafmeow/releases/download/v3.0.1/wafmeow_v3.0.1_darwin_arm64.tar.gz"
      sha256 "08b9e9e69277a7a5b340f91ec59c454a71dace4d8d470179fbfaeb89016f7248"
    end
    on_intel do
      url "https://github.com/Lu1sDV/wafmeow/releases/download/v3.0.1/wafmeow_v3.0.1_darwin_amd64.tar.gz"
      sha256 "c62ea62bc7ce735eb8385da9c9c3181dfb6c713a62d3ee7f983c2ce4163f1eff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Lu1sDV/wafmeow/releases/download/v3.0.1/wafmeow_v3.0.1_linux_arm64.tar.gz"
      sha256 "d59fe164ef3a25acaf8d9349445da180d1c1107a086722d0711901f5f8de1f6a"
    end
    on_intel do
      url "https://github.com/Lu1sDV/wafmeow/releases/download/v3.0.1/wafmeow_v3.0.1_linux_amd64.tar.gz"
      sha256 "72543efbe29f8a7e020cd84a1f7e05c2743b5b547466454049e44ee80b8af6e3"
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
