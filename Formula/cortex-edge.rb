class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.99"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.99/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "bfdac3e439ff725ba00ad883ea8c4f4c02f31f7c2a29d9581c30f0d4c3edee1d"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.99/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "6c07617133d2b7c91e182a3d616576417584b39df5a7fa14cb7a0c4132c3da96"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
