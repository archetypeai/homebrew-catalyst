class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.94"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.94/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "b83b8914b62b9a579584f23b22e98f3b9549dabcbc93450ce43b7fe54e9e8f71"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.94/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "74ad71e43f58d954ccc1335dfcbf9b1263127254663921e93577150275fc431e"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
