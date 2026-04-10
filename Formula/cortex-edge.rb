class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.108"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.108/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "bb3007224203fc29ccf85d7244b204ca5729826839bf4927f6e54c533e1afd1f"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.108/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "099c1038341e65fb6670dbc2eaf6354684c10adc9e31919e7ef3c867b1c05dfe"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
