class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.86"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.86/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "323706ed205b1407c8c86b3f2a5d2455d7c3436a89ea139a7912accabf72e86b"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.86/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "e4b75ff32007c229a5ea524dfb49ff3ab12f95aa138f3c441f932d6052e8b698"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
