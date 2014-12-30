# Preloadables

Preloadables is a Rails gem exposing a set of view helpers for outputting HTML metadata related to domains, assets and pages that you would like to preload/prerender. Adding these links to your <head> can dramatically speed up your website by directing the browser to perform certain actions before they're needed.

[![Code Climate](https://codeclimate.com/github/jacopotarantino/preloadables/badges/gpa.svg)](https://codeclimate.com/github/jacopotarantino/preloadables)

[![Test Coverage](https://codeclimate.com/github/jacopotarantino/preloadables/badges/coverage.svg)](https://codeclimate.com/github/jacopotarantino/preloadables)

A word of caution: while preloading assets and prerendering pages is a brilliant technology that can dramatically speed up your website it can consume a ton of local resources and make too many network requests on connections that are bandwidth limited. I strongly encourage you to only preload assets that you're very confident the visitor will need soon and definitely only prerender a page if you're certain the visitor will go there next.


## Installation

Add `gem 'preloadables'` to your Gemfile or if you're using gemspec:

```ruby
Gem::Specification.new do |s|
  s.add_dependency 'preloadables'
end
```


## Usage

```html
<!-- in your views/layouts/layout.html.erb or maybe an _head.html.erb partial -->
<doctype html>
<html>
  <head>
    <title>my webpage</title>

    <%= preloadables_meta(@preloadables) %>

    <!-- stylesheet links, js, etc... -->
  </head>

  <body>
    <!-- site content... -->
  </body>
</html>
```

```ruby
# in your controllers/my_app/application_controller.rb controller or other route controller
module MyApp

  def show
    @preloadables = {
      domains: [
        'my.asset.subdomain.com'
      ],
      assets: [
        '/assets/js/application_helper.js',
        '/assets/stylesheets/contact_page.css'
      ],
      pages: [
        '/page_2.html'
      ]
    }

    render :show, layout: 'my_app/layout'
  end

end
```


## Methods

`preloadable_meta` is the main method and takes a hash of arguments for outputting all 3 kinds of preloading meta tags. If you prefer, you can also use one of the 3 other methods for more specific control.

### preloadable_meta

Takes a hash with properties `domains`, `assets` and `pages`(all of which are arrays) and outputs relevant meta tags for each of them.

### preload_domains_meta

Takes an array of domains to prefetch dns for.

### preload_assets_meta

Takes an array of asset urls to prefetch.

### prerender_pages_meta

Takes an array of page urls to prerender.


## Development

* Clone the repo
* Run `gem install bundler`
* Run `bundle`
* Make sure everything works by running `bundle exec rake`
* Make your changes in the tests and documentation and then the code
* Commit changes, push them up to a branch and make a pull request


## Testing

The default rake task includes running the tests so a simple `rake` on the command line with run the test suite.


## License

This project is released under a Creative Commons Attribution-ShareAlike license. This requires that you both credit the original author and open source your own project. Long live open source software!
