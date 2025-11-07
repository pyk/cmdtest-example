This is example of Zig project that uses
[cmdtest](https://github.com/pyk/cmdtest).

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
   ├─ run test cmdtest-example 2 passed 2ms MaxRSS:2M
   │  ├─ compile test cmdtest-example Debug native success 370ms MaxRSS:125M
   │  └─ install cached
   │     └─ install cmdtest-example cached
   │        └─ compile exe cmdtest-example Debug native cached 10ms MaxRSS:39M
   └─ run test echo 1 passed 1ms MaxRSS:2M
      ├─ compile test echo Debug native cached 9ms MaxRSS:38M
      └─ install (+1 more reused dependencies)
   ```
