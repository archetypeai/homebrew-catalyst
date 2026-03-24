class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.18"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.18/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "f2bf692a4606602765275575b7e7330b9ef41f6249d81fe99772329a426a5a05"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.18/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "6b017acdef5787af5f7307d9830a444c15169c25552f79a7045f1fce4e029bf2"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
