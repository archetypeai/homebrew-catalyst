class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.36"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.36/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "bb7736aec734359a7fce9eaf938a659f73d2cd2b0702bdf74bd4441c56b2e68d"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.36/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "d2ecab625aad96c6dc5967b7a77b17505160493814e40a140c0e375be4796a22"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
