all: build

local: libs
	./build.sh

build: insights libs
	./build.sh
	docker tag insights-test andreasfertig/cppinsights-container

libs:
	wget -O - https://github.com/google/benchmark/archive/v1.3.0.tar.gz | tar xzf -

insights: clean
	wget https://github.com/andreasfertig/cppinsights/releases/download/continuous/insights-ubuntu-14.04.tar.gz
	tar -xzf insights-ubuntu-14.04.tar.gz

clean:
	rm -f insights-ubuntu-14.04.tar.gz* insights
