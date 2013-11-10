Redis on Windows
================

This project contains the binary releases of MS Open Tech redis port of windows as well as a vagrant configuration for redis letting you run the native version of Redis in a Virtual Box VM.

Whilst it's recommended to use [Redis](http://redis.io) on Linux in production, it is often useful for developers on Windows platforms to have their own local version of redis running to develop with. 

The 2 most popular ways of running redis on windows is to use the binary releases of [Microsoft's native port of redis](https://github.com/msopentech/redis), but as this is an unofficial port it always lags behind the latest official development of redis on linux/OSX. 

Thanks to [Vagrant](http://www.vagrantup.com/) you can also run the latest linux version inside a Virutal Box Linux VM, which as it lets you run the official native version of redis, is our preferred approach:

## Running the latest version of Redis with Vagrant

#### 1. [Install Vagrant on Windows](http://docs-v1.vagrantup.com/v1/docs/getting-started/index.html)

#### 2. Download the **[redis-vagrant.zip](https://raw.github.com/mythz/redis-windows/master/downloads/redis-vagrant.zip)** vagrant configuration

    wget https://raw.github.com/mythz/redis-windows/master/downloads/redis-vagrant.zip

#### 3. Extract **redis-vagrant.zip** in any folder, e.g. in `c:\vagrant-redis`

#### 4. Launch the Virtual Box VM with **vagrant up**

    cd c:\vagrant-redis
    vagrant up

This will launch a new Ubuntu VM instance inside Virtual Box that will download and start the latest stable version of redis.

_The vagrant configuration was originally from [github.com/JasonPunyon/redishobo](https://github.com/JasonPunyon/redishobo) and has been modified to use the latest stable release of Redis._

## Running Microsoft's native port of Redis

These 64-bit binary releases are created by building the [Microsoft's native port of redis](https://github.com/msopentech/redis) which have also been published on [NuGet](http://www.nuget.org/packages/redis-64), but as it's more convenient we provide a zip of the 64-bit binaries here.

#### 1. Download the **[redis64-latest.zip](https://raw.github.com/mythz/redis-windows/master/downloads/redis64-latest.zip)** native 64bit Windows port of redis

    wget https://raw.github.com/mythz/redis-windows/master/downloads/redis64-latest.zip

#### 2. Extract **redis64-latest.zip** in any folder, e.g. in `c:\redis`

#### 3. Run the **redis-server.exe** using the local configuration

    cd c:\redis
    redis-server.exe redis.conf

#### 4. Run **redis-cli.exe** to connect to your redis instance

    cd c:\redis
    redis-cli.exe

#### 5. Start plaing with redis :)

    redis 127.0.0.1:6379> SET foo bar
    OK
    redis 127.0.0.1:6379> KEYS *
    1) "foo"
    redis 127.0.0.1:6379> GET foo
    "bar"
    redis 127.0.0.1:6379>