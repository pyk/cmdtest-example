This is example of Zig project that uses
[exetest](https://github.com/pyk/exetest).

1. Install Zig via mise (Optional)

   ```shell
   mise trust
   mise install
   ```

2. Run the test:

   ```shell
   zig build test --summary all
   ```

   Example output:

   ```shell
   Build Summary: 8/8 steps succeeded; 3/3 tests passed
   test success
   ├─ run test exetest-example 2 passed 1ms MaxRSS:2M
   │  ├─ compile test exetest-example Debug native cached 9ms MaxRSS:39M
   │  └─ install cached
   │     └─ install exetest-example cached
   │        └─ compile exe exetest-example Debug native cached 9ms MaxRSS:39M
   └─ run test echo 1 passed 1ms MaxRSS:2M
      ├─ compile test echo Debug native cached 9ms MaxRSS:39M
      └─ install (+1 more reused dependencies)
   ```
