class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.24"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.24/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "b37edafbccabe015bdcede30a34a7237abe55e6490f160e0cd31e604a3599c8b"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.24/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "3ef9db8dd0a695cbb5e48818eb94d0e171499ad6c8d73f71ad1195a7d150c811"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
