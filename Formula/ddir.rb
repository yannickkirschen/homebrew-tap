class Ddir < Formula
    include Language::Python::Virtualenv

    desc "Diff a directory and sync changes."
    homepage "https://github.com/yannickkirschen/ddir"
    url "https://github.com/yannickkirschen/ddir/archive/refs/tags/3.1.2.zip"
    sha256 "b7cf7c8f825c1b3441f8d3d3ad1622928190c6deb170df7ef71d1dae07c93d85"
    license :public_domain

    depends_on "python@3.13"

    def install
        virtualenv_install_with_resources
    end

    test do
      system "#{bin}/ddir", "version"
    end
  end
