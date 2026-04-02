class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.29"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.29/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "e694a8c3aae384163016963dd1fff2264f37d20987851bdeb707a366caca4cdc"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.29/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "a2c3f2c36c02fe5e5d1a10ddca43f16b07f4429720c7ba30a41ad2a99013115f"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
