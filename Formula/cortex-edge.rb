class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.37"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.37/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "c8d271a4e2b20d18c676e0b26191b46d7744a8062fd567b4060ae96dffe07ccf"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.37/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "9e8e7b31cee58bea3c59af1d6c390cebc49ba4069bb32c26ca6fac92059633db"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
