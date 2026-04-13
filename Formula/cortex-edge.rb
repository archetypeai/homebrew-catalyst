class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.126"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.126/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "734f0b3edeeab0f86bb3656c8b82ed0e20197d00cd83fe6aeb16ae67a1fd2a81"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.126/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "671954046d43d1928d4f3fbf1bec6572acea64e03befbf14fb977f36a04047bf"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
