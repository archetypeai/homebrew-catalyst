class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.105"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.105/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "582a36a8e8de697841096edb18a01b6cb16f8ae0513df911e0b2f202efcd0c37"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.105/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "3b5a46a1273b3773fe802739bee4227fee46830189310a6f2cf085cb6415f314"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
