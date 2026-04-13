class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.127"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.127/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "51fd68a649e00707307b69e6e358f640db85c17fba2ffa19f55cdf98568e48ef"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.127/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "3155daac3093e8a8d240292c3ac6a107ca6c5abce2359edecb8232dd95257260"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
