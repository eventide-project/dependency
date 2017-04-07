require_relative 'test_init'

require 'test_bench/cli'

TestBench::CLI.(
  exclude_pattern: '/_|sketch|(_init\.rb|_tests\.rb)\z',
  tests_directory: 'test/automated'
) or exit 1
