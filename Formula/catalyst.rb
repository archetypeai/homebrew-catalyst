class Catalyst < Formula
  desc "Hyperparameter optimization for cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.5.2"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  url "https://d9pwqft6ad7vm.cloudfront.net/stable/v0.5.2/catalyst-darwin-arm64.tar.gz?key=#{@@release_key}"
  sha256 "d7deb76e68711ecf2a45bbaacbe04c9fa91484e6f4675d9be11079298e645cc4"

  depends_on "python@3.12"

  # Prevent Homebrew from running install_name_tool on Python extension .so
  # files during keg relocation. Pre-built wheels (cryptography, etc.) have
  # minimal Mach-O headers that can't be rewritten. These load via Python's
  # import system, not dyld, so relinking is unnecessary.
  skip_clean "libexec/lib"

  def install
    # Copy lib/ via cp instead of libexec.install to prevent Homebrew from
    # running install_name_tool on Python extension .so files. Pre-built wheels
    # (cryptography, etc.) have minimal Mach-O headers that can't be rewritten.
    # These load via Python's import system, not dyld, so relinking is unnecessary.
    libexec.mkpath
    system "cp", "-a", "lib", libexec/"lib"
    # S836: cortex-agents bundled alongside lib/. agent_dir_resolver
    # discovers them at $(brew --prefix)/opt/catalyst/libexec/share/cortex-agents/<name>/
    # so `brew install catalyst` ships every default agent ready to run —
    # no follow-up `catalyst agent install` step.
    system "cp", "-a", "share", libexec/"share" if File.exist?("share")
    libexec.install "catalyst" => "catalyst"
    bin.install_symlink libexec/"catalyst"

    # cortex CLI + cx alias (bundled in the same tarball)
    bin.install "cortex" => "cortex" if File.exist?("cortex")
    bin.install_symlink bin/"cortex" => "cx" if File.exist?(bin/"cortex")

    # Copy share/ payloads into the cellar (S836 agents + S838 cortex source +
    # node crate sources). `cortex agent init` scaffolds Makefiles whose
    # --cortex-path / --node-path resolve to <libexec>/share/cortex/ and
    # <libexec>/share/cortex-agents/nodes/ respectively. Bundle layout:
    #   share/cortex/                   — framework source workspace (RC only, S838)
    #   share/cortex-agents/nodes/      — node crate sources (RC only, S838)
    #   share/cortex-agents/<agent>/    — pre-built agents (S836; agent install also writes here)
    system "cp", "-a", "share", libexec/"share" if Dir.exist?("share")
  end

  test do
    system bin/"catalyst", "--version"
    system bin/"cortex", "--version" if (bin/"cortex").exist?
  end
end
