## Artoo code examples

This is a work in progress collection of example ruby scripts that make use of the awesome [artoo.io](http://artoo.io/) framework.

These examples aim to bridge the gap of being familiar with the low level technical aspects of controlling hardware (with a platform such as Arduino) and popular coding practices used by rubyists.

+ It will illustrate to someone who knows Arduino but is new to ruby how to set up a ruby project and hook in classes, gems and tests.
+ It will show someone who is familiar with ruby how to use Artoo and provide guidelines of how to extend the framework by adding hardware drivers etc.

The Artoo framework provides the perfect setting for these two worlds to connect. The more I use it the more impressed I am with how it has been put together, I am convinced that Artoo could become the Ruby on Rails of the hardware world.         

## How to run the examples

Run the following command from the project root folder to run the traffic light example:

```
$ artoo start examples/traffic_light_robot.rb

```
I will be adding documentation for the example (as well as more examples) soon.

## Installation

First follow the Artoo documentation's [setup instructions](http://artoo.io/documentation/platforms/arduino/) that explain how to connect to an Arduino board and upload the Firmata protocol.

Once you are sure you know how to run an artoo script, clone this repo and run the following command from the project root folder to install the gems required to run the examples

```
$ bundle install

```

## Tests

In the project root folder:

```
$ rspec ./spec/models/traffic_light_spec.rb
```

Will fire up rspec to run unit tests on the `TrafficLight` class that lives in the `models` folder   

## License

This project is licensed under the terms of the MIT license.
