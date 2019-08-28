# Sunbeam Installation Troubleshooting

The make rules and wrapper script here try very hard to set up as completely
isolated a [Sunbeam](https://github.com/sunbeam-labs/sunbeam) installation as
possible for troubleshooting purposes.


With latest Miniconda3 and latest stable sunbeam:

    make

Specifying custom Anaconda/Miniconda intsaller and/or Sunbeam branch:

    make ANACONDA=Miniconda3-latest-Linux-x86_64 SUNBEAM=stable
