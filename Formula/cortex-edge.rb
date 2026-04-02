class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.26"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.26/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "637e66b9e72741ed17c062371efc8bf7dc2ea9dc408df79b61036edd92839c32"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.26/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "8a5c067006589ee052766eabaf83012440118151e35975dd95c46cc369910b8a"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
