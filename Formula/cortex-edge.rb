class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.40"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.40/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "fb6f183636382937368b0ccff0b850ca4b97b345b8818cbfd304ecc1dc0725b0"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.40/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "4767a8389f52690bb827f8f8ccc41e8a68d6a06ade226a9756684dab6480a8a5"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
