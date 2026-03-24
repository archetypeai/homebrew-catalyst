class CatalystEdge < Formula
  include Language::Python::Virtualenv

  desc "Hyperparameter optimization for cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.9/catalyst_loop-0.2.0rc9.tar.gz?key=eHREC9V2VGP3kzMP4OiWx92694cxgMCq8mNMFbfh6qw"
  sha256 "c8628e865d9f30d03504941318f2223962118c3adaca06f0fc8f766b9b64c2eb"
  license :cannot_represent

  depends_on "python@3.12"

  resource "cortex-client" do
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.9/cortex_client-0.2.0rc9.tar.gz?key=eHREC9V2VGP3kzMP4OiWx92694cxgMCq8mNMFbfh6qw"
    sha256 "b9705651e2c93a8a26f4e434a50b9322cac7adff2b0500d836876aa969a2b1b6"
  end

  def install
    venv = virtualenv_create(libexec, "python3.12")
    # Install cortex-client first (private dep, not on PyPI)
    venv.pip_install resource("cortex-client")
    # Install catalyst-loop with all transitive deps from PyPI
    system libexec/"bin/pip", "install", "--no-cache-dir", cached_download
    # Link the CLI entry point
    (bin/"catalyst").write_env_script(
      libexec/"bin/catalyst",
      PATH: "#{libexec}/bin:$PATH",
    )
  end

  test do
    system bin/"catalyst", "--version"
  end
end
