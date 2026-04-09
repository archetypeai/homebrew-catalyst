class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.91"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.91/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "bd85e7760fb78ff49a1b14bbc711ad9860fa113acf77fa6f3bb5daa0a4be19c3"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.91/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "5bb7f765148e2b62f6a72ffa0aa5f7d0a74273d81a6774c485b47437e5fc0c04"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
