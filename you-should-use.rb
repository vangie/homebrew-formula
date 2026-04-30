class YouShouldUse < Formula
  desc "Shell plugin that suggests aliases and modern command alternatives"
  homepage "https://github.com/vangie/you-should-use"
  url "https://github.com/vangie/you-should-use.git", tag: "v0.3.0"
  license "MIT"
  head "https://github.com/vangie/you-should-use.git", branch: "main"

  def install
    prefix.install "you-should-use.plugin.zsh"
    prefix.install "you-should-use.zsh"
    prefix.install "you-should-use.plugin.bash"
    prefix.install "you-should-use.plugin.nu"
    prefix.install Dir["conf.d"]
  end

  def caveats
    <<~EOS
      To activate the plugin, add the following to your shell config:

      # Zsh (~/.zshrc)
      source #{opt_prefix}/you-should-use.plugin.zsh

      # Bash (~/.bashrc)
      source #{opt_prefix}/you-should-use.plugin.bash

      # Fish (~/.config/fish/conf.d/)
      ln -sf #{opt_prefix}/conf.d/you-should-use.fish ~/.config/fish/conf.d/

      # Nushell (config.nu)
      source #{opt_prefix}/you-should-use.plugin.nu

      Then restart your shell or run: exec $SHELL
    EOS
  end

  test do
    # Verify the plugin files are installed
    assert_predicate prefix/"you-should-use.plugin.zsh", :exist?
    assert_predicate prefix/"you-should-use.plugin.bash", :exist?
    assert_predicate prefix/"conf.d/you-should-use.fish", :exist?
  end
end
