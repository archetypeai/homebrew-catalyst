class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.34"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.34/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "15452dd89566739478ab05ba502faba0ffc08e7e9b2156ce8dcdf70009d2f2ae"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.34/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "f85fee6b7e0455dcfb1518bf27e8d46aaa10da174eb52a167c5a6dc38e512b99"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
