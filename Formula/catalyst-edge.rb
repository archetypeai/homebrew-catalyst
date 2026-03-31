class CatalystEdge < Formula
  desc "Hyperparameter optimization for cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.0.0-edge.8f2a7c9"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  url "https://d9pwqft6ad7vm.cloudfront.net/v0.0.0-edge.8f2a7c9/catalyst-darwin-arm64.tar.gz?key=#{@@release_key}"
  sha256 "c155b64a34c0f4a2f813c93f6021d656f5222a4151c191e59351c0a959867d5a"

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
