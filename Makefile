# Try to create and test a sunbeam intallation, using a local copy of Anaconda.

ANACONDA ?= Anaconda3-4.3.1-Linux-x86_64.sh

all: anaconda3/envs/sunbeam

$(ANACONDA):
	wget https://repo.anaconda.com/archive/$@

anaconda3: $(ANACONDA)
	bash $< -b -p $@

sunbeam-stable:
	git clone -b stable https://github.com/sunbeam-labs/sunbeam $@

anaconda3/envs/sunbeam: sunbeam-stable anaconda3
	env
	cd $< && ../setup_wrapper.sh ./install.sh
	cd $< && ../setup_wrapper.sh tests/run_tests.bash -e sunbeam

clean:
	rm -f $(ANACONDA)
	rm -rf anaconda3/
	rm -rf sunbeam-stable/
