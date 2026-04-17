class CatalystRc < Formula
  desc "Hyperparameter optimization for cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.184"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.184/catalyst-darwin-arm64.tar.gz?key=#{@@release_key}"
  sha256 "8c29611a5241b32127eeab2e5ccf462781946c0c7b51a819247471e104b7960e"

  depends_on "python@3.12"

  # Prevent Homebrew from running install_name_tool on Python extension .so
  # files during keg relocation. Pre-built wheels (cryptography, etc.) have
  # minimal Mach-O headers that can't be rewritten. These load via Python's
  # import system, not dyld, so relinking is unnecessary.
  skip_clean "libexec/lib"

  def install
    # Copy lib/ via cp instead of libexec.install to prevent Homebrew from
    # running install_name_tool on Python extension .so files. Pre-built wheels
    # (cryptography, etc.) have minimal Mach-O headers that can't be rewritten.
    # These load via Python's import system, not dyld, so relinking is unnecessary.
    libexec.mkpath
    system "cp", "-a", "lib", libexec/"lib"
    libexec.install "catalyst" => "catalyst-rc"
    bin.install_symlink libexec/"catalyst-rc"

    # cortex CLI + cx alias (bundled in the same tarball)
    bin.install "cortex" => "cortex-rc" if File.exist?("cortex")
    bin.install_symlink bin/"cortex-rc" => "cx-rc" if File.exist?(bin/"cortex-rc")
  end

  test do
    system bin/"catalyst-rc", "--version"
    system bin/"cortex-rc", "--version" if (bin/"cortex-rc").exist?
  end
end
