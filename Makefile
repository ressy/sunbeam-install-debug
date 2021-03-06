# Try to create and test a sunbeam intallation, using a local copy of Anaconda.

ANACONDA ?= Miniconda3-latest-Linux-x86_64
SUNBEAM  ?= stable

all: anaconda3/envs/sunbeam

$(ANACONDA).sh:
	wget -q https://repo.anaconda.com/archive/$@ || wget -q https://repo.anaconda.com/miniconda/$@

anaconda3: $(ANACONDA).sh
	bash $< -b -p $@

sunbeam-$(SUNBEAM):
	git clone -b $(SUNBEAM) https://github.com/sunbeam-labs/sunbeam $@

anaconda3/envs/sunbeam: sunbeam-$(SUNBEAM) anaconda3
	env
	./conda_wrapper.sh conda info
	./conda_wrapper.sh conda config --show
	cd $< &&\
	       	../conda_wrapper.sh ./install.sh -d && \
		../conda_wrapper.sh tests/run_tests.bash -e sunbeam

clean:
	rm -f $(ANACONDA).sh
	rm -rf anaconda3/
	rm -rf sunbeam-$(SUNBEAM)/
	rm -rf .conda/ .cache/ .pip/ tmp/
