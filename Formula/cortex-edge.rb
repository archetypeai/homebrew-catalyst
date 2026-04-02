class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.35"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.35/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "64287f7710fa90edb446a98c24d1fc5dbd0119bf283fb3b8db6dd5b1f13f1089"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.35/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "9a23ff4b2bc2da5c191b8f294360077a957cdd762854008f565b83ee546f9089"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
