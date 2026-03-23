class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.4"
  license :cannot_represent

  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.4/cortex-darwin-arm64.tar.gz",
        headers: ["x-api-key: #{ENV["CATALYST_RELEASE_KEY"]}"]
    sha256 "c9cf55550cd34286597c454e48c259d088947456a6227c3b90e8195de620dea8"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.4/cortex-darwin-x86_64.tar.gz",
        headers: ["x-api-key: #{ENV["CATALYST_RELEASE_KEY"]}"]
    sha256 "66f2cb6e0b4e90acfccfe9bd8d917b84de3dae66b8965e5f417ae887a55e8626"
  end

  def install
    if ENV["CATALYST_RELEASE_KEY"].nil? || ENV["CATALYST_RELEASE_KEY"].empty?
      odie <<~EOS
        CATALYST_RELEASE_KEY is not set. This is required to download release artifacts.

        Get the key:
          eval "$(scripts/get-release-key.sh)"

        Or add to ~/.zshrc:
          export CATALYST_RELEASE_KEY=<your-key>
      EOS
    end
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
