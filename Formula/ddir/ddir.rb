class Ddir < Formula
    include Language::Python::Virtualenv

    desc "Diff a directory and sync changes."
    homepage "https://github.com/yannickkirschen/ddir"
    url "https://github.com/yannickkirschen/ddir/archive/refs/tags/3.1.0.zip"
    sha256 "cb95c5736b6ae7c7e485b0b302feda03a30929bb88130c9f7062d00032ddc4e3"
    license :public_domain

    depends_on "python@3.12"

    def install
        virtualenv_install_with_resources
    end

    test do
      system "#{bin}/ddir", "version"
    end
  end
