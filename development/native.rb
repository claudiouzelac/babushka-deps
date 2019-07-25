# Mozilla Native
dep "cmake.managed" do provides "cmake" end

# TODO(low): Install [rr](https://github.com/mozilla/rr/)
dep "mozilla native" do
    requires "cmake.managed"
end