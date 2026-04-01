class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.20"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.20/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "addd10e1116a9495b4b9a77d485757dfc9d5d6ddf9c84aa3925dd5d20de62d33"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.20/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "89eafd374ec1d83f4fcda0a1f6adfa8e6308e53cdd4d6e233775b2381bf27a88"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
