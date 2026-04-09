class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.93"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.93/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "021c1c18eb677735817cd09ce09617ad2e0d93b752ce0337d74aeaf954baa46c"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.93/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "89081cb7aeb8a0f6644864747bf88ff34a1291a409befcc3f4723cefb732de05"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
