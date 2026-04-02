class CatalystEdge < Formula
  desc "Hyperparameter optimization for cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.30"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.30/catalyst-darwin-arm64.tar.gz?key=#{@@release_key}"
  sha256 "d6d8e0f8d936e5681883bad62d222088c7002bb107d0b3cb25fe386da4fa977c"

  depends_on "python@3.12"

  # Skip Homebrew's automatic dylib relinking for Python extension modules.
  # Pre-built wheels (cryptography, etc.) ship .so files with minimal Mach-O
  # header space that can't be rewritten to absolute install paths.
  # These extensions load via Python's import system, not dyld, so relinking
  # is unnecessary.
  skip_clean "libexec/lib"

  def install
    libexec.install "lib"
    libexec.install "catalyst" => "catalyst"
    bin.install_symlink libexec/"catalyst"
  end

  test do
    system bin/"catalyst", "--version"
  end
end
