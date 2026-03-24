class CatalystEdge < Formula
  desc "Hyperparameter optimization for cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.17"
  license :cannot_represent

  url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.17/catalyst-darwin-arm64.tar.gz?key=#{ENV.fetch("CATALYST_RELEASE_KEY")}"
  sha256 "5c7bccf731b738b3390dd764bc86a2981b699b62749ec6b81c1e5efcef29db8c"

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
