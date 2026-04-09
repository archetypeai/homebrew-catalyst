class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.81"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.81/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "97f76b37a36f0b71a83fc54bf375e4d8e9fe60fd9d0c2f415be85dca31b9d549"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.81/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "df0c00815c96487e87ce8c0c0825b7d331158f6c006b3b68b5f14d46b7098f01"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
