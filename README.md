nginx-redirect cookbook - Wraps nginx cookbook for simple vhost to redirect

## Supported Platforms
Ubuntu 14.04 LTS (probably works on other platforms, but this is what we test on)

## Recipes
| Name | Description |
|:-----|:------------|
| `default` | Install and configure the redirection sites, if none configured, will do nothing

## Attributes

| attribute | default setting | description |
|:---------------------------------|:---------------|:-----------------------------------------|
|`default['nginx-redirect'][:redirections]`| `[]` | Array of vhost redirection mappings |
|`default['nginx-redirect'][:redirections][0][:host]`| `` | Host to listen as |
|`default['nginx-redirect'][:redirections][0][:to]`| `` | Host to redirect requests to |
|`default['nginx-redirect'][:redirections][0][:ssl_key]`| `` | path to SSL key (you are using HTTPS, aren't you? ;-) ) |
|`default['nginx-redirect'][:redirections][0][:ssl_certificate]`| `` | path to SSL certificate (you are using HTTPS, aren't you? ;-) ) |


## Usage
Simply add nginx-redirect to your run_list:
````
recipe[nginx-redirect]
````
and set attributes on the node like so:
````
nginx-redirect: {
  redirections: [
    {
      "host": "oldhost.domain.com",
      "to": "newhost.domain.com"
    }
  ]
}
````

## License and Author

|                      |                                                |
|:---------------------|:-----------------------------------------------|
| **Original Author**  | [Geoforce, Inc.]( https://github.com/geoforce) |

The MIT License (MIT)

Copyright (c) 2017 Geoforce, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
