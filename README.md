# wafme0w Homebrew tap

Homebrew formulae for [wafme0w](https://github.com/Lu1sDV/wafme0w), a Go CLI and
library that identifies WAF fingerprints from live HTTP responses or saved
captures.

## Install

```sh
brew install Lu1sDV/tap/wafme0w
```

Or tap first and install by name:

```sh
brew tap Lu1sDV/tap
brew install wafme0w
```

## Formula provenance

`Formula/wafme0w.rb` comes from the wafme0w release workflow, which generates it
from the verified release assets and publishes it as `wafme0w.rb`, covered by the
release's `SHA256SUMS`. The formula pins the SHA256 of the macOS and Linux archives
for 64-bit ARM and x86-64.

The 2.0.0 tap copy drops the redundant `version "2.0.0"` line that `brew audit
--strict` rejects; the archive URLs and checksums are identical to the release
asset. Later releases generate the formula without that line.

To check the tap formula against the release:

```sh
gh release download v2.0.0 --repo Lu1sDV/wafme0w \
  --pattern SHA256SUMS --pattern wafme0w.rb --pattern '*.tar.gz'
shasum -a 256 --check SHA256SUMS

grep 'sha256 "' wafme0w.rb \
  | diff - <(grep 'sha256 "' "$(brew --repo Lu1sDV/tap)/Formula/wafme0w.rb")
```

The first command verifies every downloaded release asset; the second shows that the
tap formula pins the same archive checksums.

## Verify the installed formula

```sh
brew test Lu1sDV/tap/wafme0w
```

The formula test runs the bundled synthetic captures through offline
classification, so it sends no requests.

## Support

Report formula or tap problems in
[this repository](https://github.com/Lu1sDV/homebrew-tap/issues); report wafme0w
behavior in the [main repository](https://github.com/Lu1sDV/wafme0w/issues).

## License

MIT, matching wafme0w.
