class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.124"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.124/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "d91e2140807970d24700a2c3354525fbcfac759763f8108051ac254a1d711619"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.124/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "a5bbafa498692adac4445a9050d284574a9ec67d30a88ad82c425b8846b71740"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
