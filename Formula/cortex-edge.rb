class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.98"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.98/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "ba8bfd6d2e63fb6eeee95aa92e57d0092fe3de8dec191dab766ea944131fd4dd"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.98/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "e6e01c47299447433c0710b40fe73c88fa00017bcbc2f6aff1639d5ef5244b23"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
