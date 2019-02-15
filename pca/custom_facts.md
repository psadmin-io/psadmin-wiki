---
title: Custom Facts
layout: en
permalink: /posts/pca/custom_facts/
---

You can easily deploy custom facts to your server for use with the DPK and Puppet. Facter has a number of built-in facts, like `::hostname`, but we can use our own.

## facts.d

Under the `C:\ProgramData\puppetlabs\facter\facts.d\` folder, we can put YAML file with custom values.

```yaml
---
ps_role:    provider
region:     dev
app:        hr
```

You can save the file as `facts.yaml`.

## Ruby Facts

Another option is to implement facts via Ruby. There are many locations the ruby script can live, but one option is to create a new "facts" module under the delivered `modules` directory. Create a folder structure similar to this:

```
modules
   └───facts
         └───lib
              └───facter

```

In this directory, create a script such as `facts.rb`: 

```ruby
require 'facter'

Facter.add(:application) do
  setcode do
    application = 'hcm'
    application
  end
end    
```
In these scripts you can use all sorts of logic using other facts, regex, and conditionals to create facts based upon the current environment (such as hostname, operating system, other facts, etc). This is just a small hardcoded example.
   
## Hiera and Custom Facts

In your `psft_customizations.yaml` file, you can reference these facts. For example, if you wanted your PIA domains to include the region in the name, the YAML would look like this:

```yaml
pia_domain_list:
  "peoplesoft-%{::region}":
```

## Fact Override

You can also override some facts using environment variables. To override a fact, set an environment variable like `$env:FACTER_factname="newvalue"`. The environment variable must start with `FACTER_`.
