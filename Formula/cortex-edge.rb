class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.22"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.22/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "a8c7c684748d74bd622185e9d3dd3d60bad049609b40773d7f30f9a31fc668da"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.22/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "54eff1663a658c25fb335b109bc3f9e122e203e1c9923a16547e4077d529d164"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
