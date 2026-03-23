class CatalystEdge < Formula
  desc "Hyperparameter optimization for cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.4/catalyst_loop-0.2.0rc4.tar.gz",
      headers: ["x-api-key: #{ENV["CATALYST_RELEASE_KEY"]}"]
  sha256 "b2739b470a92fb48c7c1fad573da2362f1d9e9122e26734eb684dd4b5b5da272"
  license :cannot_represent

  depends_on "python@3.12"

  resource "cortex-client" do
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.4/cortex_client-0.2.0rc4.tar.gz",
        headers: ["x-api-key: #{ENV["CATALYST_RELEASE_KEY"]}"]
    sha256 "33b7813d406200d86a96560045541e664761936cd1e55d63d2c9dfd77a512ac8"
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
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install resource("cortex-client")
    venv.pip_install_and_link buildpath
  end

  test do
    system bin/"catalyst", "--version"
  end
end
