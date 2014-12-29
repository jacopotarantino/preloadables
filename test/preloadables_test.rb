require 'test_helper'

class PreloadablesTest < ActionView::TestCase
  include Preloadables::ApplicationHelper

  test 'the module should be defined' do
    assert_kind_of Module, Preloadables
  end
end


class AllPreloadablesTest < ActionView::TestCase
  include Preloadables::ApplicationHelper

  test 'it renders nothing when passed an empty hash' do
    empty_hash = {}
    assert_equal '', preloadables_meta(empty_hash)
  end

  test 'it renders dns prefetching meta' do
    preloadable_options = {
      domains: [
        'google.com',
        'jack.ofspades.com'
      ],
      assets: [
        'http://jack.ofspades.com/assets/js/application.js',
        '/foo/bar/baz.min.css'
      ],
      pages: [
        '/page2.html',
        'https://jack.ofspades.com/contact/'
      ]
    }

    expected_output = '<link rel="dns-prefetch" href="google.com"><link rel="dns-prefetch" href="jack.ofspades.com">'
    expected_output << '<link rel="prefetch" href="http://jack.ofspades.com/assets/js/application.js"><link rel="prefetch" href="/foo/bar/baz.min.css">'
    expected_output << '<link rel="prerender" href="/page2.html"><link rel="prerender" href="https://jack.ofspades.com/contact/">'

    assert_equal expected_output, preloadables_meta(preloadable_options)
  end

end


class PreloadableDomainsTest < ActionView::TestCase
  include Preloadables::ApplicationHelper

  test 'it renders nothing when passed an empty array' do
    empty_array = Array.new
    assert_equal '', preload_domains_meta(empty_array)
  end

  test 'it renders dns prefetching meta' do
    preloadable_options = [
      'google.com',
      'jack.ofspades.com'
    ]

    expected_output = '<link rel="dns-prefetch" href="google.com"><link rel="dns-prefetch" href="jack.ofspades.com">'

    assert_equal expected_output, preload_domains_meta(preloadable_options)
  end

end


class PreloadableAssetsTest < ActionView::TestCase
  include Preloadables::ApplicationHelper

  test 'it renders nothing when passed an empty array' do
    empty_array = Array.new
    assert_equal '', preload_assets_meta(empty_array)
  end

  test 'it renders asset preloading meta' do
    preloadable_options = [
      'http://jack.ofspades.com/assets/js/application.js',
      '/foo/bar/baz.min.css'
    ]

    expected_output = '<link rel="prefetch" href="http://jack.ofspades.com/assets/js/application.js"><link rel="prefetch" href="/foo/bar/baz.min.css">'

    assert_equal expected_output, preload_assets_meta(preloadable_options)
  end

end


class PrerenderablePagesTest < ActionView::TestCase
  include Preloadables::ApplicationHelper

  test 'it renders nothing when passed an empty array' do
    empty_array = Array.new
    assert_equal '', prerender_pages_meta(empty_array)
  end

  test 'it renders dns prefetching meta' do
    preloadable_options = [
      '/page2.html',
      'https://jack.ofspades.com/contact/'
    ]

    expected_output = '<link rel="prerender" href="/page2.html"><link rel="prerender" href="https://jack.ofspades.com/contact/">'

    assert_equal expected_output, prerender_pages_meta(preloadable_options)
  end

end
