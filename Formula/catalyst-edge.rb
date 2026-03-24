class CatalystEdge < Formula
  include Language::Python::Virtualenv

  desc "Hyperparameter optimization for cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.8/catalyst_loop-0.2.0rc8.tar.gz?key=eHREC9V2VGP3kzMP4OiWx92694cxgMCq8mNMFbfh6qw"
  sha256 "e50df235f53316649d382c3ac70ba5d81e5af0848566b490216674294ada229d"
  license :cannot_represent

  depends_on "python@3.12"

  resource "cortex-client" do
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.8/cortex_client-0.2.0rc8.tar.gz?key=eHREC9V2VGP3kzMP4OiWx92694cxgMCq8mNMFbfh6qw"
    sha256 "c16ee261331009a1631ada9859e4cacd72b7223afe7558fe7a89554a08209fee"
  end

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install resource("cortex-client")
    venv.pip_install_and_link buildpath
  end

  test do
    system bin/"catalyst", "--version"
  end
end
