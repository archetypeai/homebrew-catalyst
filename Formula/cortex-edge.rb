class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.95"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.95/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "55cb4e0b10d5e7ad1092e0367e923294f7e936f57ae75550ec8a432689db2f49"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.95/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "15a63e1281adbb6c218ed70cf0e565cccf72950b80ba8b852162c119cab22b32"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
