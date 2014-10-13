# chef-pagekit

This cookbook is used to install all prerequisite so pagekit can work. I use it for devolpement only. Please feel free to go get some information on this software on their web site : http://www.pagekit.com/

## Supported Platforms

* Debian (the only platform i use actually)

## Attributes

There is no real attributes for this cookbook.

## Usage

### pagekit::default

Include `pagekit` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[pagekit::default]"
  ]
}
```

## License and Authors

Author:: Léonard TAVAE (leonard.tavae@gmail.com)
