class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.113"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.113/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "cc3a6014fe4528fc5ef96e8cd6ba1288eb7123072c01cab95248b87ae527345d"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.113/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "1ab009b4b48ae6a17b99ed0285a2242b22181066e425581026820db81d8af97a"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
