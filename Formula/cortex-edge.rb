class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.102"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.102/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "4c94e9e514b187cf9f1ba85c3a835e6df61f97faf2e5d11f00f4f06788654255"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.102/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "b1230239c440a9f7115f88197376fd8b0fdcd43e149b0bc5cdc91d5e7147abc6"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
