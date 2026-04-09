class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.97"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.97/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "dcd5bc979a79391fcdbe3b3fd95f2fd38375f4ab89ff95dab2e63767988c7ef6"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.97/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "12f1b4c2e2efec8935c5be63518cfec28e9f0b4735663b976757486c32bdaa22"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
