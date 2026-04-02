class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.27"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.27/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "f572e2ebdfd736675b1459dd201949eb7861070b10ba37f3962763764013675d"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.27/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "f01ac5bc0fa84bda58c70d87773535a3f78aed11d07c34c6ee02387b82808d7a"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
