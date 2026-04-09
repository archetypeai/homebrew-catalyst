class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.96"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.96/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "c97969d28b4d0fd88c6a810b4693b1bd180e2a74303496b36de389d0aa79a09a"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.96/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "527db3efff8cd29c7994bda57756b98f7ab6c696df223989f1e12ba07c2982fe"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
