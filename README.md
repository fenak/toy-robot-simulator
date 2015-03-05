Toy Robot Simulator
===================

This is a solution for the Toy Robot Simulator problem.

Usage
-----

```bash
./bin/toy-robot-simulator input-file
```

You can optionally pass on a number for the table top size (default to 5), like the example below:

```bash
./bin/toy-robot-simulator -s 4 samples/input_3.txt
```

There are some sample data in the ```samples``` folder, but you can create and run over your own custom instructions file using them as examples.

Running tests
-------------

Simply run:

```bash
rake test
```

