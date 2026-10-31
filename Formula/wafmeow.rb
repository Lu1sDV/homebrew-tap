# Generated from verified release v3.0.0, source b41e7d862be23ef71e8dc461558e17828ac32220.
class Wafmeow < Formula
  desc "Identify WAF fingerprints in HTTP responses or saved captures"
  homepage "https://github.com/Lu1sDV/wafmeow"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Lu1sDV/wafmeow/releases/download/v3.0.0/wafmeow_v3.0.0_darwin_arm64.tar.gz"
      sha256 "256e0df4a905a2f0e6a84262c90602b371508cb01a62cbe5d40ffda94df99920"
    end
    on_intel do
      url "https://github.com/Lu1sDV/wafmeow/releases/download/v3.0.0/wafmeow_v3.0.0_darwin_amd64.tar.gz"
      sha256 "236d4083400a0f98bbb421588f3bc5da7c2a79ef65f15ab5f6ae902dff9b5d0c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Lu1sDV/wafmeow/releases/download/v3.0.0/wafmeow_v3.0.0_linux_arm64.tar.gz"
      sha256 "cd71c86224ad429f53d05269dc70e9acc3391ae045c5f48e7551f7aa4c178b54"
    end
    on_intel do
      url "https://github.com/Lu1sDV/wafmeow/releases/download/v3.0.0/wafmeow_v3.0.0_linux_amd64.tar.gz"
      sha256 "7a317f567e82dbadfaf62b40b6d27a1e3c32b03d5112f19bc5e1b210ce4f176e"
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
