# This file is part of MXE. See LICENSE.md for licensing information.

PKG             		 := prometheus-cpp
$(PKG)_WEBSITE  		 := https://github.com/jupp0r/prometheus-cpp
$(PKG)_DESCR    		 := Prometheus Client Library for Modern C++
$(PKG)_IGNORE   		 :=
$(PKG)_VERSION  		 := 0.13.0
$(PKG)_CHECKSUM 		 := 5319b77d6dc73af34bc256e7b18a7e0da50c787ef6f9e32785d045428b6473cc
$(PKG)_GH_CONF  		 := jupp0r/prometheus-cpp/tags,v
$(PKG)_DEPS			     := zlib curl
$(PKG)_DEPS_$(BUILD) := cmake

define $(PKG)_BUILD
		cd '$(SOURCE_DIR)'
		git submodule update --init
		cd '$(BUILD_DIR)'
		$(TARGET)-cmake '$(SOURCE_DIR)' -DBUILD_SHARED_LIBS=$(CMAKE_SHARED_BOOL) -DENABLE_PUSH=OFF -DENABLE_COMPRESSION=ON
		$(TARGET)-cmake --build . --parallel '$(JOBS)'
		$(TARGET)-cmake --install .
endef
