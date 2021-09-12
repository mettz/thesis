# Solidity Compiler Development Notes

## Testing

Here are some useful command to interact with [Boost.Test](https://www.boost.org/doc/libs/1_70_0/libs/test/) unit test framework:

- to list all tests cases and suites run:

  ```bash
  ./scripts/soltest.sh --boost-options "--list_content" --

  # Output example
  gasTests*
    abiv2*
    data_storage*
    dispatch_small_optimised*
    dispatch_medium_optimised*
    dispatch_medium*
  ...
  ```

- to run just a single test (e.g. `abiv2` from above) you have to specify the full path to the test (or see other available options [here](https://www.boost.org/doc/libs/1_70_0/libs/test/doc/html/boost_test/runtime_config/test_unit_filtering.html)):
  ```bash
  ./scripts/soltest.sh --show-progress --boost-options "--run_test=gasTests/abiv2" --
  ```
  Also be careful that some tests may require additional flags such as `--vm evmone/lib/libevmone.dylib`
docker run -v ~/Uni/thesis/solidity:/root/project -t ghcr.io/ethereum/solidity-buildpack-deps/emscripten bash -c "/root/project/scripts/ci/build_emscripten.sh"
