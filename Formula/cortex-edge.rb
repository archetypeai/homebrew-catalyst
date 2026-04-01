class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.21"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.21/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "985db7b108f5d9d0336df5b61267813d0dce4fd9cd8b00ec7c6044bc9a3b84e3"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.21/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "60e6e4d540c4d94eeb5b61e4d4b8d215ad3e7c5b9582d9525ee3f9ee9745382c"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
