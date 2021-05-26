myplug
=====

A rebar plugin

Build
-----

    $ rebar3 compile

Use
---

Add the plugin to your rebar config:

    {plugins, [
        {myplug, {git, "https://host/user/myplug.git", {tag, "0.1.0"}}}
    ]}.

Then just call your plugin directly in an existing application:


    $ rebar3 myplug
    ===> Fetching myplug
    ===> Compiling myplug
    <Plugin Output>
