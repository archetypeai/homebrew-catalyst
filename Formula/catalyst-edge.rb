class CatalystEdge < Formula
  desc "Hyperparameter optimization for cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.3/catalyst_loop-0.2.0-rc.3.tar.gz",
      headers: ["x-api-key: #{ENV["CATALYST_RELEASE_KEY"]}"]
  sha256 "f81fb19fe4c3618822d0c6d34b5b8f023183ecd84476b6f005636a850eda9200"
  license :cannot_represent

  depends_on "python@3.12"

  resource "cortex-client" do
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.3/cortex_client-0.2.0rc3.tar.gz",
        headers: ["x-api-key: #{ENV["CATALYST_RELEASE_KEY"]}"]
    sha256 "481bdb82826707cdef00e892b9ba47247dc1b3ba25b0c9b80b841a941f7756e7"
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
