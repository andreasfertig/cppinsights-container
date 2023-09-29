GBENCH=1.3.0
BOOST=1.83.0

all: build

local: libs
	./build.sh $(GBENCH) $(BOOST)

build: insights libs
	./build.sh $(GBENCH) $(BOOST)
	docker tag insights-test andreasfertig/cppinsights-container

libs:
	wget -O - https://github.com/google/benchmark/archive/v$(GBENCH).tar.gz | tar xzf -
	wget -O - https://boostorg.jfrog.io/artifactory/main/release/$(BOOST)/source/boost_1_83_0.tar.gz | tar xzf -

insights: clean
	wget https://github.com/andreasfertig/cppinsights/releases/download/continuous/insights-ubuntu-14.04.tar.gz
	tar -xzf insights-ubuntu-14.04.tar.gz

clean:
	rm -f insights-ubuntu-14.04.tar.gz* insights
