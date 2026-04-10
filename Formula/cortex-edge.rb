class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.107"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.107/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "7e9084c19d9695285361f49539e6a8a090dd4357ce038cbbe55c970f63264340"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.107/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "ca3b4f6bc04313914c5190f56fb19bda9f15c81e7ad6336f3cf2fee8a51af430"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
