# C++ Insights: Docker Container

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![download](https://img.shields.io/badge/latest-download-blue.svg)](https://github.com/andreasfertig/cppinsights-container/releases)
[![Try online](https://img.shields.io/badge/try-online-blue.svg)](https://cppinsights.io)


This is the container that is invoked by the web front-end of [cppinsights.io](https://cppinsights.io/).

You may use this to set up a full local version of the C++ Insights web front-end.

The other part you then need is the [C++ Insights: Web Front-End Docker Container](https://github.com/andreasfertig/cppinsights-webfrontend-container), which provides the web part in a container.

These are the steps to build this project:

```
git clone https://github.com/andreasfertig/cppinsights-container.git
cd cppinsights-container
make
```

Which clones the repo, downloads the latest C++ Insights binary, and builds a docker container. Now, you are ready to
switch to [C++ Insights: Web Front-End Docker Container](https://github.com/andreasfertig/cppinsights-webfrontend-container).

