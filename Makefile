GBENCH=1.3.0
BOOST=1.83.0

all: build

local: libs
	./build.sh $(GBENCH) $(BOOST)

build: insights libs
	./build.sh $(GBENCH) $(BOOST)
	docker tag cppinsights-container andreasfertig/cppinsights-container

libs:
	wget -q -O - https://github.com/google/benchmark/archive/v$(GBENCH).tar.gz | tar xzf -
	wget -q -O - https://boostorg.jfrog.io/artifactory/main/release/$(BOOST)/source/boost_1_83_0.tar.gz | tar xzf -

insights: clean
	wget -q https://github.com/andreasfertig/cppinsights/releases/download/continuous/insights-ubuntu-14.04.tar.gz
	tar -xzf insights-ubuntu-14.04.tar.gz

clean:
	rm -f insights-ubuntu-14.04.tar.gz* insights
