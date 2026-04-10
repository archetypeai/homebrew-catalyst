class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.101"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.101/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "0582e3c72af5aabf66f49cc6c1a9a80500a2f6b4449e4b8e67154485fb7374ab"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.101/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "36c4f0ba0132d924998fabc701a73fb4a711516a6a4f13066f5ef5d4fbca12f6"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
