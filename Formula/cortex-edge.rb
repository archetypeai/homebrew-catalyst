class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.32"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.32/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "ad9b37b62694fa18b2413719e17bf85c1b102551e783f9ff2d38e4d67f472adb"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.32/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "a6e81191f461d9a67b646f33ee661528da6fd9daf47f9a8960213f270acd73a4"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
