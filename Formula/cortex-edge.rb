class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.39"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.39/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "a864e9aebf91df8c1a13e74e42442ce6fb6794a518c2b655568e2491980131ca"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.39/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "7d5b997a29d4a64aee9a265243fcdced24c8c7e9f0743394ce4820d632645c15"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
