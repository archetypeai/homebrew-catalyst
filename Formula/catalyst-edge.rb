class CatalystEdge < Formula
  desc "Hyperparameter optimization for cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.27"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.27/catalyst-darwin-arm64.tar.gz?key=#{@@release_key}"
  sha256 "fcf92eaa833ed0b5beead429ae69e23205baa1121eba5cd8168c91441d2aef65"

  depends_on "python@3.12"

  def install
    libexec.install "lib"
    libexec.install "catalyst" => "catalyst"
    bin.install_symlink libexec/"catalyst"
  end

  test do
    system bin/"catalyst", "--version"
  end
end
